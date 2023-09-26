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

CREATE PROCEDURE GetUser (INOUT user_type VARCHAR(255),
    IN user_id VARCHAR(16)
)
BEGIN
    DECLARE uname VARCHAR(255);
    SELECT username
    INTO uname
    FROM user
    WHERE userid = user_id;
    IF uname = 'admin'
    THEN
        SET user_type = 'Admin';
    ELSE
        SET user_type = 'User';
    END IF;
END

-- LOOP

DROP PROCEDURE If EXISTS LoopDemo;

DELIMITER $$
CREATE PROCEDURE GetEvensFrom2To10()
BEGIN
    DECLARE x  INT;
    DECLARE str  VARCHAR(255);

    SET x = 1;
    SET str =  '';

    loop_label:  LOOP
        IF  x > 10 THEN 
            LEAVE  loop_label;
        END  IF;

        SET  x = x + 1;
        IF  (x mod 2) THEN
            ITERATE  loop_label;
        ELSE
            SET  str = CONCAT(str,x,',');
        END  IF;
    END LOOP;
    SELECT str;
END$$

DELIMITER ;
call GetEvensFrom2To10()