import os
from src.vkg_utils.ontology_matching_utils.gen_align import process_ontologies
from src.vkg_utils.ontology_matching_utils.get_mergeonto import ontology_matching
from typing_extensions import LiteralString

def ontology_matching_by_logmap(
        target_ontology_file_path: str,
        source_ontology_file_path: str,
        output_dir_path: str,
        db_name: str,
        logmap_jar_path: str="./resources/logmap/target/logmap-matcher-4.0.jar")\
        -> str:
    '''

    :param target_ontology_file_path: the target ontology file path *.ttl/*.owl
    :param source_ontology_file_path: the source ontology file path *.ttl/*.owl
    :param output_dir_path: the output directory path
    :param db_name: the db name
    :param logmap_jar_path: the logmap jar
    :return: merged ontology file path
    '''
    log_file_path = os.path.join(output_dir_path, 'owl_fix_log.txt')
    # 处理本体匹配
    process_ontologies(target_ontology_file_path, source_ontology_file_path, output_dir_path, logmap_jar_path)

    # 初始化日志文件
    with open(log_file_path, 'w') as log_file:
        log_file.write("OWL File Fix Log\n")
        log_file.write("=" * 40 + "\n")

    # 获取文件路径
    logmap_mappings_file = os.path.join(output_dir_path, "merge", 'logmaplogmap_mappings.owl')

    merged_graph = ontology_matching(output_dir_path, target_ontology_file_path, source_ontology_file_path, logmap_mappings_file,
                                     log_file_path)

    if merged_graph:
        os.makedirs(output_dir_path, exist_ok=True)
        merged_file = os.path.join(output_dir_path, f'rodi_merged_{db_name}_generated_ontology.ttl')
        merged_graph.serialize(destination=merged_file, format='turtle')
        with open(log_file_path, 'a') as log_file:
            log_file.write(f"Successfully merged ontology ...\n")
        print(f"Successfully merged {merged_file}")
        return merged_file

    return ''
