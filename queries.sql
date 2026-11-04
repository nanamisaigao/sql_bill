-- 1. 按月统计总花费
SELECT strftime('%Y-%m', 日期) AS 月份, SUM(金额) AS 总花费
FROM expenses
GROUP BY 月份
ORDER BY 月份;

-- 2. 环比增长与累计花费 (窗口函数)
WITH monthly AS (
    SELECT strftime('%Y-%m', 日期) AS 月份, SUM(金额) AS 总花费
    FROM expenses
    GROUP BY 月份
)
SELECT 月份, 总花费,
       LAG(总花费,1,0) OVER (ORDER BY 月份) AS 上月花费,
       SUM(总花费) OVER (ORDER BY 月份) AS 累计花费,
       ROUND(总花费 - LAG(总花费,1,0) OVER (ORDER BY 月份), 1) AS 环比差额
FROM monthly
ORDER BY 月份;

-- 3. 每月花费最高的类别排名 (排名窗口)
WITH monthly_cat AS (
    SELECT strftime('%Y-%m', 日期) AS 月份, 类别, SUM(金额) AS 小计
    FROM expenses
    GROUP BY 月份, 类别
),
ranked AS (
    SELECT 月份, 类别, 小计,
           RANK() OVER (PARTITION BY 月份 ORDER BY 小计 DESC) AS 排名
    FROM monthly_cat
)
SELECT 月份, 类别, 小计
FROM ranked
WHERE 排名 = 1
ORDER BY 月份;