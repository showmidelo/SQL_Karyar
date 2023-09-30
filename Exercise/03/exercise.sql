-- first run below query

 -- table creation
CREATE TABLE studentMarks (stud_id SMALLINT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY, total_marks INT, grade VARCHAR(5));
 
 
-- insert sample data
INSERT INTO studentMarks(total_marks, grade) VALUES(450, 'A'), (480, 'A+'), (490, 'A++'), (440, 'B+'),(400, 'C+'),(380,'C')
,(250, 'D'),(200,'E'),(100,'F'),(150,'F'),(220, 'E');


-- 1.  create a stored procedure to show all the rows and columns in studentMarks TABLE

DELIMITER $$
CREATE PROCEDURE --------
BEGIN
-----------------
END$$
DELIMITER ;


--  2. create a stored procedure to show the record about the id we have given to it parameter (hint: you must create a PROCEDURE with an "in parameter")
DELIMITER //
CREATE PROCEDURE  ---
BEGIN
    -------------------------
END //
DELIMITER ;

-- 3. Suppose we want to calculate the average marks of all the students from the studentMarks table and return the average as an OUT field.

DELIMITER //
CREATE PROCEDURE ---------------------
BEGIN
    -------------------------------------------
END //
DELIMITER


-- 4. Suppose we want to find the count of students who is having marks below the average marks of all the students.

DELIMITER //
CREATE PROCEDURE ----------------------------------------
BEGIN
    DECLARE --------------;
    -----------------------------------
END //
DELIMITER ;


--- 5. Procedures With INOUT PARAMETERS

/* INOUT parameter is a special type of parameter that is a combination of IN i.e. INPUT and OUT i.e. OUTPUT parameter.

What this essentially means is that the CALL to the procedure can pass a value to this parameter and it can alter the value and pass the same back to the user or caller. */


-- Suppose we need to have a function that takes an initial value of the counter and increment it with a given number.

DELIMITER //
CREATE PROCEDURE sakila.spUpdateCounter(INOUT counter INT, IN increment INT)
BEGIN
    --------------------
END //
DELIMITER ;

