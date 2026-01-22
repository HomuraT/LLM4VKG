"""
数据处理模块 - 删除外键版本
该模块用于从 table_info 中删除所有外键信息，用于对比实验。

主要功能：
1. 读取 table_info
2. 删除所有表的外键信息
3. 保存处理后的 table_info（JSON 和 PT 格式）
"""

import os
import json
import torch
from pathlib import Path
from typing import Dict, Any


def remove_foreign_keys(table_info: Dict[str, Any]) -> Dict[str, Any]:
    """
    删除 table_info 中所有表的外键信息
    
    Args:
        table_info: 原始的表结构信息字典
        
    Returns:
        Dict[str, Any]: 删除外键后的表结构信息
    """
    # 创建深拷贝，避免修改原始数据
    table_info_no_fk = {}
    
    for table_name, table_data in table_info.items():
        # 复制表数据
        table_info_no_fk[table_name] = {
            "table_name": table_data["table_name"],
            "columns": table_data["columns"],
            "primary_keys": table_data["primary_keys"],
            "foreign_keys": []  # 清空外键列表
        }
    
    return table_info_no_fk


def process_database_remove_fk(dbname: str, table_info: Dict[str, Any], 
                                output_dir: str = None) -> tuple[str, str]:
    """
    处理数据库：删除外键并保存
    
    Args:
        dbname: 数据库名称
        table_info: 原始的表结构信息
        output_dir: 输出目录，默认为 src/dataEnrichment/input_nofk/{dbname}
        
    Returns:
        tuple[str, str]: (JSON文件路径, PT文件路径)
    """
    # 设置默认输出目录
    if output_dir is None:
        output_dir = f"src/dataEnrichment/input_nofk/{dbname}"
    
    # 创建输出目录
    os.makedirs(output_dir, exist_ok=True)
    
    # 删除外键
    print(f"\n处理数据库: {dbname}")
    original_fk_count = sum(len(table_data.get("foreign_keys", [])) 
                           for table_data in table_info.values())
    print(f"  - 原始外键数量: {original_fk_count}")
    
    table_info_no_fk = remove_foreign_keys(table_info)
    
    new_fk_count = sum(len(table_data.get("foreign_keys", [])) 
                       for table_data in table_info_no_fk.values())
    print(f"  - 删除后外键数量: {new_fk_count}")
    print(f"  - 已删除 {original_fk_count} 个外键")
    
    # 保存为 JSON 格式（便于人工查看）
    json_path = f"{output_dir}/table_info.json"
    with open(json_path, 'w', encoding='utf-8') as f:
        json.dump(table_info_no_fk, f, indent=2, ensure_ascii=False)
    print(f"  ✓ 保存 JSON: {json_path}")
    
    # 保存为 PT 格式（用于程序读取）
    pt_path = f"{output_dir}/table_info.pt"
    torch.save(table_info_no_fk, pt_path)
    print(f"  ✓ 保存 PT: {pt_path}")
    
    return json_path, pt_path


def main():
    """主函数：示例用法"""
    import sys
    sys.path.insert(0, str(Path(__file__).parent.parent.parent))
    
    from src.db_utils.db_utils import get_all_databases, get_table_structure
    from config import db_config
    
    # 获取所有数据库
    dbnames = get_all_databases(**db_config)
    
    print("=" * 80)
    print("数据处理模块 - 删除外键版本")
    print("=" * 80)
    
    for dbname in dbnames[:1]:  # 仅处理第一个数据库作为示例
        # 获取数据库的表结构信息
        db_schema = dbname
        if dbname.startswith("mondial"):
            db_schema = 'mondial_rdf2sql_standard'
        
        table_info = get_table_structure(dbname, **db_config, db_schema=db_schema)
        
        # 处理数据库并删除外键
        json_path, pt_path = process_database_remove_fk(dbname, table_info)
        
        print(f"\n✓ 数据库 '{dbname}' 处理完成！")
        print(f"  - JSON: {json_path}")
        print(f"  - PT: {pt_path}")
    
    print("\n" + "=" * 80)
    print("处理完成！")
    print("=" * 80)


if __name__ == "__main__":
    main()








