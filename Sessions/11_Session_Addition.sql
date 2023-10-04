-- Active: 1691383587634@@127.0.0.1@3306@sakila
-- Length : Return the length of the string, in bytes:

SELECT LENGTH("SQL") AS LengthOfString; 


-- LOWER : SELECT LOWER("SQL Tutorial is FUN!") 

SELECT LOWER("SQL Tutorial is FUN!");  

-- UPPER

SELECT UPPER("SQL Tutorial is FUN!");  

-- SUBSTRING : Extract a substring from a string (start at position 5, extract 3 characters):

 SELECT SUBSTRING("SQL Tutorial", 5, 3) AS ExtractString; 

-- MOD: Return the remainder of 18/4

SELECT MOD(18, 4); 

-- TRUNCATE : Return a number truncated to 2 decimal places

SELECT TRUNCATE(135.375, 2); 

-- INTERVAL: returns the index of the argument that is more than the first argument.

SELECT INTERVAL(85,    1, 75, 17, 30,56, 175);

-- ADDDATE : Add 10 days to a date and return the date

 SELECT ADDDATE("2017-06-15", INTERVAL 10 DAY); 


-- TIMESTAMPADD: adds time value with a date or datetime value

SELECT TIMESTAMPADD(MONTH,2,'2009-05-18');


-- DATEDIFF: Return the number of days between two date values

 SELECT DATEDIFF("2017-06-25", "2017-06-15"); 

-- TIMEDIFF: Return the difference between two time expressions

 SELECT TIMEDIFF("13:10:11", "13:10:10"); 

-- TIMESTAMPDIFF: will return a value in months by subtracting

SELECT TIMESTAMPDIFF(MONTH,'2009-05-18','2009-07-29'); 


-- Check other methods:  https://www.w3schools.com/sql