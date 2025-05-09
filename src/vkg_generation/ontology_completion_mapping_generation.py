from rdflib import URIRef, Graph, Namespace, RDF, BNode, Literal, XSD, RDFS, OWL
from sentence_transformers import SentenceTransformer
from tqdm import tqdm

from src.db_utils.db_utils import get_table_structure, db_config, get_all_databases
from src.llm.utils.answer_format.utils import DynamicModelBuilder
from src.llm.utils.langchain_utils import Modules
from src.strategy.base import Strategy
from src.utils.tools import load_json_file, create_literal_from_list
from src.vkg_generation.VKGDatasets import OntologyDataset, TableDataset
from src.vkg_generation.vkg_utils import get_default_namespace, add_subject_map, add_predicate_dataproperty_map, \
    add_logical_table, find_topmost_ancestor, get_owl_entity_type, add_predicate_objectproperty_map, retrive_topk, \
    check_domain_and_range, check_domain_and_range_for_all_super_and_sub_class, get_all_related_iri

table_col_sep = "$$$$"

class OntologyCompletion(Strategy):
    def __init__(self, db_schema, modules: Modules, **kwargs):
        super().__init__(modules)
        self.name = "OntologyCompletion"
        self.db_schema = db_schema

        self.retriver = SentenceTransformer('BAAI/bge-m3', device="cuda")

        # self.classifier = pipeline("zero-shot-classification", model=model_name, device="cuda")

        self.match_labels =  ["highly matching", "moderately matching", "mismatched"]

    def _retrive_topk(self, source:list[str], target:list[str], retrive_target_num=3):
        source_embs = self.retriver.encode(source, convert_to_tensor=True)
        target_embs = self.retriver.encode(target, convert_to_tensor=True)

        retrive_target_num = min(retrive_target_num, len(target_embs))
        retrived_idxes = (source_embs @ target_embs.T).topk(retrive_target_num, dim=1)

        return retrived_idxes.indices, retrived_idxes.values

    def _predict_matching_label(self, DB_concept_names, Ontology_concept_names, Ontology_concept_uri, retrived_idxes, retrived_values):
        db2o_pair = {}
        for DB_name, DB_idex, cls_values in zip(DB_concept_names, retrived_idxes, retrived_values):
            db2o_pair[DB_name] = []
            for idx, value in zip(DB_idex, cls_values):
                db2o_pair[DB_name].append((Ontology_concept_names[idx], Ontology_concept_uri[idx], value.item()))

        candidate_labels = self.match_labels

        match_model = DynamicModelBuilder.build(
            "match_model",
            attrs=[
                ("label", create_literal_from_list(candidate_labels)),
                ("confidence", float),
            ]
        )

        chain_match = self._getm_list(["prompt::pair_classification", "llm::free_talk", "parser::to_json"])
        chain_match.steps[-2].response_format = match_model

        pair_match = []
        for DB_name, cls_names_uris_values in tqdm(list(db2o_pair.items()), desc="_predict_matching_label"):

            tname_pairs = []
            for cls_name, uri, value in cls_names_uris_values:
                r = chain_match.invoke({"database":DB_name, "ontology":cls_name})
                if r["label"] != candidate_labels[-1]:
                    tname_pairs.append((value*r["confidence"], r["label"],cls_name, uri))

            tname_pairs = sorted(tname_pairs, reverse=True)

            if tname_pairs:
                final_label = tname_pairs[0]
            else:
                final_label = (1.0, candidate_labels[-1], None, None)
            pair_match.append((DB_name, final_label))

        return pair_match

    def _predict_matching_label_v2(self, DB_concept_names, Ontology_concept_names, Ontology_concept_uri, retrived_idxes, retrived_values):
        db2o_pair = {}
        for DB_name, DB_idex, cls_values in zip(DB_concept_names, retrived_idxes, retrived_values):
            db2o_pair[DB_name] = []
            for idx, value in zip(DB_idex, cls_values):
                db2o_pair[DB_name].append((Ontology_concept_names[idx], Ontology_concept_uri[idx], value.item()))

        candidate_labels = self.match_labels

        chain_match = self._getm_list(["prompt::pair_prediction", "llm::free_talk", "parser::to_json"])

        pair_match = []
        for DB_name, cls_names_uris_values in tqdm(list(db2o_pair.items()), desc="_predict_matching_label"):

            target_concepts = [i[0] for i in cls_names_uris_values]
            name2iri = {i[0]:i[1] for i in cls_names_uris_values}

            match_model = DynamicModelBuilder.build(
                "match_model",
                attrs=[
                    ("target_concept", create_literal_from_list(target_concepts + [None])),
                    ("label", create_literal_from_list(candidate_labels)),
                ]
            )
            chain_match.steps[-2].response_format = match_model
            r = chain_match.invoke({"source_concept": DB_name, "target_concepts": target_concepts})

            if r["label"] != candidate_labels[-1]:
                final_label = (1.0, r["label"], r["target_concept"], name2iri[r["target_concept"]])
            else:
                final_label = (1.0, candidate_labels[-1], None, None)
            pair_match.append((DB_name, final_label))

        return pair_match

    def _modify_ontology_by_match_results(self, pair_match, ontology, add_func, db2o):
        # modify -> update
        variable_name_model = DynamicModelBuilder.build(
            "variable_name_model",
            attrs=[
                ("name", str),
            ]
        )
        chain_generate_name = self._getm_list(["prompt::generate_variable_name", "llm::free_talk", "parser::to_json"])
        chain_generate_name.steps[-2].response_format = variable_name_model
        for matched in tqdm(pair_match):
            source, target = matched
            label = target[1]
            oname = target[-2]
            iri = target[-1]

            if label == self.match_labels[0]:
                # highly matching
                db2o[source] = (URIRef(iri), find_topmost_ancestor(ontology.graph, URIRef(iri)))
            elif label == self.match_labels[1]:
                r = chain_generate_name.invoke({"source_DB_concept": source, "target_Ontology_concept": oname})
                sub_iri = add_func(r["name"], parent_iri=iri)
                db2o[source] = (URIRef(sub_iri), find_topmost_ancestor(ontology.graph, URIRef(sub_iri)))
            elif label == self.match_labels[2]:
                r = chain_generate_name.invoke({"source_DB_concept": source})
                iri = add_func(r["name"])
                db2o[source] = (URIRef(iri), find_topmost_ancestor(ontology.graph, URIRef(iri)))
            else:
                raise NotImplementedError
        # 还需要实现data properties
        return ontology, db2o

    def run_ontology_completion(self, ontology:OntologyDataset, table:TableDataset, retrive_num=50):
        table_names = table.get_table_names()
        class_names, class_uris = ontology.get_attr_names("class")
        obj_names, obj_uris = ontology.get_attr_names("object property")
        class_names = class_names + obj_names
        class_uris = class_uris + obj_uris
        class_retrived_idxes, class_retrived_values = self._retrive_topk(table_names, class_names, retrive_num)

        class_pair_match = self._predict_matching_label_v2(table_names, class_names, class_uris, class_retrived_idxes, class_retrived_values)

        col_names = table.get_column_names()
        data_names, data_uris = ontology.get_attr_names("data property")
        data_retrived_idxes, data_retrived_values = self._retrive_topk(col_names, data_names, retrive_num)
        data_pair_match = self._predict_matching_label_v2(col_names, data_names, data_uris, data_retrived_idxes, data_retrived_values)

        pair_match = class_pair_match + data_pair_match

        # torch.save(pair_match, 'outputs/test/OC-pair_match.pt')
        # pair_match = torch.load('outputs/test/OC-pair_match.pt')
        db2o = {}
        variable_name_model = DynamicModelBuilder.build(
            "variable_name_model",
            attrs=[
                ("name", str),
            ]
        )
        chain_generate_name = self._getm_list(["prompt::generate_variable_name", "llm::free_talk", "parser::to_json"])
        chain_generate_name.steps[-2].response_format = variable_name_model

        for matched in tqdm(pair_match, desc="OC-pair-matching"):
            source, target = matched
            label = target[1]
            oname = target[-2]
            iri = target[-1]

            iri_type = get_owl_entity_type(iri, ontology.graph)
            if iri_type == "owl:Class":
                # property
                add_func = ontology.add_class
            elif iri_type == "owl:ObjectProperty":
                # class
                add_func = ontology.add_object_property
            elif iri_type == "owl:DataProperty":
                add_func = ontology.add_data_property
            elif "table" in source and "column" in source:
                # property
                add_func = ontology.add_data_property
            else:
                # class
                add_func = ontology.add_class

            if label == self.match_labels[0]:
                # highly matching
                db2o[source] = (URIRef(iri), find_topmost_ancestor(ontology.graph, URIRef(iri)))
            elif label == self.match_labels[1]:
                r = chain_generate_name.invoke({"source_DB_concept": source, "target_Ontology_concept": oname})
                sub_iri = add_func(r["name"], parent_iri=iri)
                db2o[source] = (URIRef(sub_iri), find_topmost_ancestor(ontology.graph, URIRef(sub_iri)))
            elif label == self.match_labels[2]:
                r = chain_generate_name.invoke({"source_DB_concept": source})
                iri = add_func(r["name"])
                db2o[source] = (URIRef(iri), find_topmost_ancestor(ontology.graph, URIRef(iri)))
            else:
                raise NotImplementedError

        col_names = table.get_column_names()
        col_dict_names = table.get_column_names(mode="dict")
        for c, cd, in zip(col_names, col_dict_names):
            new_desc = cd["table_name"] + table_col_sep + cd["column_name"]
            db2o[new_desc] = db2o[c]
            del db2o[c]
        return ontology, db2o

