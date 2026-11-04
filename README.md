# SQL 账单分析

使用 SQLite 和 SQL 语句对清洗后的账单数据进行查询与分析。

## 运行方式

1. 运行 `python import_data.py` 将 CSV 导入 `bill.db`。
2. 使用 PyCharm 数据库工具打开 `bill.db`。
3. 运行 `queries.sql` 中的语句进行统计。

## 数据表结构

- `expenses`：账单明细（日期、类别、金额）
- `budget`：月度预算（月份、预算）

## 数据说明

- `data/cleaned.csv`：由 `pandas_bill` 项目清洗生成的账单明细（约 2 万行）。
- `data/budget.csv`：人工设定的月度预算
- 
## 相关项目

- **[pandas_bill](https://github.com/nanamisaigao/pandas_bill)**：数据清洗与预处理项目。
  负责从原始脏数据生成、清洗，最终输出 `cleaned.csv`，供本项目进行 SQL 分析。 