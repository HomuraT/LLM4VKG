#!/bin/bash
# 数据增强脚本
# 用于运行数据增强和测试流程

# 设置工作目录
cd "$(dirname "$0")/.."

echo "=========================================="
echo "数据增强与测试流程"
echo "=========================================="

# 检查参数
if [ $# -eq 0 ]; then
    echo "用法: $0 <数据库名称> [API_ID]"
    echo "示例: $0 cmt_denormalized gpt_4o_mini"
    exit 1
fi

DB_NAME=$1
API_ID=${2:-gpt_4o_mini}

echo "数据库名称: $DB_NAME"
echo "API ID: $API_ID"
echo ""

# 步骤 1: 运行数据增强
echo "步骤 1: 运行数据增强..."
python -c "
from src.dataEnrichment.main import DataEnrichment
enricher = DataEnrichment(api_id='$API_ID')
enricher.process_database('$DB_NAME')
"

if [ $? -ne 0 ]; then
    echo "✗ 数据增强失败"
    exit 1
fi

echo ""
echo "步骤 2: 运行测试验证..."
python -c "
from src.dataEnrichment.test_enrichment import EnrichmentTester
tester = EnrichmentTester(api_id='$API_ID')
passed, report_path = tester.test_database('$DB_NAME')
print(f'\n报告路径: {report_path}')
exit(0 if passed else 1)
"

if [ $? -eq 0 ]; then
    echo ""
    echo "=========================================="
    echo "✓ 所有流程完成！"
    echo "=========================================="
else
    echo ""
    echo "=========================================="
    echo "⚠️  流程完成但测试未全部通过"
    echo "=========================================="
fi

