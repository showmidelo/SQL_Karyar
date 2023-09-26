--  CTE بازگشتی

-- Syntax:
WITH RECURSIVE cte_name AS (
    initial_query
    UNION ALL
    recursive_query
)
SELECT * FROM cte_name

-- example

WITH RECURSIVE cte_count (n)
AS (
      SELECT 1
      UNION ALL
      SELECT n + 1
      FROM cte_count
      WHERE n < 5
    )
SELECT n
FROM cte_count