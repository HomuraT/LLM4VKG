from rdflib import Namespace, RDF, Literal, BNode, URIRef, RDFS, OWL, Graph


def get_default_namespace(graph):
    for prefix, ns in graph.namespaces():
        if prefix == '':
            return Namespace(ns)

    _, ns = list(graph.namespaces())[0]
    return ns


def add_subject_map(g, triples_map, subject_map, rdf_class, template_url, rr):
    """
    封装用于添加 subjectMap 的方法
    :param g: Graph 对象
    :param triples_map: TriplesMap 的 URIRef
    :param subject_map: 用于创建 SubjectMap 的 BNode
    :param rdf_class: 对应的 RDF 类（例如：db2o[t]）
    :param template_url: 基础 URL 用于生成模板
    :param pks: 主键字段列表
    """
    # 添加 subjectMap 相关三元组
    g.add((triples_map, rr.subjectMap, subject_map))
    g.add((subject_map, RDF.type, rr.TermMap))
    g.add((subject_map, RDF.type, rr.SubjectMap))
    if rdf_class is not None:
        g.add((subject_map, rr["class"], rdf_class))

    # 构造模板字符串，例如：http://example.org/voc#uni1/student/{ID}
    g.add((subject_map, rr.template, Literal(template_url)))

    # 可选：如果需要设置 termType（默认是 IRI）
    g.add((subject_map, rr.termType, rr.IRI))

def add_predicate_dataproperty_map(g:Graph, triples_map:URIRef, predicate_uri:URIRef, col:str, datatype:URIRef, rr:Namespace):
    """
    封装用于添加 PredicateObjectMap 和 ObjectMap 的方法
    :param g: Graph 对象
    :param triples_map: TriplesMap 的 URIRef
    :param predicate_uri: 对应的谓词 URI
    :param col: 数据库列名
    :param datatype: 数据类型（例如 xsd:string, xsd:integer 等）
    """
    # 创建 PredicateObjectMap
    predicate_object_map = BNode()
    g.add((triples_map, rr.predicateObjectMap, predicate_object_map))
    g.add((predicate_object_map, RDF.type, rr.PredicateObjectMap))
    g.add((predicate_object_map, rr.predicate, predicate_uri))

    # 创建 ObjectMap
    object_map = BNode()
    g.add((predicate_object_map, rr.objectMap, object_map))
    g.add((object_map, RDF.type, rr.TermMap))
    g.add((object_map, RDF.type, rr.ObjectMap))
    g.add((object_map, rr.termType, rr.Literal))
    if datatype:
        g.add((object_map, rr.datatype, datatype))
    g.add((object_map, rr.column, Literal(col)))

def add_predicate_objectproperty_map(g, triples_map, predicate_uri, template, rr):
    """
    封装用于添加 ObjectProperty 的方法
    :param g: Graph 对象
    :param triples_map: TriplesMap 的 URIRef
    :param predicate_uri: 对应的谓词 URI
    :param col: 数据库列名
    :param template: 模板字符串，用于构建 IRI
    """
    # 创建 PredicateObjectMap
    predicate_object_map = BNode()
    g.add((triples_map, rr.predicateObjectMap, predicate_object_map))
    g.add((predicate_object_map, RDF.type, rr.PredicateObjectMap))
    g.add((predicate_object_map, rr.predicate, predicate_uri))

    # 创建 ObjectMap
    object_map = BNode()
    g.add((predicate_object_map, rr.objectMap, object_map))
    g.add((object_map, RDF.type, rr.TermMap))
    g.add((object_map, RDF.type, rr.ObjectMap))
    g.add((object_map, rr.termType, rr.IRI))  # 对应 ObjectProperty 的 IRI
    g.add((object_map, rr.template, Literal(template)))  # 使用模板构建 IRI

def add_logical_table(g, triples_map, sql, rr):
    """
    封装用于添加 logicalTable 的方法
    :param g: Graph 对象
    :param triples_map: TriplesMap 的 URIRef
    :param t: 表名，用于构建 SQL 查询
    """
    # 创建并添加 logicalTable
    logical_table = BNode()
    g.add((triples_map, rr.logicalTable, logical_table))
    g.add((logical_table, RDF.type, rr.R2RMLView))
    g.add((logical_table, rr.sqlQuery, Literal(sql)))

def find_topmost_ancestor(g, iri, max_depth=10):
    if type(iri) is not URIRef:
        iri = URIRef(iri)

    ancestors = list(g.objects(subject=URIRef(iri), predicate=RDFS.subClassOf))
    ancestors = [i for i in ancestors if type(i) is URIRef]

    d = 0
    while len(ancestors) > 0:
        if "owl#thing" in str(ancestors[0]).lower():
            break
        iri = ancestors[0]
        ancestors = list(g.objects(subject=URIRef(iri), predicate=RDFS.subClassOf))
        ancestors = [i for i in ancestors if type(i) is URIRef]

        d += 1
        if d > max_depth:
            break
    return iri


