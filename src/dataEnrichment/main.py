"""
数据增强模块 (Data Enrichment Module)
该模块使用 LangChain 和 LLM API 来增强数据库模式图，补充外键关系信息。

主要功能：
1. 读取 input 文件夹下的 table_info.json 和 graph.ttl 文件
2. 使用大模型分析数据库结构并推断可能缺失的外键关系
3. 生成增强后的新 TTL 文件
4. 保存结果到 infk 文件夹

作者：LLM4VKG项目组
"""

import os
import sys
import json
from pathlib import Path
from typing import Dict, Any, Optional

# 添加项目根目录到 Python 路径
project_root = Path(__file__).parent.parent.parent
sys.path.insert(0, str(project_root))

from langchain.prompts import PromptTemplate
from langchain.chains import LLMChain
from langchain_core.output_parsers import JsonOutputParser
from pydantic import BaseModel, Field

from src.llm.utils.langchain_utils import CustomLLM
from config import DATA_ENRICHMENT_CONFIG, API_CONFIG_PATH, DEFAULT_API_ID


class ForeignKeyRelation(BaseModel):
    """外键关系的数据模型"""
    source_table: str = Field(description="源表名称")
    source_column: str = Field(description="源列名称")
    target_table: str = Field(description="目标表名称")
    target_column: str = Field(description="目标列名称")
    confidence: float = Field(description="置信度 (0-1之间)", ge=0.0, le=1.0)
    reason: str = Field(description="推断该外键关系的理由")


class EnrichedSchema(BaseModel):
    """增强后的数据库模式"""
    suggested_foreign_keys: list[ForeignKeyRelation] = Field(
        description="建议添加的外键关系列表"
    )
    analysis_summary: str = Field(description="分析总结")


