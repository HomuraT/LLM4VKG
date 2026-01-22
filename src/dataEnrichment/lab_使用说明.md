# Lab.py 实验模块使用说明

## 概述

`lab.py` 是基于 `main.py` 的实验性外键生成模块，专注于提供能够生成更多、更准确外键关系的新方法。

## 核心功能

### 1. Few-shot Learning 方法 🎯

利用示例引导LLM进行更准确的外键推断。

```python
from lab import LabEnrichment

lab = LabEnrichment()
schema = lab.analyze_with_few_shot("cmt_denormalized")

# 保存结果
enriched_ttl = lab.generate_enriched_ttl("cmt_denormalized", schema)
lab.save_enriched_ttl("cmt_denormalized", enriched_ttl, schema, 
                      output_subdir="lab_few_shot")
```

**优势**：
- 通过提供具体示例，帮助LLM更好地理解外键模式
- 通常能产生更准确的外键建议
- 特别适合有明确命名规范的数据库

### 2. 多轮迭代优化 🔄

通过多轮迭代逐步发现更多外键关系。

```python
lab = LabEnrichment()

# 进行2轮迭代分析
schema = lab.analyze_with_iteration("cmt_denormalized", iterations=2)

# 保存结果
enriched_ttl = lab.generate_enriched_ttl("cmt_denormalized", schema)
lab.save_enriched_ttl("cmt_denormalized", enriched_ttl, schema, 
                      output_subdir="lab_iterative")
```

**优势**：
- 第一轮：初步分析获取基础外键
- 后续轮次：审查和优化，发现遗漏的关系
- 置信度会逐步提升（默认>0.75）

**建议迭代次数**：2-3轮（更多轮次会增加API成本但收益递减）

### 3. 批量数据库分析 📦

一次性分析多个数据库。

```python
lab = LabEnrichment()

db_names = ["database1", "database2", "database3"]

# 使用Few-shot方法批量处理
results = lab.batch_analyze_databases(db_names, method="few_shot")

# 结果会自动保存到 infk/lab_few_shot/{db_name}/
```

**支持的方法**：
- `"standard"`: 标准方法（来自main.py）
- `"few_shot"`: Few-shot Learning
- `"iterative"`: 多轮迭代（默认2轮）

**输出**：
- 返回值：字典 {db_name: EnrichedSchema}
- 自动保存：每个数据库的TTL和JSON文件

## 快速开始

### 最简单的使用

```python
from lab import LabEnrichment

# 创建实验对象
lab = LabEnrichment()

# 使用Few-shot方法分析
schema = lab.analyze_with_few_shot("your_database")

# 查看结果
print(f"发现 {len(schema.suggested_foreign_keys)} 个外键")
for fk in schema.suggested_foreign_keys:
    print(f"{fk.source_table}.{fk.source_column} -> "
          f"{fk.target_table}.{fk.target_column} "
          f"(置信度: {fk.confidence})")
```

### 完整流程

```python
from lab import LabEnrichment

# 1. 创建对象
lab = LabEnrichment()

# 2. 分析数据库
schema = lab.analyze_with_few_shot("cmt_denormalized")

# 3. 生成增强的TTL
enriched_ttl = lab.generate_enriched_ttl("cmt_denormalized", schema)

# 4. 保存结果
lab.save_enriched_ttl("cmt_denormalized", enriched_ttl, schema, 
                      output_subdir="lab_few_shot")
```

### 运行演示

```bash
# 直接运行lab.py查看演示
cd /datanfs4/godehc/LLM4VKG/src/dataEnrichment
python lab.py
```

演示会运行：
1. Few-shot方法分析
2. 多轮迭代方法分析
3. 保存所有结果

## 输出目录结构

```
output/
├── cmt_denormalized/          # main.py 标准方法输出
├── table_only/                # main.py 仅table_info
├── graph_only/                # main.py 仅graph.ttl
├── lab_few_shot/              # lab.py Few-shot方法
│   └── cmt_denormalized/
│       ├── enriched_graph.ttl
│       └── enrichment_analysis.json
└── lab_iterative/             # lab.py 多轮迭代方法
    └── cmt_denormalized/
        ├── enriched_graph.ttl
        └── enrichment_analysis.json
```

## 方法对比

| 方法 | 来源 | 特点 | 适用场景 |
|------|------|------|----------|
| standard | main.py | 快速、稳定 | 一般情况 |
| table_only | main.py | 仅用表结构 | graph.ttl不可用时 |
| graph_only | main.py | 仅用图结构 | 探索性分析 |
| **few_shot** | **lab.py** | **示例引导，高准确度** | **追求质量** |
| **iterative** | **lab.py** | **多轮优化，发现更多** | **复杂数据库** |

