-- Stored functions

-- Syntax :

DELIMITER $$

CREATE FUNCTION function_name(
    param1,
    param2,
    ...
)
RETURNS datatype
[NOT] DETERMINISTIC -- remember to say one to one and DETERMINISTIC makes cashe and would be greatful for our queries
BEGIN
 -- statements
END $$

DELIMITER ;

-- example:

DELIMITER $$

CREATE FUNCTION CustomerLevel(
    credit DECIMAL(10,2)
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE customerLevel VARCHAR(20);

    IF credit > 50000 THEN
        SET customerLevel = 'PLATINUM';
    ELSEIF (credit <= 50000 AND 
        credit >= 10000) THEN
        SET customerLevel = 'GOLD';
    ELSEIF credit < 10000 THEN
        SET customerLevel = 'SILVER';
    END IF;
        -- return the customer level
        RETURN customerLevel;
END $$
DELIMITER ;


-- Running from Stored Functions

SELECT
  id,
  CustomerLevel(credit) AS level
FROM customers;





-- CTE: Common Table Expression

-- Syntax:
WITH cte_name (column_list) AS (
    query
) 
SELECT * FROM cte_name;

-- example

WITH salesrep AS (
    SELECT 
        employeeNumber,
        CONCAT(firstName, ' ', lastName) AS salesrepName
    FROM
        employees
    WHERE
        jobTitle = 'Sales Rep'
),
customer_salesrep AS (
    SELECT 
        customerName, salesrepName
    FROM
        customers
            INNER JOIN
        salesrep ON employeeNumber = salesrepEmployeeNumber
)
SELECT 
    *
FROM
    customer_salesrep
ORDER BY customerName;


-- example

SELECT * FROM world.city;

WITH nonpopulate AS (
    SELECT 
        `Region`,
        Code,
        CONCAT(Name, '   ', `Continent`) AS DESCRIPTION
    FROM
        world.country
    WHERE
        `Population`< 2000
),
final AS (
    SELECT 
        `Name`, `District`, `CountryCode`, `Population`
    FROM
        world.city
            INNER JOIN
        nonpopulate ON CountryCode = Code
)
SELECT 
    *
FROM
    final;

