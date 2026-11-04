# SQL 账单分析

使用 SQLite 和 SQL 语句对清洗后的账单数据进行查询与分析。

## 运行方式

1. 运行 `python import_data.py` 将 CSV 导入 `bill.db`。
2. 使用 PyCharm 数据库工具打开 `bill.db`。
3. 运行 `queries.sql` 中的语句进行统计。

## 数据表结构

- `expenses`：账单明细（日期、类别、金额）
- `budget`：月度预算（月份、预算）