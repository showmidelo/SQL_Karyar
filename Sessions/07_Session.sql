-- Stored Procedure: A procedure (often called a stored procedure) is a collection of pre-compiled SQL statements stored inside the database

DELIMITER $$ 
CREATE PROCEDURE procedure_name [[IN | OUT | INOUT] parameter_name datatype [, parameter datatype]) ]    
BEGIN    
    Declaration_section    
    Executable_section    
END $$  
DELIMITER ;  

-- How to call a stored procedure?

CALL procedure_name ( parameter(s))  


-- example

DELIMITER $$
CREATE PROCEDURE get_city()
BEGIN
    SELECT * FROM world.city;
END $$

DELIMITER ;

call get_city()


-- example 2

SELECT * FROM world.country;
DELIMITER //
CREATE PROCEDURE city_life(
    IN life DECIMAL
)
BEGIN
    SELECT * FROM world.country WHERE `LifeExpectancy` = life ;
END //
DELIMITER ;


CALL city_life(78.4)


-- example 3


DELIMITER $$
CREATE PROCEDURE CountCity(OUT total_city INT)
BEGIN
    SELECT COUNT(*)
    INTO total_city
    FROM world.city;
END $$

DELIMITER ;

CALL CountCity(@usersCount)

SELECT @usersCount


--- conditional

IF condition THEN statement(s)
[ELSEIF condition THEN statement(s)] ...
[ELSE statement(s)]
END IF

-- example3




