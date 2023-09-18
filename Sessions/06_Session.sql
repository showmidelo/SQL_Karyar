-- Active: 1691383587634@@127.0.0.1@3306@world

-- Work with JSON DATA in SQL

-- Let's start with its functions

-- Array
SELECT JSON_ARRAY(1, 2, 3.14, 'Quera', true);

-- Object
SELECT JSON_OBJECT('title', 'Quera', 'URL', 'https://quera.ir');

-- STRING
SELECT json_quote('Super');

SELECT json_quote('{ "score" : 10.45 }');


-- check Datatypes

SELECT JSON_TYPE('null'); 
SELECT JSON_TYPE('1'); 
SELECT JSON_TYPE('"Hello!"'); 
SELECT JSON_TYPE('true');
SELECT JSON_TYPE('3.14'); 
SELECT JSON_TYPE('[1, 2, 3.14, "Quera", true]'); 
SELECT JSON_TYPE('{"title": "Quera", "URL": "https://quera.ir"}'); 



-- check VALIDATION

SELECT JSON_VALID('[1, 2, "Quera"]'); 
SELECT JSON_VALID('{"a": 1, "b": 2}');
SELECT JSON_VALID('{"a": 1, "b": 2'); 


-- text mining in json TYPE

SELECT * FROM  WHERE JSON_CONTAINS(tags, '["SQL"]');


SELECT * FROM `book` WHERE JSON_SEARCH(tags, 'one', '%SQL%') IS NOT NULL;


-- Extract from json


SELECT JSON_EXTRACT('{"id": 1, "website": "Quera"}', '$.website');



SELECT JSON_EXTRACT('[10, 20, [30, 40]]', '$[0]'); 
SELECT JSON_EXTRACT('[10, 20, [30, 40]]', '$[1]'); 
SELECT JSON_EXTRACT('[10, 20, [30, 40]]', '$[2]'); 


SELECT JSON_EXTRACT('[10, 20, [30, 40]]', '$[2][0]'); 
SELECT JSON_EXTRACT('[10, 20, [30, 40]]', '$[2][1]'); 


-- make changes on JSON

SELECT JSON_SET('[10, 20, [30, 40]]', '$[0]', 60); 


SELECT JSON_INSERT('{"id": 1, "website": "Quera"}', '$.email', 'info@quera.ir');


SELECT JSON_SET('[10, 20, [30, 40]]', '$[0]', 60);
SELECT JSON_REPLACE('[10, 20, [30, 40]]', '$[0]', 60); 

-- Difference BETWEEN JSON_SET and JSON_REPLACE
SELECT JSON_SET('[10, 20, [30, 40]]', '$[3]', 60); 
SELECT JSON_REPLACE('[10, 20, [30, 40]]', '$[3]', 60); 


SELECT JSON_ARRAY_INSERT('["a", {"b": [1, 2]}, [3, 4]]', '$[1]', 'x');

SELECT JSON_ARRAY_APPEND('["a", ["b", "c"], "d"]', '$[1]', 1); 
SELECT JSON_ARRAY_APPEND('["a", ["b", "c"], "d"]', '$[0]', 1); 

SELECT JSON_REMOVE('["a", ["b", "c"], "d"]', '$[1]');