## 使用场景

### 场景1：需要高质量外键建议

```python
lab = LabEnrichment()

# Few-shot方法通常比标准方法更准确
schema = lab.analyze_with_few_shot("your_database")
```

### 场景2：数据库结构复杂，需要深度分析

```python
lab = LabEnrichment()

# 多轮迭代可以发现单次分析遗漏的关系
schema = lab.analyze_with_iteration("complex_database", iterations=3)
```

### 场景3：处理多个数据库

```python
lab = LabEnrichment()

# 批量处理，自动保存
db_list = ["db1", "db2", "db3", "db4"]
results = lab.batch_analyze_databases(db_list, method="few_shot")

# 查看汇总
for db, schema in results.items():
    print(f"{db}: {len(schema.suggested_foreign_keys)} 个外键")
```

### 场景4：对比不同方法的效果

```python
lab = LabEnrichment()

# 分别使用不同方法
schema_standard = lab.analyze_and_enrich("db_name")
schema_few_shot = lab.analyze_with_few_shot("db_name")
schema_iterative = lab.analyze_with_iteration("db_name")

# 对比结果数量
print(f"标准方法: {len(schema_standard.suggested_foreign_keys)} 个")
print(f"Few-shot: {len(schema_few_shot.suggested_foreign_keys)} 个")
print(f"迭代方法: {len(schema_iterative.suggested_foreign_keys)} 个")
```

## 高级用法

### 自定义Few-shot示例

Few-shot示例定义在 `get_few_shot_examples()` 方法中，可以根据你的数据库特点进行修改：

```python
class CustomLabEnrichment(LabEnrichment):
    def get_few_shot_examples(self) -> str:
        """自定义示例"""
        examples = """
示例1：你的特定领域示例
表 YourTable1: ...
→ 外键: ...

示例2：另一个示例
...
"""
        return examples
```

### 调整迭代参数

```python
lab = LabEnrichment()

# 更多迭代轮次（会增加API调用次数）
schema = lab.analyze_with_iteration("db_name", iterations=4)

# 每轮的置信度阈值在prompt中定义
# 第1轮：>0.7
# 后续轮：>0.75
```

### 批量分析with自定义输出目录

```python
lab = LabEnrichment()

results = lab.batch_analyze_databases(
    ["db1", "db2"],
    method="few_shot",
    output_subdir="custom_experiment_20250116"  # 自定义输出目录
)
```

## API调用说明

| 操作 | API调用次数 |
|------|------------|
| analyze_with_few_shot | 1次 |
| analyze_with_iteration(n=2) | 2次 |
| analyze_with_iteration(n=3) | 3次 |
| batch_analyze(3个DB, few_shot) | 3次 |
| batch_analyze(3个DB, iterative) | 6次（每个DB 2轮）|

**提示**：注意API配额和成本！

## 与 main.py 的关系

`lab.py` 继承自 `main.py` 的 `DataEnrichment` 类，因此：

✅ **可以使用所有main.py的方法**：
- `analyze_and_enrich()`
- `analyze_and_enrich_table_only()`
- `analyze_and_enrich_graph_only()`
- `process_database()`
- 等等...

✅ **新增的方法**：
- `analyze_with_few_shot()` - Few-shot Learning
- `analyze_with_iteration()` - 多轮迭代
- `batch_analyze_databases()` - 批量处理（增强版）

## 完整示例代码

### 示例1：使用Few-shot方法

```python
from lab import LabEnrichment

def example_few_shot():
    # 创建对象
    lab = LabEnrichment()
    
    # 分析
    schema = lab.analyze_with_few_shot("cmt_denormalized")
    
    # 显示结果
    print(f"\n发现 {len(schema.suggested_foreign_keys)} 个外键关系：")
    for i, fk in enumerate(schema.suggested_foreign_keys, 1):
        print(f"{i}. {fk.source_table}.{fk.source_column} -> "
              f"{fk.target_table}.{fk.target_column}")
        print(f"   置信度: {fk.confidence:.2f}")
        print(f"   理由: {fk.reason}")
    
    # 保存
    enriched_ttl = lab.generate_enriched_ttl("cmt_denormalized", schema)
    output_path = lab.save_enriched_ttl("cmt_denormalized", enriched_ttl, schema, 
                                        output_subdir="lab_few_shot")
    
    print(f"\n✓ 结果已保存到: {output_path}")

if __name__ == "__main__":
    example_few_shot()
```

### 示例2：多轮迭代分析

