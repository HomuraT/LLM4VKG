from rdflib import Graph, RDF, OWL, RDFS, URIRef, Namespace
from rdflib.namespace import split_uri

from src.vkg_generation.vkg_utils import get_all_related_iri, get_default_namespace


class TableDataset:
    def __init__(self, table_info):
        self.table_info = table_info

    def to_col_filter(self):
        dataset = []
        for tname, attrs in self.table_info.items():
            for col in attrs['columns']:
                dataset.append({"table_name": tname, **col})

        return dataset

    def get_foreign_keys(self):
        dataset = []
        for tname, attrs in self.table_info.items():
            for fk in attrs['foreign_keys']:
                dataset.append((f'{tname}.{fk["column_name"]}', f'{fk["foreign_table"]}.{fk["foreign_column"]}'))

        return dataset

    def get_table_names(self):
        dataset = []
        for tname, attrs in self.table_info.items():
            dataset.append(tname)
        return dataset

    def get_column_names(self, mode="str"):
        dataset = []
        for tname, attrs in self.table_info.items():
            for col in attrs['columns']:
                if mode == 'str':
                    dataset.append(f'[{tname}].[{col["column_name"]}].[{col["data_type"]}]. target: [{col["column_name"]}]')
                elif mode == 'dict':
                    dataset.append({"table_name": tname, **col})
                elif mode == 'simple':
                    dataset.append(f'{tname}.{col["column_name"]}')
                else:
                    raise ValueError(f'Invalid mode: {mode}')
        return dataset

