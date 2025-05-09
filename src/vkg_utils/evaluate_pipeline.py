import re
import json
import re
import subprocess
import time
from collections import Counter
from typing import Optional, List
from urllib.parse import quote

import psutil
import psycopg2
import requests
from tqdm import tqdm
import os
import signal


# JDBC 配置信息模板，用于生成 ontology.properties 配置文件
JDBC_TEMPLATE = """jdbc.url=jdbc:postgresql://##put db ip here##/{db_name}?options=-c%20search_path%3D{db_name}
jdbc.driver=org.postgresql.Driver
jdbc.password=
jdbc.user=
"""

endpoint_port = "8086"

def kill_process(pid: Optional[int] = None, port: Optional[int] = None) -> None:
    """
    终止指定 PID 或占用指定端口的进程。

    :param pid: 要终止的进程的 PID。
    :param port: 要终止的占用的端口号对应的进程。
    """
    try:
        if pid is not None:
            # 终止指定 PID 的进程
            os.kill(pid, signal.SIGTERM)
            print(f"已终止 PID 为 {pid} 的进程。")
        elif port is not None:
            # 查找占用指定端口的所有进程
            pids = find_pids_by_port(port)
            if not pids:
                print(f"No process is using port {port}.")
                return
            for proc in pids:
                try:
                    os.kill(proc.pid, signal.SIGTERM)
                    print(f"已终止进程 {proc.name()} (PID: {proc.pid}) 使用的端口 {port}。")
                except ProcessLookupError:
                    print(f"No such process with PID {proc.pid}.")
                except PermissionError:
                    print(f"Permission denied to kill process {proc.name()} with PID {proc.pid}.")
        else:
            print("请提供 pid 或 port 参数之一。")
    except ProcessLookupError:
        print(f"No such process with PID {pid}.")
    except PermissionError:
        print(f"Permission denied to kill process with PID {pid}.")

def find_pids_by_port(port: int) -> List[psutil.Process]:
    """
    查找占用指定端口的所有进程。

    :param port: 端口号。
    :return: 使用该端口的进程列表。
    """
    pids = []
    for proc in psutil.process_iter(['pid', 'name']):
        try:
            connections = proc.connections(kind='inet')
            for conn in connections:
                if conn.status == psutil.CONN_LISTEN and conn.laddr.port == port:
                    pids.append(proc)
                    break  # 一个进程可能有多个连接，找到一个即可
        except (psutil.NoSuchProcess, psutil.AccessDenied):
            continue
    return pids

def create_properties_file(file_path:str, db_name:str)->None:
    """
    创建 ontology.properties 文件，并保存到指定路径。
    :param db_name: 数据库名称（即子文件夹名称）
    """
    # 构造配置文件路径
    properties_file_path = file_path
    print("生成配置文件")
    # 将 JDBC 配置信息写入文件
    with open(properties_file_path, "w") as file:
        file.write(JDBC_TEMPLATE.format(db_name=db_name))
    print(f"生成配置文件: {properties_file_path}")


# 转换 TTL 文件为 OBDA 文件
def convert_ttl_to_obda(input_ttl, output_obda, ontop_cli_path):
    command = [
        os.path.join(ontop_cli_path, 'ontop'), "mapping", "to-obda",
        "-i", input_ttl.replace("\\", "/"),
        "-o", output_obda.replace("\\", "/")
    ]
    try:
        # subprocess.run(command, cwd=ontop_cli_path, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        subprocess.run(command, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        print(f"[INFO] 转换成功: {input_ttl} -> {output_obda}")
    except subprocess.CalledProcessError as e:
        print(f"[ERROR] 转换失败: {input_ttl} -> {output_obda}\n错误信息: {e}")


# 启动 Ontop Endpoint
def start_ontop_endpoint(mapping_file, ontology_file, property_file, ontop_cli_path):
    command = [
        os.path.join(ontop_cli_path, "ontop"), "endpoint",
        "-m", mapping_file,
        "-t", ontology_file,
        "-p", property_file,
        "--port", endpoint_port,
        "--cors-allowed-origins=*"
    ]
    print(f"[INFO] 启动 Ontop 服务，命令: {' '.join(command)}")
    subprocess.Popen(command)
    time.sleep(20)
    print("[INFO] Ontop 服务已启动")


