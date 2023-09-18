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
