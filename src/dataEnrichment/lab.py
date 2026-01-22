"""
实验室模块 (Lab Module)
基于 main.py 的实验性外键生成方法

核心功能：
2. 多轮迭代优化 - 逐步发现更多外键关系

作者：LLM4VKG项目组
"""

import json
from pathlib import Path
from typing import Dict, Any, List

from main import DataEnrichment, EnrichedSchema
from langchain.prompts import PromptTemplate


class LabEnrichment(DataEnrichment):
    """实验性数据增强类，继承自 DataEnrichment"""
    
    def __init__(self, api_id: str = None, input_base_dir: str = None, output_base_dir: str = None):
        """初始化实验性增强类"""
        super().__init__(api_id, input_base_dir, output_base_dir)
        
        # 创建增强的prompt模板（使用Few-shot Learning）
        self.prompt_template_few_shot = PromptTemplate(
            input_variables=["table_info", "graph_ttl", "format_instructions", "examples"],
            template="""你是一个经验丰富的数据库专家，擅长分析数据库模式并识别表之间的关系。

**参考示例：**
{examples}

**当前数据库表结构信息（JSON格式）：**
```json
{table_info}
```

**当前的 RDF 图结构（TTL格式）：**
```turtle
{graph_ttl}
```

**任务要求：**
1. 参考上述示例，仔细分析表结构中的列名、数据类型和现有的外键关系
2. 根据列名的语义（如 ID、_id、_ID 等后缀）、数据类型的匹配程度，推断可能的外键关系
3. 特别关注：
   - 列名包含其他表名的情况
   - 以ID结尾且类型为整数的列
   - 语义上表示关联关系的列（如author_id, paper_id等）
4. 对于每个建议的外键关系，给出置信度（0-1之间）和详细的推理依据
5. 只建议高置信度（>0.7）的外键关系
6. 注意：不要重复已经存在的外键关系

**输出格式：**
{format_instructions}

请仔细分析并给出你的建议：
"""
        )
        
        # 创建多轮迭代的prompt模板
        self.prompt_template_iterative = PromptTemplate(
            input_variables=["table_info", "previous_suggestions", "format_instructions"],
            template="""你是一个数据库专家。现在需要对之前的外键建议进行审查和优化。

**数据库表结构信息：**
```json
{table_info}
```

**之前的外键建议：**
```json
{previous_suggestions}
```

**任务要求：**
1. 审查之前的建议，确认是否合理
2. 寻找可能被遗漏的外键关系
3. 对于每个新发现或修正的外键关系，给出置信度和理由
4. 只保留高置信度（>0.75）的建议

**输出格式：**
{format_instructions}

请给出优化后的建议：
"""
        )
        
        # 创建对应的链
        self.chain_few_shot = self.prompt_template_few_shot | self.llm | self.parser
        self.chain_iterative = self.prompt_template_iterative | self.llm | self.parser
    
    def get_few_shot_examples(self) -> str:
        """获取Few-shot示例"""
        examples = """
示例1：
表 Papers: id (INT), title (VARCHAR), author_id (INT)
表 Authors: id (INT), name (VARCHAR)
→ 外键: Papers.author_id -> Authors.id
  理由: Papers表的author_id列名明确指向Authors表，且类型匹配
  置信度: 0.95

示例2：
表 Reviews: id (INT), paper_id (INT), reviewer_id (INT)
表 Papers: id (INT), title (VARCHAR)
表 Reviewers: id (INT), name (VARCHAR)
→ 外键1: Reviews.paper_id -> Papers.id
→ 外键2: Reviews.reviewer_id -> Reviewers.id
  理由: 列名明确表示了关联关系，类型匹配
  置信度: 0.95
"""
        return examples
    
    def analyze_with_few_shot(self, db_name: str) -> EnrichedSchema:
        """
        使用Few-shot Learning进行分析
        
        Args:
            db_name: 数据库名称
            
        Returns:
            EnrichedSchema: 增强后的模式信息
        """
        print(f"\n{'='*60}")
        print(f"【实验方法1】Few-shot Learning 分析")
        print(f"{'='*60}")
        
        # 加载文件
        table_info, graph_ttl = self.load_database_files(db_name)
        
        # 获取示例
        examples = self.get_few_shot_examples()
        
        # 准备输入
        format_instructions = self.parser.get_format_instructions()
        
        print(f"正在使用Few-shot方法分析数据库 '{db_name}'...")
        
        try:
            result = self.chain_few_shot.invoke({
                "table_info": json.dumps(table_info, indent=2, ensure_ascii=False),
                "graph_ttl": graph_ttl[:2000] + "\n...(省略部分内容)..." if len(graph_ttl) > 2000 else graph_ttl,
                "format_instructions": format_instructions,
                "examples": examples
            })
            
            print("✓ Few-shot分析完成")
            enriched_schema = EnrichedSchema(**result)
            return enriched_schema
            
        except Exception as e:
            print(f"✗ 分析过程出错: {e}")
            raise
    
    def analyze_with_iteration(self, db_name: str, iterations: int = 2) -> EnrichedSchema:
        """
        使用多轮迭代方法进行分析
        
        Args:
            db_name: 数据库名称
            iterations: 迭代次数
            
        Returns:
            EnrichedSchema: 增强后的模式信息
        """
        print(f"\n{'='*60}")
        print(f"【实验方法2】多轮迭代分析 (迭代{iterations}次)")
        print(f"{'='*60}")
        
        # 第一轮：使用标准方法
        print(f"\n第1轮分析...")
        current_schema = self.analyze_and_enrich(db_name)
        
        # 后续迭代
        table_info, _ = self.load_database_files(db_name)
        
        for i in range(2, iterations + 1):
            print(f"\n第{i}轮分析（优化和补充）...")
            
            format_instructions = self.parser.get_format_instructions()
            
            try:
                result = self.chain_iterative.invoke({
                    "table_info": json.dumps(table_info, indent=2, ensure_ascii=False),
                    "previous_suggestions": json.dumps(
                        [fk.model_dump() for fk in current_schema.suggested_foreign_keys],
                        indent=2, 
                        ensure_ascii=False
                    ),
                    "format_instructions": format_instructions
                })
                
                current_schema = EnrichedSchema(**result)
                print(f"✓ 第{i}轮分析完成，当前建议数量: {len(current_schema.suggested_foreign_keys)}")
                
            except Exception as e:
                print(f"✗ 第{i}轮分析出错: {e}")
                break
        
        return current_schema
    
    def batch_analyze_databases(self, db_names: List[str], method: str = "standard", 
                                 output_subdir: str = None) -> Dict[str, EnrichedSchema]:
        """
        批量分析多个数据库并保存结果
        
        Args:
            db_names: 数据库名称列表
            method: 分析方法 ("standard", "few_shot", "iterative")
            output_subdir: 输出子目录，默认根据方法自动命名
            
        Returns:
            Dict: 数据库名称到增强结果的映射
        """
        print(f"\n{'='*60}")
        print(f"【批量分析】处理 {len(db_names)} 个数据库")
        print(f"分析方法: {method}")
        print(f"{'='*60}")
        
        # 设置默认输出目录
        if output_subdir is None:
            output_subdir = f"lab_{method}" if method != "standard" else ""
        
        results = {}
        
        for i, db_name in enumerate(db_names, 1):
            print(f"\n[{i}/{len(db_names)}] 处理数据库: {db_name}")
            
            try:
                # 选择分析方法
                if method == "few_shot":
                    schema = self.analyze_with_few_shot(db_name)
                elif method == "iterative":
                    schema = self.analyze_with_iteration(db_name)
                else:  # standard
                    schema = self.analyze_and_enrich(db_name)
                
                results[db_name] = schema
                
                # 生成并保存TTL
                enriched_ttl = self.generate_enriched_ttl(db_name, schema)
                self.save_enriched_ttl(db_name, enriched_ttl, schema, output_subdir=output_subdir)
                
                print(f"✓ {db_name} 分析并保存完成")
                
            except Exception as e:
                print(f"✗ {db_name} 分析失败: {e}")
                continue
        
        print(f"\n✓ 批量分析完成！成功处理 {len(results)}/{len(db_names)} 个数据库")
        return results


