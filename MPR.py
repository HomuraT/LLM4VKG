from tqdm import tqdm

from src.vkg_generation.mapping_pattern_recognition import DBSchemaGraph
from src.db_utils.db_utils import get_all_databases, get_table_structure, db_config

if __name__ == "__main__":
    dbnames = get_all_databases(**db_config)
    idx = dbnames.index("npd_user_tests")
    dbname = 'mondial_rel'
    for dbname in tqdm(dbnames):
        db_schema = dbname
        if dbname.startswith("mondial"):
            db_schema = 'mondial_rdf2sql_standard'
        base_path = f'./outputs/mapping_patterns/{dbname}'
        if not os.path.exists(base_path):
            os.makedirs(base_path)
        print("dbname:", dbname)
        table_info = get_table_structure(dbname, **db_config, db_schema=db_schema)

        print("build the graph...")
        graph = DBSchemaGraph(table_info=table_info)
        print("graph building finished...")

        print("start to search...")
        mapping_patterns = {}
        for pattern_type in graph.mapping_pattern_types:
            pattern_instances = graph.recognize_mapping_pattern(pattern_type)
            print(pattern_type)
            print(len(pattern_instances))
            print(pattern_instances)
            mapping_patterns[pattern_type] = pattern_instances
            print('-------------------')

        import torch
        torch.save(mapping_patterns, f"{base_path}/mapping_pattern.pt")
        print("saved mapping_pattern.pt")
        print()
        print()