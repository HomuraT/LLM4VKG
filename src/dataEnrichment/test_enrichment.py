"""
数据增强测试模块 (Data Enrichment Test Module)
该模块用于验证生成的增强 TTL 文件是否包含外键关系，并使用 LLM 进行质量检查。

主要功能：
1. 解析增强后的 TTL 文件，检查外键关系是否存在
2. 使用 LLM 评估外键关系的合理性
3. 生成详细的测试报告

作者：LLM4VKG项目组
"""

import os
import sys
import json
import re
from pathlib import Path
from typing import Dict, List, Tuple, Any

# 添加项目根目录到 Python 路径
project_root = Path(__file__).parent.parent.parent
sys.path.insert(0, str(project_root))

from langchain.prompts import PromptTemplate
from langchain_core.output_parsers import JsonOutputParser
from pydantic import BaseModel, Field
import rdflib
from rdflib import Graph, Namespace

from src.llm.utils.langchain_utils import CustomLLM
from config import DATA_ENRICHMENT_CONFIG, API_CONFIG_PATH, DEFAULT_API_ID


class ForeignKeyValidation(BaseModel):
    """外键关系验证结果"""
    source_table: str = Field(description="源表名称")
    source_column: str = Field(description="源列名称")
    target_table: str = Field(description="目标表名称")
    target_column: str = Field(description="目标列名称")
    is_valid: bool = Field(description="该外键关系是否合理")
    confidence: float = Field(description="合理性置信度 (0-1之间)", ge=0.0, le=1.0)
    issues: List[str] = Field(description="发现的问题列表", default=[])
    suggestions: str = Field(description="改进建议")


class ValidationReport(BaseModel):
    """验证报告"""
    total_foreign_keys: int = Field(description="总外键数量")
    valid_foreign_keys: int = Field(description="合理的外键数量")
    invalid_foreign_keys: int = Field(description="不合理的外键数量")
    validations: List[ForeignKeyValidation] = Field(description="详细验证结果")
    overall_assessment: str = Field(description="总体评估")
    recommendations: List[str] = Field(description="改进建议列表")


