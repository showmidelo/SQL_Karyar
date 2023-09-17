-- Active: 1691383587634@@127.0.0.1@3306@world
-- Aggregate Functions

-- Min: Extract min of a column
SELECT MIN(SurfaceArea) FROM world.country

-- Max: Extract max of a column
SELECT Max(SurfaceArea) FROM world.country

-- COUNT: EXTRACT quantity of a COLUMN
SELECT COUNT(NAME) FROM world.country

-- AVG: Extract Average of COLUMNS
SELECT AVG(SurfaceArea) FROM world.country

-- Sum : EXTRACT Sum of a COLUMN
SELECT SUM(Population) FROM world.country

-- GROUP_CONCAT: Return a concatenation  of all string in a row
SELECT GROUP_CONCAT(Name, Population) FROM world.country





-- GROUP BY: It does what groupby in pandas does

-- example1:

SELECT column1, column2,..., columnN, aggregate_function(name)
FROM table_name
WHERE conditions
GROUP BY column1, column2,..., columnN;
--
SELECT Name, AVG(Population) FROM world.country
GROUP BY Name


-- example 2: Using HAVING

SELECT column1, column2,..., columnN, aggregate_function(name)
FROM table_name
WHERE conditions
GROUP BY column1, column2,..., columnN
HAVING conditions;

SELECT * FROM world.country

SELECT Name, AVG(Population) FROM world.country
GROUP BY Name
HAVING AVG(Population)>60000000
ORDER BY AVG(`Population`) DESC ;