# 检查 Ontop Endpoint 是否可用
def check_ontop_server(endpoint_url):
    try:
        response = requests.get(endpoint_url)
        if response.status_code == 200:
            print("[INFO] Ontop 服务运行正常")
        else:
            print(f"[WARNING] Ontop 服务返回状态码: {response.status_code}")
    except requests.exceptions.RequestException as e:
        print(f"[ERROR] 无法连接到 Ontop 服务: {e}")


# 执行 SPARQL 查询
def execute_sparql_query_as_url(sparql_query, endpoint_url):
    # 对 SPARQL 查询进行 URL 编码
    encoded_query = quote(sparql_query)
    # full_url = f"{endpoint_url}?query={encoded_query}"

    # 打印生成的 SPARQL 查询 URL
    # print(f"[INFO] 生成的 SPARQL 查询 URL: {full_url}")
    headers = {
        "Content-Type": "application/x-www-form-urlencoded"
    }
    payload = {
        "query": sparql_query
    }

    response = requests.post(endpoint_url, data=payload, headers=headers)

    # 使用 curl 执行查询并获取 JSON 响应
    # result = subprocess.run(
    #     ["curl", full_url],
    #     capture_output=True,
    #     text=True,
    #     check=True
    # )
    # 将结果解析为 JSON
    if response.status_code == 400:
        return [None]
    elif response.status_code == 500:
        if "is not supported yet!" in response.text:
            print("-----------------")
            print("-----------------")
            print("OntopUnsupportedKGQueryException")
            print("-----------------")
            print("-----------------")
        return [None]
    response_data = response.json()

    vars = response_data['head']['vars']
    bindings = response_data['results']['bindings']
    results = []

    for b in bindings:
        result = []
        for v in vars:
            if v in b:
                if b[v]['type'] == 'literal':
                    result.append(b[v]['value'])
                if b[v]['type'] == 'uri':
                    uri = b[v]['value']
                    result.append("##iri##")
            else:
                result.append(None)
        if len(result) == 1:
            results.append(result[0])
        else:
            results.append(result)

    # 获取查询结果
    # results = [binding['count']['value'] for binding in response_data.get('results', {}).get('bindings', [])]


    return results