def get_owl_entity_type(iri, graph):
    """
    Function to determine if the given IRI is an owl:Class, owl:DatatypeProperty, or owl:ObjectProperty.

    Parameters:
    - iri: The IRI whose type is to be checked.
    - graph: The RDF graph in which to look up the IRI.

    Returns:
    - A string indicating whether the IRI is an owl:Class, owl:DatatypeProperty, or owl:ObjectProperty,
      or None if the IRI type is unknown.
    """
    # Convert the IRI string to a URIRef
    if not iri:
        raise ValueError("IRI cannot be None")
    iri_ref = URIRef(iri)

    # Check if the IRI is an owl:Class
    if (iri_ref, RDF.type, OWL.Class) in graph:
        return "owl:Class"

    # Check if the IRI is an owl:DatatypeProperty
    if (iri_ref, RDF.type, OWL.DatatypeProperty) in graph:
        return "owl:DatatypeProperty"

    # Check if the IRI is an owl:ObjectProperty
    if (iri_ref, RDF.type, OWL.ObjectProperty) in graph:
        return "owl:ObjectProperty"

    # If it's neither an owl:Class, owl:DatatypeProperty, nor owl:ObjectProperty
    return None

def retrive_topk(retriver, source, target, retrive_target_num=3):
    retrive_target_num = min(retrive_target_num, len(target))
    if retrive_target_num == 0:
        return [[]]*len(source), [[]]*len(source)

    source_embs = retriver.encode(source, convert_to_tensor=True).to(retriver.device)
    target_embs = retriver.encode(target, convert_to_tensor=True).to(retriver.device)

    retrived_idxes = (source_embs @ target_embs.T).topk(retrive_target_num, dim=1)

    return retrived_idxes.indices, retrived_idxes.values


# def check_domain_and_range(iri:URIRef, domain_:URIRef, range_:URIRef, graph:Graph):
#     iri = URIRef(iri)
#     domain_ = URIRef(domain_)
#     range_ = URIRef(range_)
#
#     if (iri, RDFS.domain, domain_) in graph and (iri, RDFS.range, range_) in graph:
#         return True
#     return False


def check_domain_and_range(iri: URIRef, domain_: URIRef, range_: URIRef, graph: Graph) -> bool:
    """
    检查给定的 IRI 是否在 RDF 图中具有指定的 domain 和 range。
    如果 range 是一个 owl:unionOf，则检查 range_ 是否包含在并集的类中。

    :param iri: 要检查的属性的 URIRef
    :param domain_: 期望的 domain 的 URIRef
    :param range_: 期望的 range 的 URIRef
    :param graph: RDFLib 的 Graph 对象
    :return: 如果属性的 domain 和 range 符合要求，则返回 True，否则返回 False
    """
    iri = URIRef(iri)
    domain_ = URIRef(domain_)
    range_ = URIRef(range_)

    # 检查 domain 是否匹配
    domain_matches = (iri, RDFS.domain, domain_) in graph

    # 初始化 range 匹配标志
    range_matches = False

    # 获取所有与 iri 关联的 rdfs:range
    range_nodes = list(graph.objects(iri, RDFS.range))

    for range_node in range_nodes:
        # 直接匹配 range
        if range_node == range_:
            range_matches = True
            break
        # 检查 range 是否是一个 owl:Class，并且是否包含 owl:unionOf
        elif (range_node, RDF.type, OWL.Class) in graph:
            # 获取 owl:unionOf 列表
            union_of = list(graph.objects(range_node, OWL.unionOf))
            if union_of:
                union_list = union_of[0]
                # 遍历 RDF 列表，检查 range_
                for cls in traverse_rdf_list(graph, union_list):
                    if cls == range_:
                        range_matches = True
                        break
        if range_matches:
            break

    return domain_matches and range_matches


def traverse_rdf_list(graph: Graph, list_node: URIRef) -> list:
    """
    遍历 RDF 列表并返回所有元素。

    :param graph: RDFLib 的 Graph 对象
    :param list_node: 列表的起始节点
    :return: 列表中所有元素的列表
    """
    items = []
    while list_node != RDF.nil:
        first = graph.value(list_node, RDF.first)
        if first:
            items.append(first)
        rest = graph.value(list_node, RDF.rest)
        if rest is None:
            break
        list_node = rest
    return items