class OntologyDataset:
    def __init__(self, ontology_file_path):
        self.ontology_file_path = ontology_file_path
        self.classes = None
        self.object_properties = None
        self.data_properties = None

        self._load_ontology()

    def _load_ontology(self):
        """
        从给定的本体文件中统计类、对象属性和数据属性的数量。

        参数：
            file_path (str): 本体文件路径（可以是 .owl, .ttl, .rdf 等）

        返回：
            tuple: (classes_count, object_properties_count, data_properties_count)
        """
        file_path = self.ontology_file_path
        # 根据扩展名推断文件格式
        if file_path.endswith(".ttl"):
            fmt = "turtle"
        elif file_path.endswith(".rdf") or file_path.endswith(".owl"):
            # 通常 .owl、.rdf 大多是 xml/rdf 格式
            fmt = "xml"
        else:
            # 无法判断时尝试用 xml 解析，可根据实际情况调整
            fmt = "xml"

        g = Graph()
        g.parse(file_path, format=fmt)

        # 类可以定义为owl:Class或rdfs:Class，这里都包含
        classes = set(g.subjects(RDF.type, OWL.Class)) | set(g.subjects(RDF.type, RDFS.Class))
        for _ in range(100):
            classes_tmp = []
            for i in classes:
                if type(i) == URIRef:
                    classes_tmp.append(i)
                    classes_tmp += [j for j in get_all_related_iri(g, RDFS.subClassOf, i) if type(j) == URIRef]
            new_classes = set(classes_tmp)
            if new_classes != classes:
                classes = new_classes
            else:
                break

        # 对象属性：owl:ObjectProperty
        object_properties = set(g.subjects(RDF.type, OWL.ObjectProperty))
        for _ in range(100):
            object_properties_tmp = []
            for i in object_properties:
                if type(i) == URIRef:
                    object_properties_tmp.append(i)
                    object_properties_tmp += [j for j in get_all_related_iri(g, RDFS.subPropertyOf, i) if type(j) == URIRef]
            new_object_properties = set(object_properties_tmp)
            if new_object_properties != object_properties:
                object_properties = new_object_properties
            else:
                break

        # 数据属性：owl:DatatypeProperty
        data_properties = set(g.subjects(RDF.type, OWL.DatatypeProperty))
        for _ in range(100):
            data_properties_tmp = []
            for i in data_properties:
                if type(i) == URIRef:
                    data_properties_tmp.append(i)
                    data_properties_tmp += [j for j in get_all_related_iri(g, RDFS.subPropertyOf, i) if type(j) == URIRef]
            new_data_properties = set(data_properties_tmp)
            if new_data_properties != data_properties:
                data_properties = new_data_properties
            else:
                break

        self.classes = classes
        self.object_properties = object_properties
        self.data_properties = data_properties
        self.graph = g

    def get_attr_names(self, atype):
        names = []
        uris = []
        if type(atype) == list:
            for a in atype:
                r = self.get_attr_names(a)
                names += r[0]
                uris += r[1]
        elif type(atype) == str:
            if atype == "class":
                attrs = self.classes
            elif atype == "object property":
                attrs = self.object_properties
            elif atype == "data property":
                attrs = self.data_properties
            else:
                raise TypeError

            for attr in attrs:
                uri = str(attr)
                attr_name = uri.split('#')[-1] if '#' in uri else uri.split('/')[-1]
                names.append(attr_name)
                uris.append(uri)

        return names, uris

    def _create_uri(self, local_name):
        """
        使用默认命名空间和局部名称创建完整的 URI。

        参数：
            local_name (str): 局部名称

        返回：
            rdflib.term.URIRef: 完整的 URI 引用
        """
        return URIRef(str(get_default_namespace(self.graph)) + local_name)

    def add_class(self, local_name=None, iri=None, parent_iri=None):
        """
        向本体中添加一个新的类（Class），并可选地指定其父类。

        参数：
            local_name (str): 新类的局部名称。
            parent_class_iri (str, 可选): 父类的完整 IRI。如果提供，新类将作为该父类的子类。

        示例：
            # 仅添加一个新类
            new_class = dataset.add_class("NewClass")

            # 添加一个新类，并将其作为父类 "http://example.org/ontology#ParentClass" 的子类
            new_subclass = dataset.add_class("SubClass", parent_class_iri="http://example.org/ontology#ParentClass")
        """
        # 使用默认命名空间和局部名称创建新类的完整 URI
        if local_name:
            class_uri = self._create_uri(local_name)
        elif iri:
            class_uri = iri
        else:
            raise ValueError

        # 向图中添加新类的类型声明
        self.graph.add((class_uri, RDF.type, OWL.Class))

        # 如果提供了父类的 IRI，则将新类声明为该父类的子类
        if parent_iri:
            parent_uri = URIRef(parent_iri)
            self.graph.add((class_uri, RDFS.subClassOf, parent_uri))

        # 将新类添加到内部的类集合中
        self.classes.add(class_uri)

        return class_uri

    def add_object_property(self, local_name=None, iri=None, domain=None, range_=None, parent_iri=None, inverse_iri=None):
        """
        向本体中添加一个新的对象属性（Object Property）。

        参数：
            local_name (str): 新对象属性的局部名称
            domain (str, 可选): 属性的领域（类）的局部名称
            range_ (str, 可选): 属性的范围（类）的局部名称
            parent_iri (str, 可选): 上级属性的IRI
            inverse_iri (str, 可选): 反向关系的IRI，定义该对象属性的逆属性

        示例：
            dataset.add_object_property("hasPart",
                                        domain="Car",
                                        range_="Wheel",
                                        inverse_iri="hasPartInverse")
        """
        # Create the URI for the new property
        if local_name:
            prop_uri = self._create_uri(local_name)
        elif iri:
            prop_uri = iri
        else:
            raise ValueError

        # Add the new property as an ObjectProperty
        self.graph.add((prop_uri, RDF.type, OWL.ObjectProperty))

        # Add domain if provided
        if domain:
            if isinstance(domain, URIRef):
                domain_uri = domain
            else:
                domain_uri = self._create_uri(domain)

            self.graph.add((prop_uri, RDFS.domain, domain_uri))

        # Add range if provided
        if range_:
            if isinstance(range_, URIRef):
                range_uri = range_
            else:
                range_uri = self._create_uri(range_)

            self.graph.add((prop_uri, RDFS.range, range_uri))

        # Add parent property if provided
        if parent_iri:
            parent_uri = URIRef(parent_iri)
            self.graph.add((prop_uri, RDFS.subPropertyOf, parent_uri))

        # Add inverse relation if provided
        if inverse_iri:
            if type(inverse_iri) == str:
                inverse_uri_ = URIRef(self._create_uri(inverse_iri))  # Create URI for inverse
            else:
                inverse_uri_ = inverse_iri
            self.graph.add((prop_uri, OWL.inverseOf, inverse_uri_))  # Define the inverse relation

        # Add the new property URI to the object properties set
        self.object_properties.add(prop_uri)

        return prop_uri

    def add_data_property(self, local_name=None, iri=None, domain=None, range_=None, parent_iri=None):
        """
        向本体中添加一个新的数据属性（Data Property）。

        参数：
            local_name (str): 新数据属性的局部名称
            domain (str, 可选): 属性的领域（类）的局部名称
            range_ (str, 可选): 属性的数据类型（例如 xsd:string）的完整 URI

        示例：
            dataset.add_data_property("hasName",
                                      domain="Person",
                                      range_="http://www.w3.org/2001/XMLSchema#string")
        """
        if local_name:
            prop_uri = self._create_uri(local_name)
        elif iri:
            prop_uri = iri
        else:
            raise ValueError

        self.graph.add((prop_uri, RDF.type, OWL.DatatypeProperty))

        # Add domain if provided
        if domain:
            if isinstance(domain, URIRef):
                domain_uri = domain
            else:
                domain_uri = self._create_uri(domain)

            self.graph.add((prop_uri, RDFS.domain, domain_uri))

        # Add range if provided
        if range_:
            if isinstance(range_, URIRef):
                range_uri = range_
            else:
                range_uri = self._create_uri(range_)

        if parent_iri:
            parent_uri = URIRef(parent_iri)
            self.graph.add((prop_uri, RDFS.subPropertyOf, parent_uri))

        self.data_properties.add(prop_uri)
        return prop_uri