import rdflib
from rdflib import RDF, OWL
from tqdm import tqdm

from src.vkg_utils.mapping_patterns import mapping_pattern_query


class DBSchemaGraph:
    def __init__(self, table_info=None):
        self.table_info = table_info

        self.mapping_pattern_queries = mapping_pattern_query
        self.mapping_pattern_types = list(mapping_pattern_query.keys())


        self.example_namespace = "http://example.org/"
        self.sep = '/'
        self.graph = None
        self._build_graph()

    def _build_graph(self, table_info=None):
        if table_info is None:
            table_info = self.table_info

        if table_info is None:
            raise ValueError("table_info cannot be None")

        sep = self.sep
        graph = rdflib.Graph()
        # 定义命名空间
        EX = rdflib.Namespace(self.example_namespace)
        RDFS = rdflib.Namespace("http://www.w3.org/2000/01/rdf-schema#")
        # 添加类：hasC, hasPK, hasFK
        graph.add((EX["hasC"], RDF["type"], OWL["ObjectProperty"]))  # hasC 是一个 Object Property
        graph.add((EX["hasPK"], RDF["type"], OWL["ObjectProperty"]))  # hasC 是一个 Object Property
        graph.add((EX["hasFK"], RDF["type"], OWL["ObjectProperty"]))  # hasC 是一个 Object Property
        graph.add((EX["hasPK"], RDFS["subPropertyOf"], EX["hasC"]))  # hasPK 是 hasC 的子属性

        def change_tname(tname):
            if '.' in tname:
                return tname[:tname.rfind('.')] + sep + tname[tname.rfind('.') + 1:]
            else:
                return tname

        # 为每个表添加 RDF 节点并连接它们
        for table_name, table_data in table_info.items():
            table_name = change_tname(table_name)
            table_uri = EX[table_name]
            # 表类型为 Table
            graph.add((table_uri, RDF.type, rdflib.URIRef("http://example.org/table")))
            # 遍历列，添加列节点并设置主键关系
            for column in table_data["columns"]:
                # if not primary key
                if column['column_name'] in table_data["primary_keys"]:
                    continue
                column_uri = EX[f"{table_name}{sep}{column['column_name']}"]
                graph.add((column_uri, RDF.type, rdflib.URIRef("http://example.org/column")))
                graph.add((table_uri, EX["hasC"], column_uri))  # 列属于表
            # 主键关系：添加表与主键的连接
            for pk in table_data["primary_keys"]:
                pk_uri = EX[f"{table_name}{sep}{pk}"]
                graph.add((table_uri, EX["hasPK"], pk_uri))
            # 外键关系：添加表与外键的连接
            for fk in table_data["foreign_keys"]:
                ftable = change_tname(fk['foreign_table'])
                fk_column_uri = EX[f"{table_name}{sep}{fk['column_name']}"]
                fk_column_uri_target = EX[f"{ftable}{sep}{fk['foreign_column']}"]
                # 表与外键列的关系
                graph.add((fk_column_uri, EX["hasFK"], fk_column_uri_target))  # 外键列与目标列有关系
        self.graph = graph

    def recognize_mapping_pattern(self, pattern_type)->list[list[str]]:
        assert pattern_type in self.mapping_pattern_types
        query = mapping_pattern_query[pattern_type]
        # 执行查询
        query_results = self.graph.query(query)

        results = []
        for result in query_results:
            r = []
            for item in result:
                item = str(item).split(self.sep)[-1]
                r.append(item)
            results.append(r)

        return results