def main():
    """主函数：演示实验室模块的核心功能"""
    print("=" * 80)
    print("Lab 实验室模块 - 演示新的外键生成方法")
    print("=" * 80)
    
    # 创建实验对象
    lab = LabEnrichment()
    
    # 测试数据库
    db_name = "cmt_denormalized"
    
    try:
        # 方法1：Few-shot Learning
        print("\n【方法 1】Few-shot Learning 方法")
        schema_few_shot = lab.analyze_with_few_shot(db_name)
        enriched_ttl = lab.generate_enriched_ttl(db_name, schema_few_shot)
        output_path_1 = lab.save_enriched_ttl(db_name, enriched_ttl, schema_few_shot, 
                                               output_subdir="lab_few_shot")
        print(f"✓ 发现 {len(schema_few_shot.suggested_foreign_keys)} 个外键关系")
        print(f"✓ 输出文件: {output_path_1}")
        
        # 方法2：多轮迭代
        print("\n【方法 2】多轮迭代方法 (2轮)")
        schema_iterative = lab.analyze_with_iteration(db_name, iterations=2)
        enriched_ttl = lab.generate_enriched_ttl(db_name, schema_iterative)
        output_path_2 = lab.save_enriched_ttl(db_name, enriched_ttl, schema_iterative, 
                                               output_subdir="lab_iterative")
        print(f"✓ 发现 {len(schema_iterative.suggested_foreign_keys)} 个外键关系")
        print(f"✓ 输出文件: {output_path_2}")
        
        print("\n" + "=" * 80)
        print("演示完成！")
        print("=" * 80)
        print(f"\n输出目录结构:")
        print(f"  - Few-shot方法:  output/lab_few_shot/{db_name}/")
        print(f"  - 迭代方法:      output/lab_iterative/{db_name}/")
        print(f"\n提示: 使用 batch_analyze_databases() 可以批量处理多个数据库")
        
    except Exception as e:
        print(f"处理失败: {e}")
        import traceback
        traceback.print_exc()


if __name__ == "__main__":
    main()

