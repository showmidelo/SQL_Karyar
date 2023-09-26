-- Active: 1691383587634@@127.0.0.1@3306@world
/* UNION:  The UNION operator is used to combine the result-set of two or more SELECT statements.

    Every SELECT statement within UNION must have the same number of columns
    The columns must also have similar data types
    The columns in every SELECT statement must also be in the same order
There is no difference between union or union distinct */

SELECT `Name`, `Code` FROM Country
UNION
SELECT name, countryCode FROM city;


/* UNION ALL Syntax

The UNION operator selects only distinct values by default. To allow duplicate values, use UNION ALL: */

SELECT `Name`, `Code` FROM Country
UNION ALL
SELECT name, countryCode FROM city;





-- The INNER JOIN keyword selects records that have matching values in both tables, there is no difference between inner join and join word 

SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;


-- example

SELECT * FROM country
INNER join city
on country.Code = city.CountryCode;

SELECT * FROM country
join city
on country.Code = city.CountryCode;



-- The LEFT JOIN keyword returns all records from the left table (table1), and the matching records from the right table (table2). The result is 0 records from the right side, if there is no match.

SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;

SELECT * FROM country
left join city
on country.Code = city.CountryCode;


-- The RIGHT JOIN keyword returns all records from the right table (table2), and the matching records from the left table (table1). The result is 0 records from the left side, if there is no match.

SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;


SELECT * FROM country
right join city
on country.Code = city.CountryCode;

/* The FULL OUTER JOIN keyword returns all records when there is a match in left (table1) or right (table2) table records.

Tip: FULL OUTER JOIN and FULL JOIN are the same. */

SELECT * FROM t1
LEFT JOIN t2 ON t1.id = t2.id
UNION
SELECT * FROM t1
RIGHT JOIN t2 ON t1.id = t2.id;


SELECT * FROM sakila.film_category t1
LEFT JOIN sakila.film t2 ON t1.film_id= t2.film_id
UNION
SELECT * FROM sakila.film_category t1
RIGHT JOIN sakila.film t2 ON t1.film_id= t2.film_id


-- Self Join

SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;

-- به مثال ثبت احوال برای شناسایی سرپرست خانوار و بچه ها اشاره کن
SELECT A.Name AS CityName1, B.Name AS CityName2, A.`CountryCode`, B.`Population`
FROM world.city A, world.city B
WHERE A.District <> B.District
AND A.CountryCode = B.CountryCode
ORDER BY A.District;

-- SQL CREATE INDEX Statement

/*
The CREATE INDEX statement is used to create indexes in tables.

Indexes are used to retrieve data from the database more quickly than otherwise. The users cannot see the indexes, they are just used to speed up searches/queries. */

-- CREATE INDEX Syntax

 -- Creates an index on a table. Duplicate values are allowed:
CREATE INDEX index_name
ON table_name (column1, column2, ...); 

-- CREATE UNIQUE INDEX Syntax

--Creates a unique index on a table. Duplicate values are not allowed:
CREATE UNIQUE INDEX index_name
ON table_name (column1, column2, ...); 

-- DROP INDEX Statement

-- The DROP INDEX statement is used to delete an index in a table.

ALTER TABLE table_name
DROP INDEX index_name; 


-- text mining

SELECT *
FROM texts
WHERE text LIKE '%design%'
AND text LIKE '%toppings%'
AND text LIKE '%symptom%';


SELECT *
FROM sakila.film f
WHERE f.description LIKE '%Drama%'
OR f.description LIKE '%Car%'
OR f.description LIKE '%Emotional%';


-- MATCH

MATCH (col1,col2,...) AGAINST (expr [search_modifier]);

-- You must create an index on the colums you want to full text search on them before running the match query cause you will get an error
ALTER TABLE sakila.film ADD FULLTEXT name_of_index(title,description);

-- default search that ignore stoplist
SELECT *
FROM sakila.film
WHERE MATCH(title, description) AGAINST ('drama');

-- BOOLEAN Mode search
SELECT *
FROM sakila.film
WHERE MATCH(title, description) AGAINST ('+drama' IN BOOLEAN MODE);

SELECT *
FROM sakila.film
WHERE MATCH(title, description) AGAINST ('-drama' IN BOOLEAN MODE);

SELECT *
FROM sakila.film
WHERE MATCH(title, description) AGAINST ('drama' WITH QUERY EXPANSION);

-- Mysql INSERT Into Select

/* The INSERT INTO SELECT statement copies data from one table and inserts it into another table.

The INSERT INTO SELECT statement requires that the data types in source and target tables matches. */

-- Syntax:

INSERT INTO table2
SELECT * FROM table1
WHERE condition; 

INSERT INTO table2 (column1, column2, column3, ...)
SELECT column1, column2, column3, ...
FROM table1
WHERE condition; 
-- example : 


INSERT Into sakila.city(country_id,city)
SELECT country_id,country FROM sakila.country;


-- comment: if you want use one line comment you should use '' -- " and if you have multiple lines of columns you should use this structure

/* Test

test

test */



-- If null()

SELECT IFNULL(IndepYear, "not added") FROM world.country;


-- check constraint during creating TABLE

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
); 

-- what if table was created before and we want to add a constraint to it?

ALTER TABLE Persons
ADD CHECK (Age>=18); 

-- how about for multiple columns?

ALTER TABLE Persons
ADD CONSTRAINT CHK_PersonAge CHECK (Age>=18 AND City='Sandnes'); 

-- how to drop it?

ALTER TABLE Persons
DROP CHECK CHK_PersonAge; 

-- Create VIEW

/* In SQL, a view is a virtual table based on the result-set of an SQL statement.

A view contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database.

You can add SQL statements and functions to a view and present the data as if the data were coming from one single table. */

-- Syntax 
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition; 

-- example

CREATE View test AS
SELECT * FROM world.country
WHERE `IndepYear` < 1980;

SELECT * FROM test;