# 提取 SPARQL 查询
def extract_sparql_from_qpair(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    sparql_match = re.search(r"sparql\s*=\s*(.*?)(\ncategories=|\n\s*$)", content, re.DOTALL)
    if not sparql_match:
        sparql_match = re.search(r"sparql.*=.*?(pre.*)=?", content, re.DOTALL)

    if sparql_match:
        sparql_query = sparql_match.group(1).strip()
        sparql_query = sparql_query.replace("\\n", "\n").replace("\\", "").strip()
        if not sparql_query.endswith("}"):
            sparql_query = sparql_query[:sparql_query.rindex("}") + 1]
        return sparql_query
    else:
        raise ValueError(f"未能在文件 {file_path} 中找到 SPARQL 查询部分。")


# 提取 SQL 查询
def extract_sql_from_qpair(file_path):
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()
    sql_match = re.search(r"sql\s*=\s*(.*?)(?=\n\s*sparql\s*=|\Z)", content, re.DOTALL)
    if sql_match:
        sql_query = sql_match.group(1).strip()
        sql_query = sql_query.replace("\\n", " ").replace("\\", "").strip()
        return sql_query
    else:
        raise ValueError(f"未能在文件 {file_path} 中找到 SQL 查询部分。")


# 执行 SQL 查询
def execute_sql_query(dbname, sql_query):
    conn = psycopg2.connect(
        dbname=dbname,
        user="postgres",
        password="tFG+}@9,9>58I£k£>|=",
        host="122.51.66.48",
        port="5432"
    )
    cur = conn.cursor()
    cur.execute(f"SET search_path TO {dbname}, public;")
    conn.commit()
    cur.execute(sql_query)
    results_sql = cur.fetchall()
    cur.close()
    conn.close()

    results = []
    for row in results_sql:
        result = []
        for r in row:
            r = str(r)
            result.append(r)
        if len(result) == 1:
            results.append(result[0])
        else:
            results.append(result)
    return results


# 计算 Precision、Recall 和 F1
def calculate_precision_recall_f1(res:list[any], ref:list[any]):
    if ref and type(ref[0]) == list:
        idx_not_iri = []
        if res:
            if res[0]:
                res_item = res[0]
                for idx, value in enumerate(res_item):
                    if value != "##iri##":
                        idx_not_iri = [idx]
        new_res = []
        new_ref = []
        if idx_not_iri:
            for res_item in res:
                new_res.append([res_item[i] for i in idx_not_iri])

            for ref_item in ref:
                new_ref.append([ref_item[i] for i in idx_not_iri])

            res = new_res
            ref = new_ref
        res = [str(i) for i in res if i]
        ref = [str(i) for i in ref if i]

    matched_res_num = 0
    for r in res:
        if r in ref:
            matched_res_num += 1

    matched_ref_num = 0
    for r in ref:
        if r in res:
            matched_ref_num += 1
    precision = matched_res_num / len(res) if res else 0
    recall = matched_ref_num / len(ref) if ref else 0
    f1 = 2 * (precision * recall) / (precision + recall) if precision + recall > 0 else 0
    return precision, recall, f1


# 主评估函数
def run_evaluation_pipeline(
        ttl_mapping_file,
        ontology_file,
        property_file,
        qpair_folder,
        dbname,
        ontop_cli_path,
        output_metrics_path,
        output_f1_path
):
    """
    执行整个评估管道，包括 TTL 转换、Ontop 服务启动、SPARQL 和 SQL 查询执行以及指标计算。

    参数:
        - ttl_mapping_file: str, TTL 映射文件路径
        - ontology_file: str, 本体文件路径
        - property_file: str, Ontop 配置文件路径
        - qpair_folder: str, 查询对文件夹路径
        - dbname: str, 数据库名称
        - ontop_cli_path: str, Ontop CLI 工具所在路径
        - output_metrics_path: str, 输出指标 JSON 文件路径
        - output_f1_path: str, 输出平均 F1 分数的文件路径

    返回:
        - dict, 包括平均 Precision、Recall 和 F1，以及 JSON 结果路径
    """
    obda_mapping_file = os.path.splitext(ttl_mapping_file)[0] + ".obda"

    # 创建ontology.properties配置文件信息
    create_properties_file(property_file, dbname)

    # 转换 TTL 文件为 OBDA
    convert_ttl_to_obda(ttl_mapping_file, obda_mapping_file, ontop_cli_path)

    # 启动 Ontop Endpoint
    start_ontop_endpoint(obda_mapping_file, ontology_file, property_file, ontop_cli_path)

    # 检查服务可用性
    check_ontop_server()

    json_results = []

    error_pairs = []

    for qpair_file in tqdm(os.listdir(qpair_folder)):
        file_path = os.path.join(qpair_folder, qpair_file)
        if os.path.isfile(file_path) and file_path.endswith(".qpair"):
            sql_query = extract_sql_from_qpair(file_path)
            try:
                sql_results = execute_sql_query(dbname, sql_query)
            except psycopg2.errors.UndefinedTable as e:
                continue
            except psycopg2.errors.UndefinedColumn as e:
                continue
            sparql_query = extract_sparql_from_qpair(file_path)
            sparql_results = execute_sparql_query_as_url(sparql_query)
            precision, recall, f1 = calculate_precision_recall_f1(sparql_results, sql_results)

            json_results.append({
                "id": f"{dbname}.{qpair_file}",
                "sparql_query": sparql_query,
                "sparql_results": sparql_results,
                "sql_query": sql_query,
                "sql_results": sql_results,
                "precision": precision,
                "recall": recall,
                "f1": f1
            })

            if f1 != 1:
                error_pairs.append(json_results[-1])

    with open(output_metrics_path, "w", encoding="utf-8") as f:
        json.dump(json_results, f, indent=4, ensure_ascii=False)

    avg_precision = sum(item["precision"] for item in json_results) / len(json_results) if json_results else 0
    avg_recall = sum(item["recall"] for item in json_results) / len(json_results) if json_results else 0
    avg_f1 = sum(item["f1"] for item in json_results) / len(json_results) if json_results else 0

    with open(output_f1_path, "w", encoding="utf-8") as f:
        f.write(f"Average Precision: {avg_precision:.4f}\n")
        f.write(f"Average Recall: {avg_recall:.4f}\n")
        f.write(f"Average F1 Score: {avg_f1:.4f}\n")

    print(f"[INFO] Average Precision: {avg_precision:.4f}")
    print(f"[INFO] Average Recall: {avg_recall:.4f}")
    print(f"[INFO] Average F1 Score: {avg_f1:.4f}")

    print(f"[INFO] DBname: {dbname}")
    print(f"[INFO] mapping path: {ttl_mapping_file}")

    kill_process(port=int(endpoint_port))

    return {
        "average_precision": avg_precision,
        "average_recall": avg_recall,
        "average_f1": avg_f1,
        "metrics_json": output_metrics_path,
        "f1_file": output_f1_path
    }
