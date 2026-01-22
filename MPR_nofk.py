"""
映射模式识别 - 使用 infk 数据版本 (Mapping Pattern Recognition - Using infk data, MPR_nofk)
该脚本用于分析数据库模式并识别其中的映射模式，直接使用 infk 目录中的 table_info。

主要功能：
1. 从 infk 目录加载 table_info.json（包含完整的外键信息）
2. 为每个数据库构建模式图（基于 infk 的表结构）
3. 识别数据库中的映射模式
4. 保存识别结果到文件

注意：该版本直接使用 infk 中的 table_info，不对其做任何修改（不删除外键）。
"""

import os
import json
import torch
from tqdm import tqdm
from rdflib import Graph as RDFGraph

from src.vkg_generation.mapping_pattern_recognition import DBSchemaGraph
from src.db_utils.db_utils import get_all_databases
from config import db_config

if __name__ == "__main__":
    # infk 目录的基础路径
    infk_base_dir = './nofk'
    
    # 获取 infk 目录下所有数据库名称
    dbnames = [d for d in os.listdir(infk_base_dir) 
               if os.path.isdir(os.path.join(infk_base_dir, d))]
    
    print(f"找到 {len(dbnames)} 个数据库在 infk 目录中")
    
    # 遍历每个数据库，使用进度条显示处理进度
    for dbname in tqdm(dbnames):
        # 默认情况下，数据库模式名与数据库名相同
        db_schema = dbname
        
        # 特殊处理：如果数据库名以"mondial"开头，使用特定的模式名
        if dbname.startswith("mondial"):
            db_schema = 'mondial_rdf2sql_standard'
        
        # 创建输出目录路径，用于保存映射模式识别结果
        # 注意：输出到不同的目录以区分使用 infk 数据的结果
        base_path = f'./outputs/mapping_patterns_nofk/{dbname}'

        if not os.path.exists(base_path):
            os.makedirs(base_path)
        
        print("dbname:", dbname)
        
        # 从 infk 目录加载 table_info.json
        infk_db_dir = os.path.join(infk_base_dir, dbname)
        table_info_json_path = os.path.join(infk_db_dir, 'table_info.json')
        
        if not os.path.exists(table_info_json_path):
            print(f"⚠️  警告: {dbname} 的 table_info.json 不存在于 infk 目录中")
            print(f"   路径: {table_info_json_path}")
            continue
        
        # 加载 table_info（包含完整的外键信息）
        print(f"\n从 infk 加载 table_info: {table_info_json_path}")
        with open(table_info_json_path, 'r', encoding='utf-8') as f:
            table_info = json.load(f)
        
        # 统计外键信息
        fk_count = sum(len(t.get("foreign_keys", [])) for t in table_info.values())
        print(f"✓ 已加载 table_info，包含 {len(table_info)} 个表，{fk_count} 个外键关系")

        print("\nbuild the graph...")
        # 基于 infk 的表结构信息构建数据库模式图（保留外键）
        # DBSchemaGraph类负责将数据库模式转换为图结构，便于后续的模式识别
        db_schema_graph = DBSchemaGraph(table_info=table_info)
        
        # 直接获取RDF图对象
        graph = db_schema_graph.graph

        # 保存 graph 到输出目录（可选，用于查看生成的图结构）
        graph_output_path = os.path.join(base_path, "graph.ttl")
        graph.serialize(destination=graph_output_path, format='turtle')
        print(f"saved graph to {graph_output_path}")

        # 注意：该版本直接使用 infk 中的数据，保留了外键信息
        print("\n⚠️  注意：该版本直接使用 infk 中的 table_info（保留外键）")

        print("graph building finished...")

        print("start to search...")
        # 存储不同类型映射模式的识别结果
        mapping_patterns = {}
        
        # 遍历所有预定义的映射模式类型
        for pattern_type in db_schema_graph.mapping_pattern_types:
            # 识别当前类型的映射模式实例
            pattern_instances = db_schema_graph.recognize_mapping_pattern(pattern_type)
            
            # 输出识别结果的统计信息
            print(pattern_type)  # 模式类型名称
            print(len(pattern_instances))  # 识别到的实例数量
            print(pattern_instances)  # 具体的实例详情
            
            # 将识别结果存储到字典中
            mapping_patterns[pattern_type] = pattern_instances
            print('-------------------')

        # 使用PyTorch的保存功能将映射模式识别结果保存为二进制文件
        torch.save(mapping_patterns, f"{base_path}/mapping_pattern.pt")
        print("saved mapping_pattern.pt")
        
        # 同时保存 JSON 格式，便于查看
        with open(f"{base_path}/mapping_pattern.json", 'w', encoding='utf-8') as f:
            json.dump(mapping_patterns, f, indent=2, ensure_ascii=False, default=str)
        print("saved mapping_pattern.json")
        
        # 保存 table_info.pt 供 OC_MG_nofk.py 使用
        table_info_pt_path = os.path.join(base_path, "table_info.pt")
        torch.save(table_info, table_info_pt_path)
        print(f"saved table_info.pt to {table_info_pt_path}")
        print(f"✓ {dbname} 处理完成！")
