-- Normal FUNCTION for different Data Type Values 

-- String Functions

-- CONCAT, CONCAT_WS: difference BETWEEN these two is that ws get a parameter for seperation form COLUMNS

SELECT CONCAT(Name, " ",`Continent`) from world.country

-- CONCAT_WS

SELECT CONCAT_WS("-------------Region: ",CONCAT(Name, " ",`Continent`), `Region`) from world.country

-- LTRIM, RTRIM, TRIM

SELECT TRIM('    QUERA    ');  -- it trims all the white spaces in the string
SELECT LTRIM('    QUERA'); -- it trims only the white spaces in the left position of string
SELECT RTRIM('QUERA    ');  -- it trims only the white spaces in the right position of string

-- INTEGER FUNCTIONS

SELECT CEIL(0.5);
SELECT FLOOR(0.5);
SELECT ROUND(0.6); 
SELECT ROUND(0.5); 
SELECT ROUND(0.4); 

-- DATETIME FUNCTIONs

SELECT DATE('2022-01-12 08:10:59'); 
SELECT TIME('2022-01-12 08:10:59'); 
SELECT YEAR('2022-01-12 08:10:59'); 
SELECT MONTH('2022-01-12 08:10:59'); 
SELECT DAY('2022-01-12 08:10:59'); 
SELECT HOUR('2022-01-12 08:10:59'); 
SELECT MINUTE('2022-01-12 08:10:59'); 
SELECT SECOND('2022-01-12 08:10:59'); 

EXTRACT(unit FROM datetime)

SELECT EXTRACT(YEAR FROM '2022-01-12 08:10:59'); 

-- ADDTIME, ADDDATE

ADDDATE(datetime, INTERVAL value unit)

ADDDATE(datetime, days)

ADDTIME(datetime, value)

-- example

SELECT ADDDATE('2022-01-12 08:10:59', INTERVAL -2 DAY); 

SELECT ADDDATE('2022-01-12 08:10:59', -2); 

SELECT ADDTIME('2022-01-12 08:10:59', '-2 7:10:5'); 


-- Special Functions

-- COALESCE: it returns first not null value from a list

SELECT COALESCE(NULL, NULL, 'QUERA', 1); 

-- also you can replace null values in a column with a string with its  help
SELECT name, `Continent`, COALESCE(`IndepYear`, 'not added') AS test
FROM world.country;