class DataEnrichment:
    """数据增强类，使用 LLM 分析和增强数据库模式"""
    
    def __init__(self, api_id: str = None, input_base_dir: str = None, output_base_dir: str = None):
        """
        初始化数据增强类
        
        Args:
            api_id: LLM API 的 ID，默认从配置文件读取
            input_base_dir: 输入文件夹的基础路径，默认从配置文件读取
            output_base_dir: 输出文件夹的基础路径，默认从配置文件读取
        """
        # 从配置文件读取默认值
        self.api_id = api_id or DATA_ENRICHMENT_CONFIG["default_api_id"]
        self.input_base_dir = input_base_dir or DATA_ENRICHMENT_CONFIG["input_dir"]
        self.output_base_dir = output_base_dir or DATA_ENRICHMENT_CONFIG["output_dir"]
        
        print(f"数据增强配置:")
        print(f"  - API ID: {self.api_id}")
        print(f"  - API 配置文件: {API_CONFIG_PATH}")
        print(f"  - 输入目录: {self.input_base_dir}")
        print(f"  - 输出目录: {self.output_base_dir}")
        
        # 初始化 LLM（使用从配置读取或传入的 api_id）
        self.llm = CustomLLM(api_id=self.api_id)
        
        # 初始化输出解析器
        self.parser = JsonOutputParser(pydantic_object=EnrichedSchema)
        
        # 创建 prompt 模板
        self.prompt_template = PromptTemplate(
            input_variables=["table_info", "graph_ttl", "format_instructions"],
            template="""你是一个数据库专家，擅长分析数据库模式并识别表之间的关系。

                    请分析以下数据库模式信息，识别可能缺失的外键关系。

                    **数据库表结构信息（JSON格式）：**
                    ```json
                    {table_info}
                    ```

                    **当前的 RDF 图结构（TTL格式）：**
                    ```turtle
                    {graph_ttl}
                    ```

                    **任务要求：**
                    1. 仔细分析表结构中的列名、数据类型和现有的外键关系
                    2. 根据列名的语义（如 ID、_id、_ID 等后缀）、数据类型的匹配程度，推断可能的外键关系
                    3. 对于每个建议的外键关系，给出置信度（0-1之间）和推理依据
                    4. 只建议高置信度（>0.7）的外键关系
                    5. 如果某个表的列名包含其他表名或与其他表的主键相似，很可能存在外键关系
                    6. 注意：不要重复已经存在的外键关系

                    **输出格式：**
                    {format_instructions}

                    请仔细分析并给出你的建议：
"""
        )
        
        # 创建 LangChain 链
        self.chain = self.prompt_template | self.llm | self.parser
        
        # 创建只使用 table_info 的 prompt 模板
        self.prompt_template_table_only = PromptTemplate(
            input_variables=["table_info", "format_instructions"],
            template="""你是一个数据库专家，擅长分析数据库模式并识别表之间的关系。

                    请仅根据以下数据库表结构信息，识别可能缺失的外键关系。

                    **数据库表结构信息（JSON格式）：**
                    ```json
                    {table_info}
                    ```

                    **任务要求：**
                    1. 仔细分析表结构中的列名、数据类型和现有的外键关系
                    2. 根据列名的语义（如 ID、_id、_ID 等后缀）、数据类型的匹配程度，推断可能的外键关系
                    3. 对于每个建议的外键关系，给出置信度（0-1之间）和推理依据
                    4. 只建议高置信度（>0.7）的外键关系
                    5. 如果某个表的列名包含其他表名或与其他表的主键相似，很可能存在外键关系
                    6. 注意：不要重复已经存在的外键关系

                    **输出格式：**
                    {format_instructions}

                    请仔细分析并给出你的建议：
"""
        )
        
        # 创建只使用 graph.ttl 的 prompt 模板
        self.prompt_template_graph_only = PromptTemplate(
            input_variables=["graph_ttl", "format_instructions"],
            template="""你是一个数据库专家，擅长分析RDF图结构并识别表之间的关系。

                    请仅根据以下RDF图结构信息，识别可能缺失的外键关系。

                    **当前的 RDF 图结构（TTL格式）：**
                    ```turtle
                    {graph_ttl}
                    ```

                    **任务要求：**
                    1. 仔细分析 TTL 图中的实体（表和列）及其现有关系
                    2. 根据实体的命名模式和结构，推断可能的外键关系
                    3. 对于每个建议的外键关系，给出置信度（0-1之间）和推理依据
                    4. 只建议高置信度（>0.7）的外键关系
                    5. 如果某个列的名称暗示与其他表存在关联（如包含表名或ID），很可能存在外键关系
                    6. 注意：不要重复已经存在的外键关系

                    **输出格式：**
                    {format_instructions}

                    请仔细分析并给出你的建议：
"""
        )
        
        # 创建对应的链
        self.chain_table_only = self.prompt_template_table_only | self.llm | self.parser
        self.chain_graph_only = self.prompt_template_graph_only | self.llm | self.parser
    
    def load_database_files(self, db_name: str) -> tuple[Dict[str, Any], str]:
        """
        加载指定数据库的 JSON 和 TTL 文件
        
        Args:
            db_name: 数据库名称
            
        Returns:
            tuple: (table_info_dict, graph_ttl_string)
        """
        db_dir = Path(self.input_base_dir) / db_name
        
        # 检查目录是否存在
        if not db_dir.exists():
            raise FileNotFoundError(f"数据库目录不存在: {db_dir}")
        
        # 读取 table_info.json
        table_info_path = db_dir / "table_info.json"
        if not table_info_path.exists():
            raise FileNotFoundError(f"找不到 table_info.json: {table_info_path}")
        
        with open(table_info_path, 'r', encoding='utf-8') as f:
            table_info = json.load(f)
        
        # 读取 graph.ttl
        graph_ttl_path = db_dir / "graph.ttl"
        if not graph_ttl_path.exists():
            raise FileNotFoundError(f"找不到 graph.ttl: {graph_ttl_path}")
        
        with open(graph_ttl_path, 'r', encoding='utf-8') as f:
            graph_ttl = f.read()
        
        print(f"成功加载数据库 '{db_name}' 的文件")
        print(f"  - 表数量: {len(table_info)}")
        print(f"  - TTL 文件大小: {len(graph_ttl)} 字符")
        
        return table_info, graph_ttl
    
    def analyze_and_enrich(self, db_name: str) -> EnrichedSchema:
        """
        分析数据库并生成增强建议（使用table_info和graph.ttl）
        
        Args:
            db_name: 数据库名称
            
        Returns:
            EnrichedSchema: 增强后的模式信息
        """
        # 加载文件
        table_info, graph_ttl = self.load_database_files(db_name)
        
        # 准备输入
        format_instructions = self.parser.get_format_instructions()
        
        print(f"\n开始分析数据库 '{db_name}'...")
        print("正在调用 LLM API...")
        
        # 调用 LangChain 链
        try:
            result = self.chain.invoke({
                "table_info": json.dumps(table_info, indent=2, ensure_ascii=False),
                "graph_ttl": graph_ttl[:2000] + "\n...(省略部分内容)..." if len(graph_ttl) > 2000 else graph_ttl,
                "format_instructions": format_instructions
            })
            
            print("✓ LLM 分析完成")
            
            # 解析结果
            enriched_schema = EnrichedSchema(**result)
            return enriched_schema
            
        except Exception as e:
            print(f"✗ 分析过程出错: {e}")
            raise
    
    def analyze_and_enrich_table_only(self, db_name: str) -> EnrichedSchema:
        """
        仅使用table_info分析数据库并生成增强建议
        
        Args:
            db_name: 数据库名称
            
        Returns:
            EnrichedSchema: 增强后的模式信息
        """
        # 加载table_info
        db_dir = Path(self.input_base_dir) / db_name
        table_info_path = db_dir / "table_info.json"
        
        if not table_info_path.exists():
            raise FileNotFoundError(f"找不到 table_info.json: {table_info_path}")
        
        with open(table_info_path, 'r', encoding='utf-8') as f:
            table_info = json.load(f)
        
        print(f"成功加载数据库 '{db_name}' 的 table_info.json")
        print(f"  - 表数量: {len(table_info)}")
        
        # 准备输入
        format_instructions = self.parser.get_format_instructions()
        
        print(f"\n开始分析数据库 '{db_name}' (仅使用table_info)...")
        print("正在调用 LLM API...")
        
        # 调用 LangChain 链
        try:
            result = self.chain_table_only.invoke({
                "table_info": json.dumps(table_info, indent=2, ensure_ascii=False),
                "format_instructions": format_instructions
            })
            
            print("✓ LLM 分析完成")
            
            # 解析结果
            enriched_schema = EnrichedSchema(**result)
            return enriched_schema
            
        except Exception as e:
            print(f"✗ 分析过程出错: {e}")
            raise
    
    def analyze_and_enrich_graph_only(self, db_name: str) -> EnrichedSchema:
        """
        仅使用graph.ttl分析数据库并生成增强建议
        
        Args:
            db_name: 数据库名称
            
        Returns:
            EnrichedSchema: 增强后的模式信息
        """
        # 加载graph.ttl
        db_dir = Path(self.input_base_dir) / db_name
        graph_ttl_path = db_dir / "graph.ttl"
        
        if not graph_ttl_path.exists():
            raise FileNotFoundError(f"找不到 graph.ttl: {graph_ttl_path}")
        
        with open(graph_ttl_path, 'r', encoding='utf-8') as f:
            graph_ttl = f.read()
        
        print(f"成功加载数据库 '{db_name}' 的 graph.ttl")
        print(f"  - TTL 文件大小: {len(graph_ttl)} 字符")
        
        # 准备输入
        format_instructions = self.parser.get_format_instructions()
        
        print(f"\n开始分析数据库 '{db_name}' (仅使用graph.ttl)...")
        print("正在调用 LLM API...")
        
        # 调用 LangChain 链
        try:
            result = self.chain_graph_only.invoke({
                "graph_ttl": graph_ttl[:2000] + "\n...(省略部分内容)..." if len(graph_ttl) > 2000 else graph_ttl,
                "format_instructions": format_instructions
            })
            
            print("✓ LLM 分析完成")
            
            # 解析结果
            enriched_schema = EnrichedSchema(**result)
            return enriched_schema
            
        except Exception as e:
            print(f"✗ 分析过程出错: {e}")
            raise
    
    def generate_enriched_ttl(self, db_name: str, enriched_schema: EnrichedSchema) -> str:
        """
        根据增强建议生成新的 TTL 文件
        
        Args:
            db_name: 数据库名称
            enriched_schema: 增强后的模式信息
            
        Returns:
            str: 增强后的 TTL 内容
        """
        # 读取原始 TTL
        _, original_ttl = self.load_database_files(db_name)
        
        # 生成新的外键三元组
        new_triples = []
        new_triples.append("\n# ========== 以下是 LLM 建议添加的外键关系 ==========\n")
        
        for fk in enriched_schema.suggested_foreign_keys:
            # 生成 TTL 格式的外键关系
            source_uri = f"<http://example.org/{fk.source_table}/{fk.source_column}>"
            target_uri = f"<http://example.org/{fk.target_table}/{fk.target_column}>"
            
            triple = f"{source_uri} <http://example.org/hasFK> {target_uri} ."
            comment = f"# 置信度: {fk.confidence:.2f} | 理由: {fk.reason}"
            
            new_triples.append(comment)
            new_triples.append(triple)
            new_triples.append("")
        
        # 添加分析总结
        new_triples.append(f"# 分析总结: {enriched_schema.analysis_summary}")
        
        # 合并原始 TTL 和新增内容
        enriched_ttl = original_ttl + "\n" + "\n".join(new_triples)
        
        return enriched_ttl
    
    def save_enriched_ttl(self, db_name: str, enriched_ttl: str, enriched_schema: EnrichedSchema, 
                          output_subdir: str = "") -> str:
        """
        保存增强后的 TTL 文件
        
        Args:
            db_name: 数据库名称
            enriched_ttl: 增强后的 TTL 内容
            enriched_schema: 增强后的模式信息
            output_subdir: 输出子目录（用于区分不同方法），默认为空
            
        Returns:
            str: 保存的文件路径
        """
        # 创建输出目录
        if output_subdir:
            output_dir = Path(self.output_base_dir) / output_subdir / db_name
        else:
            output_dir = Path(self.output_base_dir) / db_name
        output_dir.mkdir(parents=True, exist_ok=True)
        
        # 保存 TTL 文件
        ttl_output_path = output_dir / "enriched_graph.ttl"
        with open(ttl_output_path, 'w', encoding='utf-8') as f:
            f.write(enriched_ttl)
        
        print(f"✓ 保存增强后的 TTL 文件: {ttl_output_path}")
        
        # 同时保存 JSON 格式的分析结果
        json_output_path = output_dir / "enrichment_analysis.json"
        with open(json_output_path, 'w', encoding='utf-8') as f:
            json.dump(enriched_schema.model_dump(), f, indent=2, ensure_ascii=False)
        
        print(f"✓ 保存分析结果: {json_output_path}")
        
        return str(ttl_output_path)
    
    def process_database(self, db_name: str) -> str:
        """
        完整的数据库处理流程（使用table_info和graph.ttl）
        
        Args:
            db_name: 数据库名称
            
        Returns:
            str: 输出文件路径
        """
        print(f"\n{'='*60}")
        print(f"开始处理数据库: {db_name}")
        print(f"{'='*60}")
        
        # 1. 分析和增强
        enriched_schema = self.analyze_and_enrich(db_name)
        
        # 2. 显示结果
        print(f"\n发现 {len(enriched_schema.suggested_foreign_keys)} 个建议的外键关系:")
        for i, fk in enumerate(enriched_schema.suggested_foreign_keys, 1):
            print(f"  {i}. {fk.source_table}.{fk.source_column} -> "
                  f"{fk.target_table}.{fk.target_column} "
                  f"(置信度: {fk.confidence:.2f})")
        
        print(f"\n分析总结: {enriched_schema.analysis_summary}")
        
        # 3. 生成和保存 TTL
        enriched_ttl = self.generate_enriched_ttl(db_name, enriched_schema)
        output_path = self.save_enriched_ttl(db_name, enriched_ttl, enriched_schema)
        
        print(f"\n✓ 数据库 '{db_name}' 处理完成！")
        print(f"{'='*60}\n")
        
        return output_path
    
    def process_database_table_only(self, db_name: str) -> str:
        """
        完整的数据库处理流程（仅使用table_info）
        
        Args:
            db_name: 数据库名称
            
        Returns:
            str: 输出文件路径
        """
        print(f"\n{'='*60}")
        print(f"开始处理数据库: {db_name} (仅使用table_info)")
        print(f"{'='*60}")
        
        # 1. 分析和增强
        enriched_schema = self.analyze_and_enrich_table_only(db_name)
        
        # 2. 显示结果
        print(f"\n发现 {len(enriched_schema.suggested_foreign_keys)} 个建议的外键关系:")
        for i, fk in enumerate(enriched_schema.suggested_foreign_keys, 1):
            print(f"  {i}. {fk.source_table}.{fk.source_column} -> "
                  f"{fk.target_table}.{fk.target_column} "
                  f"(置信度: {fk.confidence:.2f})")
        
        print(f"\n分析总结: {enriched_schema.analysis_summary}")
        
        # 3. 生成和保存 TTL（需要读取原始graph.ttl作为基础）
        enriched_ttl = self.generate_enriched_ttl(db_name, enriched_schema)
        output_path = self.save_enriched_ttl(db_name, enriched_ttl, enriched_schema, 
                                              output_subdir="table_only")
        
        print(f"\n✓ 数据库 '{db_name}' 处理完成！(仅使用table_info)")
        print(f"{'='*60}\n")
        
        return output_path
    
    def process_database_graph_only(self, db_name: str) -> str:
        """
        完整的数据库处理流程（仅使用graph.ttl）
        
        Args:
            db_name: 数据库名称
            
        Returns:
            str: 输出文件路径
        """
        print(f"\n{'='*60}")
        print(f"开始处理数据库: {db_name} (仅使用graph.ttl)")
        print(f"{'='*60}")
        
        # 1. 分析和增强
        enriched_schema = self.analyze_and_enrich_graph_only(db_name)
        
        # 2. 显示结果
        print(f"\n发现 {len(enriched_schema.suggested_foreign_keys)} 个建议的外键关系:")
        for i, fk in enumerate(enriched_schema.suggested_foreign_keys, 1):
            print(f"  {i}. {fk.source_table}.{fk.source_column} -> "
                  f"{fk.target_table}.{fk.target_column} "
                  f"(置信度: {fk.confidence:.2f})")
        
        print(f"\n分析总结: {enriched_schema.analysis_summary}")
        
        # 3. 生成和保存 TTL（需要读取原始graph.ttl作为基础）
        enriched_ttl = self.generate_enriched_ttl(db_name, enriched_schema)
        output_path = self.save_enriched_ttl(db_name, enriched_ttl, enriched_schema, 
                                              output_subdir="graph_only")
        
        print(f"\n✓ 数据库 '{db_name}' 处理完成！(仅使用graph.ttl)")
        print(f"{'='*60}\n")
        
        return output_path