class EnrichmentTester:
    """增强结果测试类"""
    
    def __init__(self, api_id: str = None):
        """
        初始化测试类
        
        Args:
            api_id: LLM API 的 ID，默认从配置文件读取
        """
        # 从配置文件读取默认值
        self.api_id = api_id or DATA_ENRICHMENT_CONFIG["default_api_id"]
        self.validation_pass_threshold = DATA_ENRICHMENT_CONFIG["validation_pass_threshold"]
        
        print(f"测试验证配置:")
        print(f"  - API ID: {self.api_id}")
        print(f"  - API 配置文件: {API_CONFIG_PATH}")
        print(f"  - 通过阈值: {self.validation_pass_threshold*100:.0f}%")
        
        self.llm = CustomLLM(api_id=self.api_id)
        self.parser = JsonOutputParser(pydantic_object=ValidationReport)
        
        # 创建验证 prompt
        self.validation_prompt = PromptTemplate(
            input_variables=["table_info", "foreign_keys", "format_instructions"],
            template="""你是一个数据库专家，擅长评估数据库外键关系的合理性。

请评估以下外键关系是否合理。

**数据库表结构信息：**
```json
{table_info}
```

**待验证的外键关系：**
```json
{foreign_keys}
```

**评估标准：**
1. 外键的源表和目标表是否都存在于数据库中
2. 源列和目标列是否存在于对应的表中
3. 数据类型是否兼容
4. 列名的语义是否支持这种关系（如 user_id -> User.id）
5. 是否存在循环依赖或其他逻辑问题
6. 该外键关系在业务逻辑上是否合理

**输出格式：**
{format_instructions}

请仔细分析每个外键关系，给出详细的验证结果：
"""
        )
        
        self.validation_chain = self.validation_prompt | self.llm | self.parser
    
    def parse_ttl_file(self, ttl_path: str) -> Tuple[List[Dict[str, str]], int]:
        """
        解析 TTL 文件，提取外键关系
        
        Args:
            ttl_path: TTL 文件路径
            
        Returns:
            tuple: (外键关系列表, 总外键数量)
        """
        print(f"正在解析 TTL 文件: {ttl_path}")
        
        # 使用 rdflib 解析 TTL 文件
        g = Graph()
        g.parse(ttl_path, format='turtle')
        
        # 定义命名空间
        EX = Namespace("http://example.org/")
        
        # 查询所有的 hasFK 关系
        foreign_keys = []
        query = """
        PREFIX ex: <http://example.org/>
        SELECT ?source ?target
        WHERE {
            ?source ex:hasFK ?target .
        }
        """
        
        results = g.query(query)
        
        for row in results:
            source_uri = str(row.source)
            target_uri = str(row.target)
            
            # 解析 URI，提取表名和列名
            # 格式: http://example.org/TableName/ColumnName
            source_parts = source_uri.replace("http://example.org/", "").split("/")
            target_parts = target_uri.replace("http://example.org/", "").split("/")
            
            if len(source_parts) >= 2 and len(target_parts) >= 2:
                fk = {
                    "source_table": source_parts[0],
                    "source_column": source_parts[1],
                    "target_table": target_parts[0],
                    "target_column": target_parts[1]
                }
                foreign_keys.append(fk)
        
        print(f"✓ 找到 {len(foreign_keys)} 个外键关系")
        
        return foreign_keys, len(foreign_keys)
    
    def check_foreign_keys_exist(self, ttl_path: str) -> bool:
        """
        简单检查 TTL 文件中是否包含外键关系
        
        Args:
            ttl_path: TTL 文件路径
            
        Returns:
            bool: 是否包含外键关系
        """
        foreign_keys, count = self.parse_ttl_file(ttl_path)
        
        if count > 0:
            print(f"✓ 检查通过：文件包含 {count} 个外键关系")
            return True
        else:
            print("✗ 检查失败：文件不包含任何外键关系")
            return False
    
    def validate_with_llm(self, db_name: str, ttl_path: str) -> ValidationReport:
        """
        使用 LLM 验证外键关系的合理性
        
        Args:
            db_name: 数据库名称
            ttl_path: TTL 文件路径
            
        Returns:
            ValidationReport: 验证报告
        """
        print(f"\n{'='*60}")
        print(f"开始验证数据库 '{db_name}' 的外键关系")
        print(f"{'='*60}")
        
        # 1. 解析 TTL 文件
        foreign_keys, count = self.parse_ttl_file(ttl_path)
        
        if count == 0:
            print("警告：没有找到外键关系，跳过 LLM 验证")
            return ValidationReport(
                total_foreign_keys=0,
                valid_foreign_keys=0,
                invalid_foreign_keys=0,
                validations=[],
                overall_assessment="未找到任何外键关系",
                recommendations=["建议重新运行数据增强流程"]
            )
        
        # 2. 加载 table_info.json
        input_dir = DATA_ENRICHMENT_CONFIG["input_dir"]
        table_info_path = Path(input_dir) / db_name / "table_info.json"
        
        if not table_info_path.exists():
            raise FileNotFoundError(f"找不到 table_info.json: {table_info_path}")
        
        with open(table_info_path, 'r', encoding='utf-8') as f:
            table_info = json.load(f)
        
        # 3. 调用 LLM 进行验证
        print("正在调用 LLM 进行验证...")
        
        try:
            result = self.validation_chain.invoke({
                "table_info": json.dumps(table_info, indent=2, ensure_ascii=False),
                "foreign_keys": json.dumps(foreign_keys, indent=2, ensure_ascii=False),
                "format_instructions": self.parser.get_format_instructions()
            })
            
            print("✓ LLM 验证完成")
            
            validation_report = ValidationReport(**result)
            return validation_report
            
        except Exception as e:
            print(f"✗ 验证过程出错: {e}")
            raise
    
    def generate_test_report(self, db_name: str, validation_report: ValidationReport) -> str:
        """
        生成测试报告
        
        Args:
            db_name: 数据库名称
            validation_report: 验证报告
            
        Returns:
            str: 报告文件路径
        """
        # 创建报告目录
        output_dir = DATA_ENRICHMENT_CONFIG["output_dir"]
        report_dir = Path(output_dir) / db_name
        report_dir.mkdir(parents=True, exist_ok=True)
        
        # 生成 Markdown 格式的报告
        report_content = f"""# 数据增强验证报告

## 数据库: {db_name}

---

## 概览

- **总外键数量**: {validation_report.total_foreign_keys}
- **合理的外键数量**: {validation_report.valid_foreign_keys}
- **不合理的外键数量**: {validation_report.invalid_foreign_keys}
- **通过率**: {validation_report.valid_foreign_keys / validation_report.total_foreign_keys * 100:.1f}%

---

## 总体评估

{validation_report.overall_assessment}

---

## 详细验证结果

"""
        
        for i, validation in enumerate(validation_report.validations, 1):
            status = "✓ 合理" if validation.is_valid else "✗ 不合理"
            report_content += f"""
### {i}. {validation.source_table}.{validation.source_column} -> {validation.target_table}.{validation.target_column}

- **状态**: {status}
- **置信度**: {validation.confidence:.2f}
- **问题**: {', '.join(validation.issues) if validation.issues else '无'}
- **建议**: {validation.suggestions}

---
"""
        
        report_content += f"""
## 改进建议

"""
        for i, rec in enumerate(validation_report.recommendations, 1):
            report_content += f"{i}. {rec}\n"
        
        # 保存 Markdown 报告
        md_report_path = report_dir / "validation_report.md"
        with open(md_report_path, 'w', encoding='utf-8') as f:
            f.write(report_content)
        
        print(f"✓ 保存验证报告: {md_report_path}")
        
        # 保存 JSON 格式的报告
        json_report_path = report_dir / "validation_report.json"
        with open(json_report_path, 'w', encoding='utf-8') as f:
            json.dump(validation_report.model_dump(), f, indent=2, ensure_ascii=False)
        
        print(f"✓ 保存 JSON 报告: {json_report_path}")
        
        return str(md_report_path)
    
    def test_database(self, db_name: str, ttl_filename: str = "enriched_graph.ttl") -> Tuple[bool, str]:
        """
        完整的测试流程
        
        Args:
            db_name: 数据库名称
            ttl_filename: TTL 文件名
            
        Returns:
            tuple: (是否通过测试, 报告文件路径)
        """
        print(f"\n{'='*60}")
        print(f"开始测试数据库: {db_name}")
        print(f"{'='*60}")
        
        # 构建 TTL 文件路径
        output_dir = DATA_ENRICHMENT_CONFIG["output_dir"]
        ttl_path = Path(output_dir) / db_name / ttl_filename
        
        if not ttl_path.exists():
            print(f"✗ 错误：找不到 TTL 文件: {ttl_path}")
            return False, ""
        
        # 1. 基本检查：是否包含外键
        has_fks = self.check_foreign_keys_exist(str(ttl_path))
        
        if not has_fks:
            print("✗ 测试失败：文件不包含外键关系")
            return False, ""
        
        # 2. LLM 验证
        validation_report = self.validate_with_llm(db_name, str(ttl_path))
        
        # 3. 生成报告
        report_path = self.generate_test_report(db_name, validation_report)
        
        # 4. 判断是否通过（使用配置文件中的阈值）
        pass_rate = validation_report.valid_foreign_keys / validation_report.total_foreign_keys
        
        if pass_rate >= self.validation_pass_threshold:
            print(f"\n✓ 测试通过！通过率: {pass_rate*100:.1f}%")
            return True, report_path
        else:
            print(f"\n✗ 测试未通过。通过率: {pass_rate*100:.1f}% (需要 >= {self.validation_pass_threshold*100:.1f}%)")
            return False, report_path


def main():
    """主函数：示例用法"""
    # 创建测试对象（使用配置文件中的默认设置）
    tester = EnrichmentTester()
    
    # 测试示例数据库
    db_name = "cmt_denormalized"
    
    try:
        passed, report_path = tester.test_database(db_name)
        
        if passed:
            print(f"\n{'='*60}")
            print("🎉 所有测试通过！")
            print(f"{'='*60}")
        else:
            print(f"\n{'='*60}")
            print("⚠️ 测试未完全通过，请查看报告了解详情")
            print(f"{'='*60}")
        
        print(f"\n报告位置: {report_path}")
        
    except Exception as e:
        print(f"测试失败: {e}")
        import traceback
        traceback.print_exc()


if __name__ == "__main__":
    main()

