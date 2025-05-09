import argparse
import os

from tqdm import tqdm

from src.vkg_utils.evaluate_pipeline import run_evaluation_pipeline
from src.vkg_utils.ontology_matching_utils.utils import ontology_matching_by_logmap


def evaluate_without_ontology_matching(db_name, base_path):
    ontop_cli_path = os.path.abspath(os.path.join('./resources', "ontop"))
    print(f"ONTOP_CLI_PATH: {ontop_cli_path}")  #确保现ONTOP_CLI_PATH 参数传入正确路径

    ttl_mapping_file = os.path.join(base_path, f'rodi_{db_name}_generated_mapping.ttl')
    ontology_file = os.path.join(base_path, f'rodi_{db_name}_generated_ontology.ttl')
    property_file = os.path.join(base_path, "ontology.properties")
    qpair_folder = os.path.join('./datasets/rodi/data', f"{db_name}/queries")
    output_metrics_path = os.path.join(base_path, "metrics_details.json")
    output_f1_path = os.path.join(base_path, "f1.txt")

    run_evaluation_pipeline(
        ttl_mapping_file=ttl_mapping_file,
        ontology_file=ontology_file,
        property_file=property_file,
        qpair_folder=qpair_folder,
        dbname= db_name,
        ontop_cli_path=ontop_cli_path,
        output_metrics_path=output_metrics_path,
        output_f1_path=output_f1_path,
    )

def evaluate_wo_om_for_dir(dir_path, skip_done=False):
    for filename in os.listdir(dir_path):
        if filename.startswith("."):
            continue
        if skip_done:
            if os.path.exists(os.path.join(dir_path, filename, "f1.txt")):
                continue

        db_name = filename
        base_path = os.path.join(dir_path, db_name)
        try:
            evaluate_without_ontology_matching(db_name, base_path)
        except Exception as e:
            print(e)

def evaluate_with_ontology_matching(db_name:str, rodi_path:str, base_path:str):
    logmap_jar_path = "./resources/logmap/target/logmap-matcher-4.0.jar"
    ontop_cli_path = os.path.abspath(os.path.join('./resources', "ontop"))
    # 定义 data 和 tool 文件夹路径
    target_ontology_dir = os.path.join(rodi_path, "data", db_name)
    source_ontology_dir = base_path
    output_dir = base_path

    # 定义 data 和 tool 文件夹路径
    target_ontology_name = "ontology.ttl"
    target_ontology_file = os.path.join(target_ontology_dir, target_ontology_name)
    source_ontology_name = f"rodi_{db_name}_generated_ontology.ttl"
    source_ontology_file = os.path.join(source_ontology_dir, source_ontology_name)

    ontology_path = ontology_matching_by_logmap(target_ontology_file, source_ontology_file, output_dir, db_name, logmap_jar_path)
    ttl_mapping_file = os.path.join(source_ontology_dir, f'rodi_{db_name}_generated_mapping.ttl')

    property_file = os.path.join(output_dir, "ontology.properties")
    qpair_folder = os.path.join('./datasets/rodi/data', f"{db_name}/queries")
    output_metrics_path = os.path.join(output_dir, "metrics_details.json")
    output_f1_path = os.path.join(output_dir, "f1.txt")

    run_evaluation_pipeline(
        ttl_mapping_file=ttl_mapping_file,
        ontology_file=ontology_path,
        property_file=property_file,
        qpair_folder=qpair_folder,
        dbname= db_name,
        ontop_cli_path=ontop_cli_path,
        output_metrics_path=output_metrics_path,
        output_f1_path=output_f1_path,
    )

def evaluate_w_om_for_dir(dir_path, skip_done=False):
    if not os.path.exists(dir_path):
        return

    for filename in os.listdir(dir_path):
        if filename.startswith("."):
            continue
        if skip_done:
            if os.path.exists(os.path.join(dir_path, filename, "f1.txt")):
                continue

        db_name = filename
        base_path = os.path.join(dir_path, db_name)
        try:
            evaluate_with_ontology_matching(db_name=db_name, base_path=base_path, rodi_path="./datasets/rodi/")
        except Exception as e:
            print(e)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="汇总多个路径下各场景的 F1 分数并输出到 CSV。")
    parser.add_argument(
        '--paths',
        nargs='+',
        help='结果组的路径列表，每个路径表示一组结果。',
        default=[
            "outputs/rodi_LLM4VKG_gpt_4o"
        ]
    )

    parser.add_argument('--skip_done', type=bool, default=True)
    parser.add_argument('--ontology_matching', type=bool, default=True)
    args = parser.parse_args()
    for path in tqdm(args.paths):
        base_path = path
        if not args.ontology_matching:
            evaluate_wo_om_for_dir(base_path, args.skip_done)
        else:
            evaluate_w_om_for_dir(base_path, args.skip_done)