import os
import sys
from typing import Literal

import rdflib
from rdflib import URIRef
from rdflib.namespace import RDF, OWL


def ontology_matching(output_dir, target_ontology_file_path, source_ontology_file_path, logmap_mappings_file, log_file_path):
    # 检查文件是否存在
    if not all(os.path.exists(f) for f in [target_ontology_file_path, source_ontology_file_path, logmap_mappings_file]):
        print(f"Missing files.")
        for f in [target_ontology_file_path, source_ontology_file_path, logmap_mappings_file]:
            if not os.path.exists(f):
                print(f"Missing: {f}.")

        with open(log_file_path, 'a') as log_file:
            log_file.write(f"Skipped due to missing files.\n")
        return

    # 初始化 RDF 图
    g_data = rdflib.Graph()

    tmp_dir = os.path.join(output_dir, "merge")
    os.makedirs(tmp_dir, exist_ok=True)

    # 加载 ontology.owl
    if os.path.exists(target_ontology_file_path):
        try:
            # 解析 ontology.owl 文件
            g_temp = rdflib.Graph()

            # 定义临时文件路径
            temp_ontology_file = os.path.join(tmp_dir, 'ontology_converted.rdf')

            # 将文件序列化为 RDF/XML 格式并保存
            g_temp.serialize(destination=temp_ontology_file, format='xml')
            print(f"Converted {target_ontology_file_path} to RDF/XML format.")

            # 加载转换后的 RDF/XML 文件
            if os.path.exists(temp_ontology_file):
                g_data.parse(temp_ontology_file)
                print(f"Loaded and converted ontology.owl.")
            else:
                print(f"Converted RDF/XML file not found.")
                sys.exit(0)
        except rdflib.exceptions.ParserError as e:
            print(f"Error parsing ontology.owl: {e}")
            with open(log_file_path, 'a') as log_file:
                log_file.write(f"Error parsing ontology.owl: {e}\n")
            return

    # 加载 ontology.rdf
    try:
        g_data.parse(source_ontology_file_path)
        print(f"Loaded ontology.rdf.")
    except Exception as e:
        print(f"Error loading ontology.rdf: {e}")
        return

    # 加载 logmap 文件
    try:
        g_logmap = rdflib.Graph()
        g_logmap.parse(logmap_mappings_file)

        for axiom in g_logmap.subjects(RDF.type, OWL.Axiom):
            source = g_logmap.value(axiom, OWL.annotatedSource)
            target = g_logmap.value(axiom, OWL.annotatedTarget)
            prop = g_logmap.value(axiom, OWL.annotatedProperty)

            if prop == OWL.equivalentClass:
                g_data.add((source, RDF.type, OWL.Class))
                g_data.add((source, OWL.equivalentClass, target))
            elif prop == OWL.equivalentProperty:
                property_type = list(g_data.objects(target, RDF.type))
                if not property_type:
                    property_type = list(g_data.objects(source, RDF.type))

                property_type = property_type[0]
                g_data.add((source, RDF.type, property_type))
                g_data.add((source, OWL.equivalentProperty, target))

        print(f"Processed logmap file ...")
    except Exception as e:
        print(f"Error processing logmap file {e}")
        return

    # 保存合并后的本体
    return g_data