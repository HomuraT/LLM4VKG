from tqdm import tqdm

from src.db_utils.db_utils import get_all_databases, get_table_structure, db_config
from src.llm.utils.langchain_utils import Modules
from src.utils.tools import load_json_file
from src.vkg_generation.VKGDatasets import OntologyDataset, TableDataset
from src.vkg_generation.ontology_completion_mapping_generation import OntologyCompletion, MappingGeneration
import os
import torch

if __name__ == "__main__":
    dbnames = os.listdir("./datasets/rodi/")
    dbnames = [i for i in dbnames if not i.startswith(".")]
    dbname = 'conference_structured'  # 'cmt_naive'
    mapping_pattern_dir = 'outputs/mapping_patterns/'
    for api_name in ["gpt_4o", "gpt_4o_mini"]:
        # subset_name = "rodi_T_75"
        for subset_name in ["rodi"]: #, "rodi_T_50", "rodi_T_75"]:
            rodi_path = os.path.join('./datasets/', subset_name)

            for dbname in tqdm(dbnames, desc=f"{subset_name} dbname"):
                try:
                    db_schema = dbname
                    if dbname.startswith("mondial"):
                        db_schema = 'mondial_rdf2sql_standard'

                    base_path = f'./outputs/{subset_name}/LLM4VKG_{api_name}/' + dbname
                    generated_ontology_file_name = f'rodi_{dbname}_generated_ontology.ttl'
                    generated_mapping_file_name = f'rodi_{dbname}_generated_mapping.ttl'

                    done_flag = [False] * 2
                    os.makedirs(base_path, exist_ok=True)
                    for file_name in os.listdir(base_path):
                        if file_name == generated_ontology_file_name:
                            done_flag[0] = True
                        elif file_name == generated_mapping_file_name:
                            done_flag[1] = True


                    print(dbname, 'start***************************************')

                    if not os.path.exists(base_path):
                        os.makedirs(base_path)

                    ontology_path = os.path.join(rodi_path, dbname, 'ontology.ttl')
                    #
                    ontologyDataset = OntologyDataset(ontology_path)
                    table_info = get_table_structure(dbname=dbname, db_schema=db_schema, **db_config)
                    tableDataset = TableDataset(table_info)
                    #
                    strategy = load_json_file('setting/strategy/OntologyCompletion/LLM4VKG.json')
                    prompts = load_json_file('prompts/OntologyCompletion/prompt.json')
                    #
                    # Create Modules instance
                    modules = Modules(strategy, prompts, set_all_api_id=api_name)

                    OC = OntologyCompletion(modules=modules, db_schema=db_schema)
                    ontology, db2o = OC.run_ontology_completion(ontologyDataset, tableDataset)
                    torch.save(db2o, os.path.join(base_path, f'db2o.pt'))
                    torch.save(ontology, os.path.join(base_path, f'ontology.pt'))
                    db2o = torch.load(os.path.join(base_path, f'db2o.pt'))
                    ontology = torch.load(os.path.join(base_path, f'ontology.pt'))
                    print("saved")

                    original_ontology = OntologyDataset(ontology_path)

                    MG = MappingGeneration(modules=modules, db_schema=db_schema)
                    MG.run_mapping_generation(table=tableDataset, db2o=db2o, ontology=ontology,
                                              mapping_patterns=torch.load(os.path.join(mapping_pattern_dir, dbname, f'mapping_pattern.pt')), original_ontology=original_ontology)
                    original_ontology.graph.serialize(destination=os.path.join(base_path, generated_ontology_file_name),
                                             format='turtle')
                    MG.mapping.serialize(destination=os.path.join(base_path, generated_mapping_file_name),
                                         format='turtle')

                    print(dbname, 'end!')
                    print('------------------------------------')
                except Exception as e:
                    print(dbname, e)



