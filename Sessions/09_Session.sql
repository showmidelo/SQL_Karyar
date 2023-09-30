-- Active: 1691383587634@@127.0.0.1@3306@sakila
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


-- Ranking

/* We have the following rank functions.

    ROW_NUMBER()
    RANK()
    DENSE_RANK()
    NTILE()
*/

CREATE TABLE college_user (
    id serial PRIMARY KEY,
    user_id BIGINT NOT NULL,
    college_name VARCHAR(32) NOT NULL,
    total_score BIGINT DEFAULT 0
);
INSERT INTO college_user (user_id, college_name, total_score)
VALUES
    (1, 'algorithm', 1200),
    (2, 'algorithm', 1500),
    (3, 'algorithm', 1000),
    (4, 'algorithm', 700),
    (5, 'algorithm', 1000),
    (6, 'algorithm', 750),
    (1, 'python', 1300),
    (2, 'python', 1000),
    (3, 'python', 900),
    (4, 'python', 1200),
    (5, 'python', 1500),
    (6, 'python', 1000),
    (1, 'sql', 1000),
    (2, 'sql', 1300),
    (3, 'sql', 1500),
    (4, 'sql', 1400),
    (5, 'sql', 700),
    (6, 'sql', 1200)
;

-- ROW_NUMBER()

ROW_NUMBER() OVER (
    [PARTITION BY partition_column, ... ]
    ORDER BY sort_column [ASC | DESC], ...
);

-- example

SELECT *, 
       ROW_NUMBER() OVER(ORDER BY total_score DESC) AS score_row_num
FROM college_user
ORDER BY score_row_num;


-- example

SELECT *, 
       ROW_NUMBER() OVER(PARTITION BY college_name ORDER BY total_score DESC) AS score_row_num
FROM college_user
ORDER BY college_name, score_row_num;

-- example

SELECT *, 
       ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY total_score DESC) AS score_row_num
FROM college_user
ORDER BY user_id, score_row_num;

-- RANK

SELECT *, 
       RANK() OVER(ORDER BY total_score DESC) AS score_rank
FROM college_user
ORDER BY score_rank;

-- DENSE_RANK

SELECT *, 
       DENSE_RANK() OVER(ORDER BY total_score DESC) AS score_dense_rank
FROM college_user
ORDER BY score_dense_rank;


-- NTILE

SELECT *,
       NTILE(3) OVER(PARTITION BY college_name ORDER BY total_score DESC) AS group_num
FROM college_user
ORDER BY college_name, group_num;