```python
from lab import LabEnrichment

def example_iterative():
    lab = LabEnrichment()
    
    # 进行3轮迭代
    print("开始多轮迭代分析...")
    schema = lab.analyze_with_iteration("cmt_denormalized", iterations=3)
    
    print(f"\n最终发现 {len(schema.suggested_foreign_keys)} 个外键关系")
    print(f"分析总结: {schema.analysis_summary}")
    
    # 保存
    enriched_ttl = lab.generate_enriched_ttl("cmt_denormalized", schema)
    output_path = lab.save_enriched_ttl("cmt_denormalized", enriched_ttl, schema, 
                                        output_subdir="lab_iterative")
    
    print(f"✓ 结果已保存到: {output_path}")

if __name__ == "__main__":
    example_iterative()
```

### 示例3：批量处理多个数据库

```python
from lab import LabEnrichment

def example_batch():
    lab = LabEnrichment()
    
    # 数据库列表
    db_names = ["cmt_denormalized", "another_db", "third_db"]
    
    # 批量分析（使用Few-shot方法）
    print(f"批量处理 {len(db_names)} 个数据库...")
    results = lab.batch_analyze_databases(db_names, method="few_shot")
    
    # 汇总结果
    print("\n批量处理结果：")
    total_fks = 0
    for db, schema in results.items():
        count = len(schema.suggested_foreign_keys)
        total_fks += count
        print(f"  {db}: {count} 个外键")
    
    print(f"\n总计: {total_fks} 个外键建议")
    print(f"成功处理: {len(results)}/{len(db_names)} 个数据库")

if __name__ == "__main__":
    example_batch()
```

## 常见问题

### Q1: lab.py 能取代 main.py 吗？

A: 不建议。`lab.py` 是实验性的，主要用于：
- 研究新方法的效果
- 生成更多的外键候选
- 对比不同方法

生产环境建议使用 `main.py` 的稳定功能。

### Q2: Few-shot和迭代方法可以结合吗？

A: 可以，但需要自定义：

```python
# 第一轮用Few-shot
schema1 = lab.analyze_with_few_shot("db_name")

# 然后基于结果进行迭代优化（需要修改代码）
# 这是一个高级用法，可以自己实现
```

### Q3: 如何选择使用哪个方法？

建议：
- **快速测试** → 使用 `main.py` 的标准方法
- **追求质量** → 使用 `lab.py` 的 Few-shot
- **复杂数据库** → 使用 `lab.py` 的迭代方法
- **不确定** → 都试一试，对比结果

### Q4: 迭代方法会重复发现同样的外键吗？

A: 不会。提示词中要求"不要重复已经存在的外键关系"，后续轮次会基于前面的结果进行补充。

### Q5: 批量处理时某个数据库失败了怎么办？

A: 会跳过失败的数据库，继续处理其他的。最后会显示成功处理的数量。

### Q6: 如何调整Few-shot的示例？

A: 修改 `get_few_shot_examples()` 方法，添加你领域相关的示例。

## 性能优化建议

1. **批量处理时**：合理设置批次大小，避免一次处理太多
2. **迭代分析时**：从2轮开始，观察收益后再增加
3. **API成本**：优先在关键数据库上使用新方法
4. **结果验证**：新方法的结果建议人工验证后使用

## 输出文件说明

### enriched_graph.ttl

包含原始TTL + 新发现的外键关系，格式：

```turtle
# 原始TTL内容
...

# ========== 以下是 LLM 建议添加的外键关系 ==========

# 置信度: 0.85 | 理由: ...
<http://example.org/Table1/column1> <http://example.org/hasFK> <http://example.org/Table2/column2> .

...
```

### enrichment_analysis.json

包含结构化的分析结果：

```json
{
  "suggested_foreign_keys": [
    {
      "source_table": "Table1",
      "source_column": "column1",
      "target_table": "Table2",
      "target_column": "column2",
      "confidence": 0.85,
      "reason": "..."
    }
  ],
  "analysis_summary": "..."
}
```

## 扩展建议

基于 `lab.py`，你可以继续开发：

1. **向量化分析**：使用embedding比较列名相似度
2. **历史学习**：从历史分析结果中学习模式
3. **图可视化**：生成外键关系图表
4. **自动评估**：与ground truth对比计算准确率
5. **混合方法**：结合多种方法的结果

## 总结

`lab.py` 提供了两个核心的新方法来生成更多、更准确的外键关系：

1. **Few-shot Learning** - 通过示例引导，提高准确度
2. **多轮迭代优化** - 逐步发现更多外键

同时支持**批量处理**，提高工作效率。

所有方法都继承自 `main.py`，保持了接口的一致性和稳定性。

---

**开始使用**：

```bash
cd /datanfs4/godehc/LLM4VKG/src/dataEnrichment
python lab.py
```

或者：

```python
from lab import LabEnrichment
lab = LabEnrichment()
schema = lab.analyze_with_few_shot("your_database")
```

祝使用愉快！ 🚀
