"""
映射模式识别 (Mapping Pattern Recognition, MPR) 脚本
该脚本用于分析数据库模式并识别其中的映射模式，为虚拟知识图谱生成提供支持。

主要功能：
1. 获取所有数据库信息
2. 为每个数据库构建模式图
3. 识别数据库中的映射模式
4. 使用 LLM 进行数据增强（识别缺失的外键关系）
5. 保存识别结果到文件

"""

import os
import json
import torch
from tqdm import tqdm
from rdflib import Graph as RDFGraph

from src.vkg_generation.mapping_pattern_recognition import DBSchemaGraph
from src.db_utils.db_utils import get_all_databases, get_table_structure
from src.dataEnrichment.main import DataEnrichment
from config import db_config

if __name__ == "__main__":
    # 获取配置文件中所有数据库的名称列表
    dbnames = get_all_databases(**db_config)
    
    # 遍历每个数据库，使用进度条显示处理进度
    for dbname in tqdm(dbnames):
        # 默认情况下，数据库模式名与数据库名相同
        db_schema = dbname
        
        # 特殊处理：如果数据库名以"mondial"开头，使用特定的模式名
        if dbname.startswith("mondial"):
            db_schema = 'mondial_rdf2sql_standard'
        
        # 创建输出目录路径，用于保存映射模式识别结果
        base_path = f'./outputs/mapping_patterns/{dbname}'

        if not os.path.exists(base_path) :
            os.makedirs(base_path)
        
        print("dbname:", dbname)
        
        # 获取数据库的表结构信息，包括表名、列名、数据类型、约束等
        table_info = get_table_structure(dbname, **db_config, db_schema=db_schema)
        
        # 首先确保 dataEnrichment 的输入目录存在
        graph_output_dir = f"src/dataEnrichment/input/{dbname}"
        if not os.path.exists(graph_output_dir):
            os.makedirs(graph_output_dir)
        
        # 保存 table_info 到 dataEnrichment 的 input 文件夹中
        # 保存为 .pt 格式（用于程序读取）
        torch.save(table_info, f"{graph_output_dir}/table_info.pt")
        print(f"saved table_info to {graph_output_dir}/table_info.pt")
        
        # 保存为 JSON 格式（便于人工查看）
        with open(f"{graph_output_dir}/table_info.json", 'w', encoding='utf-8') as f:
            json.dump(table_info, f, indent=2, ensure_ascii=False)
        print(f"saved table_info to {graph_output_dir}/table_info.json")

        print("build the graph...")
        # 基于表结构信息构建数据库模式图
        # DBSchemaGraph类负责将数据库模式转换为图结构，便于后续的模式识别
        db_schema_graph = DBSchemaGraph(table_info=table_info)
        
        # 直接获取RDF图对象
        graph = db_schema_graph.graph

        # 保存 graph 到 dataEnrichment 的 input 文件夹中
        graph.serialize(destination=f"{graph_output_dir}/graph.ttl", format='turtle')
        print(f"saved graph to {graph_output_dir}/graph.ttl")

        # 增强graph - 使用 LLM 识别缺失的外键关系
        print("\n开始数据增强...")
        try:
            enricher = DataEnrichment()
            enriched_graph_path = enricher.process_database(dbname)
            print(f"✅ 数据增强完成: {enriched_graph_path}")
            
            # 加载增强后的图，替换原来的图
            enriched_graph = RDFGraph()
            enriched_graph.parse(enriched_graph_path, format='turtle')
            db_schema_graph.graph = enriched_graph
            print(f"✅ 已使用增强后的图进行后续处理\n")
        except Exception as e:
            print(f"⚠️  数据增强跳过: {e}")
            print(f"   将使用原始图继续处理\n")


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