def main():
    """主函数：示例用法"""
    # 创建数据增强对象（使用配置文件中的默认设置）
    enricher = DataEnrichment()
    
    # 处理示例数据库
    db_name = "cmt_denormalized"  # 可以改成其他数据库名
    
    print("=" * 80)
    print("数据增强模块 - 演示三种方法")
    print("=" * 80)
    
    try:
        # 方法1：使用 table_info 和 graph.ttl（原始方法）
        print("\n【方法 1】使用 table_info 和 graph.ttl")
        output_path_1 = enricher.process_database(db_name)
        print(f"✓ 成功！输出文件: {output_path_1}")
        
        # 方法2：仅使用 table_info
        print("\n【方法 2】仅使用 table_info")
        output_path_2 = enricher.process_database_table_only(db_name)
        print(f"✓ 成功！输出文件: {output_path_2}")
        
        # 方法3：仅使用 graph.ttl
        print("\n【方法 3】仅使用 graph.ttl")
        output_path_3 = enricher.process_database_graph_only(db_name)
        print(f"✓ 成功！输出文件: {output_path_3}")
        
        print("\n" + "=" * 80)
        print("所有方法执行完成！")
        print("=" * 80)
        print(f"\n输出目录结构:")
        print(f"  - 方法1 (table_info + graph.ttl): infk/{db_name}/")
        print(f"  - 方法2 (仅table_info):          infk/table_only/{db_name}/")
        print(f"  - 方法3 (仅graph.ttl):           infk/graph_only/{db_name}/")
        
    except Exception as e:
        print(f"处理失败: {e}")
        import traceback
        traceback.print_exc()


if __name__ == "__main__":
    main()

