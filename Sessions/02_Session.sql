-- Inserting data on TABLES.

INSERT INTO table(column1,column2,...,columnN)
VALUES (value1,value2,...,valueN);

INSERT INTO table(column1,column2,...,columnN)
VALUES 
   (value1,value2,...,valueN),
   (another_value1,another_value2,...,another_valueN),
    ...
   (another_value1,another_value2,...,another_valueN);

-- Example

CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    level ENUM('user', 'admin') NOT NULL DEFAULT 'user',
    name VARCHAR(45) NOT NULL,
    family VARCHAR(45) NOT NULL,
    birth_date DATETIME
);

INSERT INTO users (level, name, family, birth_date)
VALUES
       (DEFAULT, 'abolfazl', 'mohajeri', '1991-08-07 00:00:00'),
       ('admin', 'nima', 'heydarinasab', '1989-03-22 00:00:00');

-- Selecting

SELECT column1, column2, ..., columnN
FROM table_name;  

-- Example

SELECT student_id, score
FROM students;

-- ORDER BY

SELECT column1, ..., columnN
FROM table_name
ORDER BY column1 [ASC|DESC], ..., columnN [ASC|DESC];

-- example

SELECT *
FROM students
ORDER BY id;

-- example

SELECT *
FROM students
ORDER BY student_id ASC, score DESC;

-- Set how many rows we want to extract

SELECT student_id, score
FROM students
LIMIT 2;

-- Set Filter On data extracting from TABLES

SELECT column1, column2, ..., columnN
FROM table_name
WHERE condition;

-- example 

SELECT *
FROM users
WHERE level = 'admin';

-- example

SELECT *
FROM users
WHERE birth_date IS NOT NULL;

-- example

SELECT *
FROM users
WHERE birth_date BETWEEN '1990-01-01' AND '1992-01-01';

-- example

SELECT column1, column2, ..., columnN
FROM table_name
WHERE columnN LIKE pattern;

SELECT *
FROM users
WHERE name LIKE 'a%';

-- WHERE IN()
SELECT *
FROM users
WHERE name IN('abolfazl', 'nima');

-- Updating VALUES

UPDATE table_name     
SET column1 = new-value1, ..., columnN = new_valueN
WHERE condition;

-- example

UPDATE users
SET family = 'mohammadi'
WHERE family = 'bouazar';

-- Replace INTO

REPLACE INTO table_name(column_list)
VALUES (value_list);

REPLACE INTO users(id, name, family)
VALUES (2, 'ali', 'rezazade');

-- another way of replacing INTO

REPLACE INTO table_name
SET column1 = value1,
    column2 = value2,
    ...,
    columnN = valueN;

REPLACE INTO users
SET id = 2,
    level = 'admin',
    name = 'ali',
    family = 'rahmani';

-- DELETE VALUES

DELETE FROM table_name
WHERE condition;

DELETE FROM table_name
WHERE family='bouazar';

-- How to DELETE all the rows?

TRUNCATE users;

-- End of session 3