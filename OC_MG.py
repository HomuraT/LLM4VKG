"""
OC_MG.py - 本体补全和映射生成主程序

该脚本是LLM4VKG项目的核心执行文件，主要功能包括：
1. 本体补全(Ontology Completion, OC): 对现有本体进行扩展和完善
2. 映射生成(Mapping Generation, MG): 生成数据库表到本体的映射关系

作者: [作者信息]
日期: [创建日期]
"""

from tqdm import tqdm  # 进度条库，用于显示处理进度

# 导入配置文件
from config import db_config, llm_apis, subset_names
# 导入数据库相关工具函数
from src.db_utils.db_utils import get_table_structure
# 导入语言模型相关工具
from src.llm.utils.langchain_utils import Modules
# 导入通用工具函数
from src.utils.tools import load_json_file
# 导入VKG数据集处理类
from src.vkg_generation.VKGDatasets import OntologyDataset, TableDataset
# 导入本体补全和映射生成核心类
from src.vkg_generation.ontology_completion_mapping_generation import OntologyCompletion, MappingGeneration
import os
import torch
import traceback

if __name__ == "__main__":
    # 程序主入口，执行本体补全和映射生成流程
    
    # 获取RODI数据集中的所有数据库名称
    dbnames = os.listdir("datasets/rodi/")
    # 过滤掉隐藏文件（以"."开头的文件）
    dbnames = [i for i in dbnames if not i.startswith(".")]
    
    # 映射模式存储目录
    mapping_pattern_dir = 'outputs/mapping_patterns/'
    
    # 遍历不同的API模型（从配置文件中读取）
    for api_name in llm_apis.keys():
        # 遍历不同的数据集子集（从配置文件中读取）
        for subset_name in subset_names:  
            # 构建RODI数据集路径
            rodi_path = os.path.join('datasets/', subset_name)

            # 遍历所有数据库，显示处理进度
            for dbname in tqdm(dbnames, desc=f"{subset_name} dbname"):
                try:
                    # 设置数据库模式名，默认与数据库名相同
                    db_schema = dbname
                    # 特殊处理：mondial数据库使用标准化的模式名
                    if dbname.startswith("mondial"):
                        db_schema = 'mondial_rdf2sql_standard'

                    # 构建输出文件的基础路径
                    base_path = f'./outputs/{subset_name}/LLM4VKG_{api_name}/' + dbname
                    # 定义生成的本体文件名
                    generated_ontology_file_name = f'rodi_{dbname}_generated_ontology.ttl'
                    # 定义生成的映射文件名
                    generated_mapping_file_name = f'rodi_{dbname}_generated_mapping.ttl'

                    # 完成状态标志：[本体文件是否存在, 映射文件是否存在]
                    done_flag = [False] * 2
                    # 确保输出目录存在
                    os.makedirs(base_path, exist_ok=True)
                    
                    # 检查输出文件是否已存在，避免重复处理
                    for file_name in os.listdir(base_path):
                        if file_name == generated_ontology_file_name:
                            done_flag[0] = True  # 本体文件已存在
                        elif file_name == generated_mapping_file_name:
                            done_flag[1] = True  # 映射文件已存在

                    # 如果文件已存在，跳过处理
                    if all(done_flag):
                        print(f"{dbname}: 输出文件已存在，跳过处理")
                        continue

                    # 输出开始处理的信息
                    print(dbname, 'start***************************************')

                    # 双重检查：确保输出目录存在（冗余检查，但增加安全性）
                    if not os.path.exists(base_path):
                        os.makedirs(base_path)

                    # 构建本体文件路径
                    ontology_path = os.path.join(rodi_path, dbname, 'ontology.ttl')
                    
                    # 检查本体文件是否存在
                    if not os.path.exists(ontology_path):
                        print(f"警告: {dbname} 的本体文件不存在: {ontology_path}")
                        continue
                    
                    # 创建本体数据集对象，用于加载和处理本体文件
                    ontologyDataset = OntologyDataset(ontology_path)
                    # 获取数据库表结构信息
                    table_info = get_table_structure(dbname=dbname, db_schema=db_schema, **db_config)
                    # 创建表数据集对象，用于处理数据库表结构
                    tableDataset = TableDataset(table_info)
                    
                    # 加载本体补全的策略配置文件
                    strategy = load_json_file('setting/strategy/OntologyCompletion/LLM4VKG.json')
                    # 加载本体补全的提示词模板文件
                    prompts = load_json_file('prompts/OntologyCompletion/prompt.json')
                    
                    # 创建语言模型模块实例，配置指定的API
                    modules = Modules(strategy, prompts, set_all_api_id=api_name)

                    # ==================== 本体补全阶段 ====================
                    print(f"{dbname}: 开始本体补全...")
                    # 创建本体补全对象
                    OC = OntologyCompletion(modules=modules, db_schema=db_schema)
                    # 执行本体补全，返回补全后的本体和数据库到本体的映射关系
                    ontology, db2o = OC.run_ontology_completion(ontologyDataset, tableDataset)
                    
                    # 保存本体补全的中间结果（数据库到本体的映射关系）
                    torch.save(db2o, os.path.join(base_path, f'db2o.pt'))
                    # 保存补全后的本体
                    torch.save(ontology, os.path.join(base_path, f'ontology.pt'))
                    
                    # 重新加载保存的结果（确保数据一致性）
                    db2o = torch.load(os.path.join(base_path, f'db2o.pt'), weights_only=False)
                    ontology = torch.load(os.path.join(base_path, f'ontology.pt'), weights_only=False)
                    print(f"{dbname}: 本体补全完成，结果已保存")

                    # 重新加载原始本体文件（用于后续映射生成）
                    original_ontology = OntologyDataset(ontology_path)

                    # ==================== 映射生成阶段 ====================
                    print(f"{dbname}: 开始映射生成...")
                    # 检查映射模式文件是否存在
                    mapping_pattern_path = os.path.join(mapping_pattern_dir, dbname, f'mapping_pattern.pt')
                    if not os.path.exists(mapping_pattern_path):
                        print(f"警告: {dbname} 的映射模式文件不存在: {mapping_pattern_path}")
                        continue
                    
                    # 创建映射生成对象
                    MG = MappingGeneration(modules=modules, db_schema=db_schema)
                    # 执行映射生成，需要的输入包括：
                    # - table: 数据库表结构
                    # - db2o: 数据库到本体的映射关系
                    # - ontology: 补全后的本体
                    # - mapping_patterns: 预定义的映射模式
                    # - original_ontology: 原始本体
                    MG.run_mapping_generation(
                        table=tableDataset, 
                        db2o=db2o, 
                        ontology=ontology,
                        mapping_patterns=torch.load(mapping_pattern_path, weights_only=False), 
                        original_ontology=original_ontology
                    )
                    
                    # ==================== 结果输出阶段 ====================
                    print(f"{dbname}: 保存最终结果...")
                    # 将最终的本体序列化为Turtle格式文件
                    original_ontology.graph.serialize(
                        destination=os.path.join(base_path, generated_ontology_file_name),
                        format='turtle'
                    )
                    # 将生成的映射关系序列化为Turtle格式文件
                    MG.mapping.serialize(
                        destination=os.path.join(base_path, generated_mapping_file_name),
                        format='turtle'
                    )

                    # 输出处理完成信息
                    print(f"{dbname}: 处理完成！")
                    print('------------------------------------')
                    
                except FileNotFoundError as e:
                    print(f"错误: {dbname} - 文件未找到: {e}")
                    print(f"跳过数据库 {dbname} 的处理")
                    continue
                    
                except PermissionError as e:
                    print(f"错误: {dbname} - 权限错误: {e}")
                    print(f"跳过数据库 {dbname} 的处理")
                    continue
                    
                except torch.serialization.pickle.UnpicklingError as e:
                    print(f"错误: {dbname} - 文件加载错误: {e}")
                    print(f"跳过数据库 {dbname} 的处理")
                    continue
                    
                except KeyError as e:
                    print(f"错误: {dbname} - 配置或数据键错误: {e}")
                    print(f"跳过数据库 {dbname} 的处理")
                    continue
                    
                except Exception as e:
                    print(f"错误: {dbname} - 未知错误: {type(e).__name__}: {e}")
                    print(f"跳过数据库 {dbname} 的处理")
                    # 可选：记录详细的错误信息到日志文件
                    error_log_path = os.path.join('outputs', 'error_log.txt')
                    os.makedirs(os.path.dirname(error_log_path), exist_ok=True)
                    with open(error_log_path, 'a', encoding='utf-8') as f:
                        f.write(f"\n=== 错误时间: {dbname} - {subset_name} - {api_name} ===\n")
                        f.write(f"错误类型: {type(e).__name__}\n")
                        f.write(f"错误信息: {e}\n")
                        f.write("详细堆栈信息:\n")
                        traceback.print_exc(file=f)
                        f.write("\n" + "="*50 + "\n")
                    continue