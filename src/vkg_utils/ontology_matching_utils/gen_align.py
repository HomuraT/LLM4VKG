import subprocess
import os


def run_logmap_matcher(source_file, target_file, output_dir, logmap_jar_path):
    """
    使用 logmap-matcher 运行匹配命令。
    :param source_file: 源文件路径 (ontology.rdf)
    :param target_file: 目标文件路径 (ontology.owl)
    :param output_dir: 输出目录
    """
    command = [
        "java", "-jar", logmap_jar_path, "MATCHER",
        f"file://{os.path.abspath(source_file)}",
        f"file://{os.path.abspath(target_file)}",
        os.path.abspath(output_dir),
        "true"
    ]
    try:
        subprocess.run(command, check=True)
        print(f"成功运行 LogMap-Matcher: {source_file} -> {target_file}")
        print(f"输出结果: {output_dir}")
    except subprocess.CalledProcessError as e:
        print(f"LogMap-Matcher 执行失败: {e}")

def process_ontologies(target_ontology_path, source_ontology_path, output_dir, logmap_jar_path):
    """
    遍历 data 和 tool 文件夹中的数据库，找到匹配的 ontology 文件并运行 LogMap-Matcher。
    :param target_ontology_path: data 文件夹路径
    :param source_ontology_path: tool 文件夹路径
    :param output_dir: merge 文件夹路径
    """
    # # 确保两个文件都存在
    # if not (os.path.exists(data_ontology) and os.path.exists(tool_ontology)):
    #     print(f"跳过 {db_name}: ontology 文件缺失")
    #     continue

    # 确保 merge 文件夹中的对应子文件夹
    output_dir = os.path.join(output_dir, "merge", "logmap")
    os.makedirs(output_dir, exist_ok=True)

    # 运行 logmap-matcher
    run_logmap_matcher(target_ontology_path, source_ontology_path, output_dir, logmap_jar_path)