class MappingGeneration(OntologyCompletion):
    def __init__(self, modules: Modules, db_schema:str, **kwargs):
        OntologyCompletion.__init__(self, db_schema=db_schema, model_name=None, modules=modules, **kwargs)
        self.name = "MappingGeneration"

        self.mapping_handle_function = {
            "SE": self._handle_SE,
            "SR": self._handle_SR,
            "SRm": self._handle_SRm,
            "SH": self._handle_SH,
        }

        self.mapping_pattern_order = ["SH", "SR", "SRm", "SE"] #, "SR"] # , "SRm"]

        self.mapping = Graph()
        self.rr = Namespace("http://www.w3.org/ns/r2rml#")
        self.mapping.bind("rr", self.rr)

        self.type_mapping = {
            'string': XSD.string,
            'integer': XSD.int,
            'float': XSD.float,
            'boolean': XSD.boolean,
            'date': XSD.date,
            'datetime': XSD.dateTime,
            'url': XSD.anyURI,
            # 根据需要添加更多类型映射
        }

        self.class2iri = {}

    def _copy_namespaces(self, o_graph):
        for prefix, namespace in o_graph.namespaces():
            self.mapping.bind(prefix, namespace)

    def _handle_SH(self, table, db2o, ontology:OntologyDataset, mapping_patterns, original_ontology:OntologyDataset, **kwargs):
        for T_E, K_E, K_FE, T_F in tqdm(mapping_patterns, desc="SH-mapping"):
            # ensure T_E and T_F are classes

            T_E_iri = db2o[T_E][0]
            T_F_iri = db2o[T_F][0]

            if ((T_E_iri, None, None) not in original_ontology.graph or
                    get_owl_entity_type(T_E_iri, original_ontology.graph) != "owl:Class" or
                    (T_F_iri, RDFS.subClassOf, T_E_iri) not in ontology.graph):
                names = [T_E]
                class_names, class_uris = original_ontology.get_attr_names("class")
                retrived_idxes, retrived_values = self._retrive_topk(names, class_names, 10)
                pair_match = self._predict_matching_label_v2(names, class_names, class_uris,
                                        retrived_idxes, retrived_values)
                if db2o[T_E][0] != pair_match[-1][-1][-1]:
                    print(T_E, db2o[T_E][0], '->', pair_match[-1][-1][-1])
                    self._modify_ontology_by_match_results(pair_match, ontology, ontology.add_class, db2o)

            if ((T_F_iri, None, None) not in original_ontology.graph or
                    get_owl_entity_type(T_F_iri, original_ontology.graph) != "owl:Class" or
                    (T_F_iri, RDFS.subClassOf, T_E_iri) not in ontology.graph):
                names = [T_F]
                class_names, class_uris = original_ontology.get_attr_names("class")
                retrived_idxes, retrived_values = self._retrive_topk(names, class_names, 10)
                pair_match = self._predict_matching_label_v2(names, class_names, class_uris,
                                                          retrived_idxes, retrived_values)
                if db2o[T_F][0] != pair_match[-1][-1][-1]:
                    print(T_F, db2o[T_F][0], '->', pair_match[-1][-1][-1])
                    self._modify_ontology_by_match_results(pair_match, ontology, ontology.add_class, db2o)

            iri_T_E = db2o[T_E][0]
            iri_T_F = db2o[T_F][0]
            iri_T_F_A = find_topmost_ancestor(original_ontology.graph, URIRef(iri_T_F))
            iri_T_E_A = find_topmost_ancestor(original_ontology.graph, URIRef(iri_T_E))

            if iri_T_F_A != iri_T_E_A and (iri_T_F, RDFS.subClassOf, iri_T_E) not in ontology.graph:
                ontology.graph.add((iri_T_F, RDFS.subClassOf, iri_T_E))

            # change the original ontology
            if (iri_T_F, None, None) not in original_ontology.graph:
                original_ontology.add_class(iri=iri_T_F)

            if (iri_T_E, None, None) not in original_ontology.graph:
                original_ontology.add_class(iri=iri_T_E)

            # TF and TE do not have tha same ancestor, TF is not the sub class of TE
            if iri_T_F_A != iri_T_E_A and (iri_T_F, RDFS.subClassOf, iri_T_E) not in original_ontology.graph:
                # set TF is the sub class of TE
                sub_path = [iri_T_F]
                for _ in range(10):
                    c_iri = sub_path[-1]
                    c_sups = list(ontology.graph.objects(subject=c_iri, predicate=RDFS.subClassOf))

                    if not c_sups:
                        break

                    flag_sup = False
                    for c_sup in c_sups:
                        if type(c_sup) == URIRef:
                            if (c_sup, None, None) in original_ontology.graph:
                                sub_path.append(c_sup)
                                flag_sup = True
                                break

                    if not flag_sup:
                        sub_path.append(c_sups[0])

                    if (sub_path[-1], None, None) in original_ontology.graph:
                        break

                for i in range(len(sub_path)-1):
                    original_ontology.graph.add((sub_path[i], RDFS.subClassOf, sub_path[i+1]))

        # reset the topmost ancestors
        for k, v in tqdm(db2o.items(), desc="SH-mapping rebuild db2o"):
            if table_col_sep not in k:
                db2o[k] = (v[0], find_topmost_ancestor(original_ontology.graph, URIRef(v[0])))

    def _handle_SE(self, table, db2o, ontology, mapping_patterns, original_ontology:OntologyDataset, **kwargs):
        merge_pk = {}
        for t, pk in mapping_patterns:
            if t not in merge_pk:
                merge_pk[t] = []
            merge_pk[t].append(pk)
            merge_pk[t] = sorted(merge_pk[t])

        # set the number of primary keys for each table and classes
        # find the minimum number of primary keys
        for k, v in merge_pk.items():
            iri_target = db2o[k][1]
            if iri_target not in self.class2iri:
                self.class2iri[iri_target] = {"attr_num":len(v)}
            else:
                if len(v) < self.class2iri[iri_target]["attr_num"]:
                    self.class2iri[iri_target]["attr_num"] = len(v)

        g = self.mapping
        rr = self.rr
        default = get_default_namespace(g)
        type_mapping = self.type_mapping
        for t, pks in merge_pk.items():
            t_class = db2o[t][0]
            t_class_ancestor = db2o[t][1]

            # check if the number of the primary key follows the minimum number
            if len(pks) != self.class2iri[t_class_ancestor]["attr_num"]:
                continue

            # only handle classes here
            if get_owl_entity_type(t_class_ancestor, ontology.graph) != "owl:Class":
                continue

            if (t_class_ancestor, None, None) not in original_ontology.graph:
                sub_path = [t_class]
                for _ in range(10):
                    c_iri = sub_path[-1]
                    c_sups = list(ontology.graph.objects(subject=c_iri, predicate=RDFS.subClassOf))

                    if not c_sups:
                        break

                    flag_sup = False
                    for c_sup in c_sups:
                        if type(c_sup) == URIRef:
                            if (c_sup, None, None) in original_ontology.graph:
                                sub_path.append(c_sup)
                                flag_sup = True
                                break

                    if not flag_sup:
                        sub_path.append(c_sups[0])

                    if (sub_path[-1], None, None) in original_ontology.graph:
                        break

                for i in range(len(sub_path) - 1):
                    original_ontology.graph.add((sub_path[i], RDFS.subClassOf, sub_path[i + 1]))

            triples_map = URIRef(f"urn:r2rml:SE-{t}")

            g.add((triples_map, RDF.type, rr.TriplesMap))

            # subjectMap
            subject_map = BNode()
            add_subject_map(g=g, triples_map=triples_map, subject_map=subject_map, rdf_class=t_class,
                            template_url=Literal(t_class_ancestor + '/' + '/'.join(["{" + pk + "}" for pk in pks])),
                            rr=rr)

            # predicateObjectMap for each column
            for col_info in table.table_info[t]['columns']:
                col = col_info['column_name']
                data_type = col_info['data_type']

                if col_info['is_primary_key']:
                    continue

                predicate_uri = db2o[t+table_col_sep+col][0]
                predicate_uri_ancentor = db2o[t+table_col_sep+col][1]

                # set default type as XSD:string
                datatype = type_mapping.get(data_type.lower(), XSD.string)

                # check if there are predefined types in ontology
                uri_range = list(ontology.graph.objects(subject=predicate_uri, predicate=RDFS.range))
                find_flag = False

                if len(uri_range) > 0:
                    for uri in uri_range:
                        if type(uri) == URIRef:
                            datatype = uri
                            find_flag = True
                            break
                if not find_flag:
                    # 如果没有找到 rdfs:range，则查找 predicate_uri 的父属性
                    super_range = list(ontology.graph.objects(subject=predicate_uri_ancentor, predicate=RDFS.range))
                    for uri in super_range:
                        if isinstance(uri, URIRef):
                            datatype = uri
                            break
                if type(predicate_uri) != URIRef:
                    predicate_uri = URIRef(predicate_uri)
                if (predicate_uri, RDF.type, OWL.DatatypeProperty) in original_ontology.graph:
                    add_predicate_dataproperty_map(g, triples_map, predicate_uri, col, datatype, rr)
                else:
                    continue

                # check if the original ontology has the data property
                if (predicate_uri, None, None) not in original_ontology.graph:
                    original_ontology.add_data_property(iri=predicate_uri)

                if (predicate_uri_ancentor, None, None) in original_ontology.graph and predicate_uri_ancentor != predicate_uri:
                    domains_of_super_property = list(ontology.graph.objects(predicate_uri_ancentor, RDFS.domain))
                    related_iris = get_all_related_iri(ontology.graph, RDFS.subClassOf, t_class)

                    domain_flag = False
                    for d in domains_of_super_property:
                        d_related_iris = get_all_related_iri(ontology.graph, RDFS.subClassOf, d)
                        for r in d_related_iris:
                            if r in related_iris:
                                domain_flag = True
                                break
                        if domain_flag:
                            break
                    # if the t_class is one of the domains of predicate_uri_ancentor, adding as sub property
                    if (predicate_uri, RDFS.subPropertyOf, predicate_uri_ancentor) not in original_ontology.graph and domain_flag:
                        sub_path = [predicate_uri]
                        for _ in range(10):
                            c_iri = sub_path[-1]
                            c_sups = list(ontology.graph.objects(subject=c_iri, predicate=RDFS.subPropertyOf))

                            if not c_sups:
                                break

                            flag_sup = False
                            for c_sup in c_sups:
                                if type(c_sup) == URIRef:
                                    if (c_sup, None, None) in original_ontology.graph:
                                        sub_path.append(c_sup)
                                        flag_sup = True
                                        break

                            if not flag_sup:
                                sub_path.append(c_sups[0])

                            if (sub_path[-1], None, None) in original_ontology.graph:
                                break

                        for i in range(len(sub_path) - 1):
                            original_ontology.graph.add((sub_path[i], RDFS.subPropertyOf, sub_path[i + 1]))
                        # original_ontology.graph.add((predicate_uri, RDFS.subPropertyOf, predicate_uri_ancentor))

            add_logical_table(g, triples_map, f'SELECT * FROM "{self.db_schema}"."{t}"', rr)

    def _handle_SR(self, table, db2o, ontology:OntologyDataset, mapping_patterns, original_ontology:OntologyDataset, **kwargs):
        g = self.mapping
        rr = self.rr
        default = get_default_namespace(g)
        type_mapping = self.type_mapping

        # merge the symmetric typle
        pattern_pair = []
        mapping_patterns_new = []
        saved_pair_item = []
        for mp in mapping_patterns:
            if mp in saved_pair_item:
                continue

            if mp[::-1] in mapping_patterns:
                pattern_pair.append([mp, mp[::-1]])
                saved_pair_item.append(mp)
                saved_pair_item.append(mp[::-1])
            else:
                pattern_pair.append(mp)
                saved_pair_item.append(mp)

        # decide the true order of a pair of symmetric tuples
        # generate a new object property for the tuple with wrong order
        # e.g. (Student, teaches, Teacher) and (Teacher, teaches, Student)
        # output: (Student, taughtBy, Teacher) and (Teacher, teaches, Student)
        chain_judge_order_and_rename = self._getm_list(["prompt::judge_order_and_rename", "llm::free_talk", "llm::free_talk", "parser::to_json"])
        for p in tqdm(pattern_pair, desc="_handle_SR_judge_order"):
            po1 = [p[0][0], p[0][3], p[0][6]]
            po2 = [p[1][0], p[1][3], p[1][6]]
            t1 = p[0][0]
            t2 = p[1][0]
            iri_t1 = db2o[t1][0]
            iri_t2 = db2o[t2][0]

            names = [p[0][3]]
            obj_names, obj_iris = original_ontology.get_attr_names("object property")
            retrived_idxes, retrived_values = self._retrive_topk(names, obj_names, 10)

            refer_names = [obj_names[i.item()] for i in retrived_idxes[0]]

            predefined_obj_12 = []
            predefined_obj_21 = []

            for obj_name, obj_iri in zip(obj_names, obj_iris):
                if check_domain_and_range_for_all_super_and_sub_class(iri=obj_iri, domain_=iri_t1, range_=iri_t2, graph=original_ontology.graph):
                    refer_names = [obj_name] + refer_names

                if check_domain_and_range_for_all_super_and_sub_class(iri=obj_iri, domain_=iri_t2, range_=iri_t1, graph=original_ontology.graph):
                    refer_names = [obj_name] + refer_names

            all_idxes, all_values = self._retrive_topk(names, obj_names, len(obj_names))
            all_idxes = all_idxes[0]
            for obj_idx in all_idxes:
                obj_iri = obj_iris[obj_idx]
                obj_name = obj_names[obj_idx]
                if check_domain_and_range(iri=obj_iri, domain_=iri_t1, range_=iri_t2, graph=original_ontology.graph):
                    predefined_obj_12.append((obj_name, obj_iri))

                if check_domain_and_range(iri=obj_iri, domain_=iri_t2, range_=iri_t1, graph=original_ontology.graph):
                    predefined_obj_21.append((obj_name, obj_iri))

            for obj_idx in all_idxes:
                obj_iri = obj_iris[obj_idx]
                obj_name = obj_names[obj_idx]
                if check_domain_and_range_for_all_super_and_sub_class(iri=obj_iri, domain_=iri_t1, range_=iri_t2, graph=original_ontology.graph):
                    predefined_obj_12.append((obj_name, obj_iri))

                if check_domain_and_range_for_all_super_and_sub_class(iri=obj_iri, domain_=iri_t2, range_=iri_t1, graph=original_ontology.graph):
                    predefined_obj_21.append((obj_name, obj_iri))


            data = {
                "order1": po1,
                "order2": po2,
                "refer_names": refer_names
            }

            rel_12 = f"relation name between {p[0][0]} and {p[0][-1]}"
            rel_21 = f"relation name between {p[1][0]} and {p[1][-1]}"

            judge_order_and_rename_model = DynamicModelBuilder.build(
                "judge_order_and_rename_model",
                attrs=[
                    (rel_12, str),
                    (rel_21, str),
                ]
            )
            chain_judge_order_and_rename.steps[-2].response_format = judge_order_and_rename_model
            r = chain_judge_order_and_rename.invoke(data)

            obj_12_iri = default[r[rel_12]]
            obj_21_iri = default[r[rel_21]]

            relation_table_name = po1[1]
            i = 0
            while relation_table_name in db2o:
                relation_table_name = po1[1] + table_col_sep + 'SR_' + str(i)
                i += 1

            relation_table_name_inverse = relation_table_name + table_col_sep + "inverse"

            if (check_domain_and_range_for_all_super_and_sub_class(iri=obj_12_iri, domain_=iri_t1, range_=iri_t2, graph=original_ontology.graph)):
                db2o[relation_table_name] = (obj_12_iri, find_topmost_ancestor(original_ontology.graph, obj_12_iri))
                p[0][3] = relation_table_name
                mapping_patterns_new.append(p[0])

            if (check_domain_and_range_for_all_super_and_sub_class(iri=obj_21_iri, domain_=iri_t2, range_=iri_t1, graph=original_ontology.graph)):
                db2o[relation_table_name_inverse] = (obj_21_iri, find_topmost_ancestor(original_ontology.graph, obj_21_iri))
                p[1][3] = relation_table_name_inverse
                mapping_patterns_new.append(p[1])

            if not (check_domain_and_range_for_all_super_and_sub_class(iri=obj_12_iri, domain_=iri_t1, range_=iri_t2, graph=original_ontology.graph) or
                    check_domain_and_range_for_all_super_and_sub_class(iri=obj_21_iri, domain_=iri_t2, range_=iri_t1, graph=original_ontology.graph)):
                if predefined_obj_12:
                    obj_iri = predefined_obj_12[0][1]
                    db2o[relation_table_name] = (obj_iri, find_topmost_ancestor(original_ontology.graph, obj_iri))
                    p[0][3] = relation_table_name
                    mapping_patterns_new.append(p[0])
                elif predefined_obj_21:
                    obj_iri = predefined_obj_21[0][1]
                    db2o[relation_table_name_inverse] = (obj_iri, find_topmost_ancestor(original_ontology.graph, obj_iri))
                    p[1][3] = relation_table_name_inverse
                    mapping_patterns_new.append(p[1])
                else:
                    pass
            pass

        saved_mappingid = []

        for T_E, K_E, K_RE, T_R, K_RF, K_F, T_F in mapping_patterns_new:
            iri = db2o[T_R][1]

            # only handle the object properties
            if get_owl_entity_type(iri, ontology.graph) != "owl:ObjectProperty":
                continue

            # ensure T_E and T_F match to classes
            if not (get_owl_entity_type(db2o[T_E][1], ontology.graph) == "owl:Class" and
                    get_owl_entity_type(db2o[T_F][1], ontology.graph) == "owl:Class" ):
                continue

            # check the primary key for TE and TF
            # now only consider the primary key with one column
            if not (self.class2iri[db2o[T_E][1]]["attr_num"] == 1 and self.class2iri[db2o[T_F][1]]["attr_num"] == 1):
                continue

            mapping_id = f"urn:r2rml:SR-{T_R}"
            if mapping_id in saved_mappingid:
                continue
            triples_map = URIRef(mapping_id)
            saved_mappingid.append(mapping_id)


            # subjectMap
            subject_map = BNode()
            pks_E = [K_RE]
            add_subject_map(g=g, triples_map=triples_map, subject_map=subject_map, rdf_class=db2o[T_E][0],
                            template_url=Literal(db2o[T_E][1] + '/' +  '/'.join(["{" + pk + "}" for pk in pks_E])),
                            rr=rr)
            pks_F = [K_RF]
            add_predicate_objectproperty_map(g, triples_map, db2o[T_R][1],
                                             Literal(db2o[T_F][1] + '/' +  '/'.join(["{" + pk + "}" for pk in pks_F])),
                                             rr)
            obj_iri = db2o[T_R][1]
            # check if the object property in the original ontology
            if (obj_iri, None, None) not in original_ontology.graph:
                original_ontology.add_object_property(iri=obj_iri)
            T_R_name = T_R.split(table_col_sep)[0]
            add_logical_table(g, triples_map, f'SELECT * FROM "{self.db_schema}"."{T_R_name}"', rr)

    def _handle_SRm(self, table, db2o, ontology, mapping_patterns, original_ontology:OntologyDataset, **kwargs):
        SRm_names = [i[2] for i in mapping_patterns]
        if not SRm_names:
            return

        merge_SRm = {}
        for K_E, T_E, K_EF, K_F, T_F in mapping_patterns:
            merge_key = f'{T_E}{table_col_sep}{K_EF}{table_col_sep}{K_F}{table_col_sep}{T_F}'
            if merge_key not in merge_SRm:
                merge_SRm[merge_key] = {}
                merge_SRm[merge_key] = []
            merge_SRm[merge_key].append(K_E)

        mp_tmp = []
        for key, K_Es in merge_SRm.items():
            T_E, K_EF, K_F, T_F = key.split(table_col_sep)
            K_E = sorted(K_Es)
            if len(K_E) == 1:
                K_E = K_E[0]
            mp_tmp.append([K_E, T_E, K_EF, K_F, T_F])
        mapping_patterns = mp_tmp

        # for mp in mapping_patterns:
        #     obj_col_name = f'{mp[1]}{table_col_sep}{mp[2]}'
        #     SRm_names.append(obj_col_name)
        #     mp[2] = obj_col_name
        mapping_patterns_checked = []
        for mp in tqdm(mapping_patterns, desc="SRm"):
            K_E, T_E, K_EF, K_F, T_F = mp
            obj_names, obj_iris = original_ontology.get_attr_names("object property")
            obj_retrived_idxes, obj_retrived_values = retrive_topk(self.retriver, [K_EF], obj_names, retrive_target_num=10)

            iri_t1 = db2o[T_E][0]
            iri_t1_ancestor = db2o[T_E][1]
            iri_t2 = db2o[T_F][0]
            iri_t2_ancestor = db2o[T_F][1]
            refer_names = [obj_names[i.item()] for i in obj_retrived_idxes[0]]

            predefined_E2F = []
            predefined_F2E = []
            for obj_name, obj_iri in zip(obj_names, obj_iris):
                if check_domain_and_range_for_all_super_and_sub_class(iri=obj_iri, domain_=iri_t1, range_=iri_t2, graph=original_ontology.graph):
                    refer_names = [obj_name] + refer_names

                if check_domain_and_range_for_all_super_and_sub_class(iri=obj_iri, domain_=iri_t2, range_=iri_t1, graph=original_ontology.graph):
                    refer_names = [obj_name] + refer_names

            all_idxes, all_values = self._retrive_topk([K_EF], obj_names, len(obj_names))
            all_idxes = all_idxes[0]
            for obj_idx in all_idxes:
                obj_iri = obj_iris[obj_idx]
                obj_name = obj_names[obj_idx]
                if check_domain_and_range(iri=obj_iri, domain_=iri_t1, range_=iri_t2, graph=original_ontology.graph):
                    predefined_E2F.append((obj_name, obj_iri))

                if check_domain_and_range(iri=obj_iri, domain_=iri_t2, range_=iri_t1, graph=original_ontology.graph):
                    predefined_F2E.append((obj_name, obj_iri))

            for obj_idx in all_idxes:
                obj_iri = obj_iris[obj_idx]
                obj_name = obj_names[obj_idx]
                if check_domain_and_range_for_all_super_and_sub_class(iri=obj_iri, domain_=iri_t1, range_=iri_t2, graph=original_ontology.graph):
                    predefined_E2F.append((obj_name, obj_iri))

                if check_domain_and_range_for_all_super_and_sub_class(iri=obj_iri, domain_=iri_t2, range_=iri_t1, graph=original_ontology.graph):
                    predefined_F2E.append((obj_name, obj_iri))
            # f'[{T_E}]. [{K_EF}]. [{T_F}]. target [{K_EF}]'
            batched_pairs = self._predict_matching_label_v2(
                [f'source: [{T_E}]. relation:[{K_EF}]. target:[{T_F}]. align target: [{K_EF}]'], # [K_EF]
                obj_names,
                obj_iris,
                obj_retrived_idxes,
                obj_retrived_values)

            obj_iri = batched_pairs[0][1][-1]

            if obj_iri is None or not (check_domain_and_range_for_all_super_and_sub_class(obj_iri, iri_t1, iri_t2, original_ontology.graph)):
                if predefined_E2F:
                    obj_iri = predefined_E2F[0][1]
                elif predefined_F2E:
                    obj_iri = predefined_F2E[0][1]
                    K_EF = K_EF + table_col_sep + 'inverse'
                else:
                    obj_iri = None

            if obj_iri:
                K_EF = T_E + table_col_sep + K_EF
                mp[2] = K_EF
                db2o[K_EF] = (obj_iri, find_topmost_ancestor(original_ontology.graph, obj_iri))
                mapping_patterns_checked.append(mp)

        # ontology, db2o = self._modify_ontology_by_match_results(batched_pairs, ontology, ontology.add_object_property, db2o)
        g = self.mapping
        rr = self.rr
        default = get_default_namespace(g)
        type_mapping = self.type_mapping

        saved_mappingid = []
        for K_E, T_E, K_EF, K_F, T_F in mapping_patterns_checked:
            iri = db2o[K_EF][1]
            TE_iri = db2o[T_E][1]
            TE_iri_Ancestor = db2o[T_E][1]
            TF_iri = db2o[T_F][1]
            TF_iri_Ancestor = db2o[T_F][1]
            obj_iri = db2o[K_EF][1]

            # only handle the object properties
            if get_owl_entity_type(iri, ontology.graph) != "owl:ObjectProperty":
                continue

            # check the primary key for TE and TF
            # now only consider the primary key with one column
            if not (self.class2iri[TF_iri_Ancestor]["attr_num"] == 1):
                continue

            # check if 'inverse' in K_EF
            if table_col_sep + 'inverse' in K_EF:
                mapping_id = f"urn:r2rml:SRm-{T_E}" + table_col_sep + "inverse"
                source_iri = TF_iri
                source_iri_Ancestor = TF_iri_Ancestor
                target_iri_Ancestor = TE_iri_Ancestor

                source_pks = [K_EF.split(table_col_sep)[1]]
                if isinstance(K_EF, str):
                    target_pks = [K_E]
                else:
                    target_pks = K_E
            else:
                mapping_id = f"urn:r2rml:SRm-{T_E}"
                source_iri = TE_iri
                source_iri_Ancestor = TE_iri_Ancestor
                target_iri_Ancestor = TF_iri_Ancestor

                if isinstance(K_E, str):
                    source_pks = [K_E]
                else:
                    source_pks = K_E
                target_pks = [K_EF.split(table_col_sep)[1]]

            triples_map = URIRef(mapping_id)
            g.add((triples_map, RDF.type, rr.TriplesMap))

            if mapping_id not in saved_mappingid:
                # subjectMap
                subject_map = BNode()
                add_subject_map(g=g, triples_map=triples_map, subject_map=subject_map, rdf_class=source_iri,
                                template_url=Literal(source_iri_Ancestor + '/' + '/'.join(["{" + pk + "}" for pk in source_pks])),
                                rr=rr)
            add_predicate_objectproperty_map(g, triples_map, obj_iri,
                                             Literal(target_iri_Ancestor + '/' + '/'.join(["{" + pk + "}" for pk in target_pks])),
                                             rr)

            # check if the object property in the original ontology
            if (obj_iri, None, None) in original_ontology.graph:
                original_ontology.add_object_property(iri=obj_iri)

            if mapping_id not in saved_mappingid:
                add_logical_table(g, triples_map, f'SELECT * FROM "{self.db_schema}"."{T_E}"', rr)
                saved_mappingid.append(mapping_id)

        pass

    def run_mapping_generation(self, table, db2o, ontology, mapping_patterns:dict[list[list[str]]], original_ontology):
        self._copy_namespaces(ontology.graph)

        merge_pk = {}
        for t, pk in mapping_patterns["SE"]:
            if t not in merge_pk:
                merge_pk[t] = []
            merge_pk[t].append(pk)
            merge_pk[t] = sorted(merge_pk[t])

        # set the number of primary keys for each table and classes
        # find the minimum number of primary keys
        for k, v in merge_pk.items():
            iri_target = db2o[k][1]
            if iri_target not in self.class2iri:
                self.class2iri[iri_target] = {"attr_num":len(v)}
            else:
                if len(v) < self.class2iri[iri_target]["attr_num"]:
                    self.class2iri[iri_target]["attr_num"] = len(v)

        for mapping_pattern in self.mapping_pattern_order:
            patterns = mapping_patterns[mapping_pattern]
            if mapping_pattern in self.mapping_handle_function:
                self.mapping_handle_function[mapping_pattern](table, db2o, ontology, patterns, original_ontology)