def get_all_subclasses(graph, predicate, class_iri):
    """
    递归查找指定类的所有子类。

    参数:
        graph (rdflib.Graph): 已加载的 RDF 图。
        predicate (rdflib.term.URIRef): 用于查找子类的谓语，通常为 RDFS.subClassOf。
        class_iri (rdflib.term.URIRef): 目标类，查找其子类。

    返回:
        set: 包含所有子类的集合。
    """
    domains = [class_iri]      # 待处理的类列表，初始为目标类
    all_subclasses = set()        # 存储所有找到的子类

    while domains:
        current_class = domains.pop()  # 获取并移除列表中的最后一个类
        # 查找当前类的直接子类
        subclasses = list(graph.subjects(predicate, current_class))
        for subclass in subclasses:
            if subclass not in all_subclasses:
                if type(subclass) == URIRef:
                    all_subclasses.add(subclass)  # 添加到子类集合中
                    domains.append(subclass)      # 将子类加入待处理列表，以便进一步查找其子类

    return all_subclasses

def check_domain_and_range_for_all_subclass(iri:URIRef, domain_:URIRef, range_:URIRef, graph:Graph):
    iri = URIRef(iri)
    domain_ = URIRef(domain_)
    range_ = URIRef(range_)

    domains = get_all_subclasses(graph, RDFS.subClassOf, domain_)
    ranges = get_all_subclasses(graph, RDFS.subClassOf, range_)

    for d in domains:
        for r in ranges:
            if check_domain_and_range(iri=iri, domain_=d, range_=r, graph=graph):
                return True
    return False

def get_all_superclasses(graph: Graph, predicate: URIRef, class_iri: URIRef) -> set:
    """
    递归查找指定类的所有超类。

    参数:
        graph (rdflib.Graph): 已加载的 RDF 图。
        predicate (rdflib.term.URIRef): 用于查找超类的谓语，通常为 RDFS.subClassOf。
        class_iri (rdflib.term.URIRef): 目标类，查找其超类。

    返回:
        set: 包含所有超类的集合。
    """
    domains = [class_iri]       # 待处理的类列表，初始为目标类
    all_superclasses = set()    # 存储所有找到的超类

    while domains:
        current_class = domains.pop()  # 获取并移除列表中的最后一个类
        # 查找当前类的直接超类
        superclasses = list(graph.objects(current_class, predicate))
        for superclass in superclasses:
            if superclass not in all_superclasses:
                if type(superclass) == URIRef:
                    all_superclasses.add(superclass)  # 添加到超类集合中
                    domains.append(superclass)        # 将超类加入待处理列表，以便进一步查找其超类

    return all_superclasses


def check_domain_and_range_for_all_superclass(iri: URIRef, domain_: URIRef, range_: URIRef, graph: Graph) -> bool:
    """
    检查指定 IRI 是否在所有超类的 domain 和 range 范围内。

    参数:
        iri (rdflib.term.URIRef): 要检查的 IRI。
        domain_ (rdflib.term.URIRef): 领域类的 IRI。
        range_ (rdflib.term.URIRef): 范围类的 IRI。
        graph (rdflib.Graph): 已加载的 RDF 图。

    返回:
        bool: 如果符合条件则返回 True，否则返回 False。
    """
    iri = URIRef(iri)
    domain_ = URIRef(domain_)
    range_ = URIRef(range_)

    # 获取所有领域的超类和范围的超类
    super_domains = get_all_superclasses(graph, RDFS.subClassOf, domain_)
    super_ranges = get_all_superclasses(graph, RDFS.subClassOf, range_)

    # 也包括原始的 domain 和 range
    super_domains.add(domain_)
    super_ranges.add(range_)

    for d in super_domains:
        for r in super_ranges:
            if check_domain_and_range(iri=iri, domain_=d, range_=r, graph=graph):
                return True
    return False

def check_domain_and_range_for_all_super_and_sub_class(iri: URIRef, domain_: URIRef, range_: URIRef, graph: Graph) -> bool:
    """
    检查指定 IRI 是否在所有超类的 domain 和 range 范围内。

    参数:
        iri (rdflib.term.URIRef): 要检查的 IRI。
        domain_ (rdflib.term.URIRef): 领域类的 IRI。
        range_ (rdflib.term.URIRef): 范围类的 IRI。
        graph (rdflib.Graph): 已加载的 RDF 图。

    返回:
        bool: 如果符合条件则返回 True，否则返回 False。
    """
    iri = URIRef(iri)
    domain_ = URIRef(domain_)
    range_ = URIRef(range_)

    domains = get_all_related_iri(graph=graph, iri=domain_, predicate=RDFS.subClassOf)
    ranges = get_all_related_iri(graph=graph, iri=range_, predicate=RDFS.subClassOf)

    for d in domains:
        for r in ranges:
            if check_domain_and_range(iri=iri, domain_=d, range_=r, graph=graph):
                return True
    return False

def get_all_related_iri(graph: Graph, predicate: URIRef, iri: URIRef) -> set[URIRef]:
    super = get_all_superclasses(graph, predicate, iri)
    sub = get_all_subclasses(graph, predicate, iri)
    return super | sub | set([iri])