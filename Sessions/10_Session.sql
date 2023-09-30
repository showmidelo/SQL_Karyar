-- Value window function in my sql

-- MySQL FIRST_VALUE() function

CREATE TABLE overtime (
    employee_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    hours INT NOT NULL,
    PRIMARY KEY (employee_name , department)
);
INSERT INTO overtime(employee_name, department, hours)
VALUES('Diane Murphy','Accounting',37),
('Mary Patterson','Accounting',74),
('Jeff Firrelli','Accounting',40),
('William Patterson','Finance',58),
('Gerard Bondur','Finance',47),
('Anthony Bow','Finance',66),
('Leslie Jennings','IT',90),
('Leslie Thompson','IT',88),
('Julie Firrelli','Sales',81),
('Steve Patterson','Sales',29),
('Foon Yue Tseng','Sales',65),
('George Vanauf','Marketing',89),
('Loui Bondur','Marketing',49),
('Gerard Hernandez','Marketing',66),
('Pamela Castillo','SCM',96),
('Larry Bott','SCM',100),
('Barry Jones','SCM',65);

SELECT * FROM overtime;
-- example
SELECT
    employee_name,
    hours,
    FIRST_VALUE(employee_name) OVER (
        ORDER BY hours DESC
    ) least_over_time
FROM
    overtime;

-- example

SELECT
    employee_name,
    department,
    hours,
    FIRST_VALUE(employee_name) OVER (
        PARTITION BY department
        ORDER BY hours
    ) least_over_time
FROM
    overtime;


-- LAST_VALUE

SELECT
    employee_name,
    hours,
    LAST_VALUE(employee_name) OVER (
        ORDER BY hours
        RANGE BETWEEN
            UNBOUNDED PRECEDING AND
            UNBOUNDED FOLLOWING
    ) highest_overtime_employee
FROM
    overtime;

-- example

SELECT
    employee_name,
    department,
    hours,
    LAST_VALUE(employee_name) OVER (
		PARTITION BY department
        ORDER BY hours
        RANGE BETWEEN
	    UNBOUNDED PRECEDING AND
            UNBOUNDED FOLLOWING
	) most_overtime_employee
FROM
    overtime;

-- LEAD , LAG


CREATE TABLE tax_revenue (
  id INT AUTO_INCREMENT PRIMARY KEY,
  year CHAR(4) NOT NULL,
  quarter CHAR(1) NOT NULL,
  revenue INT NOT NULL
);

INSERT INTO tax_revenue
  (year, quarter, revenue)
VALUES
  ('2020', '1', 3515),
  ('2020', '2', 3678),
  ('2020', '3', 4203),
  ('2020', '4', 3924),
  ('2021', '1', 3102),
  ('2021', '2', 3293),
  ('2021', '3', 3602),
  ('2021', '4', 2901);

SELECT * FROM tax_revenue;

-- example

SELECT
  *,
  LEAD(revenue, 1) OVER (
    PARTITION BY year
    ORDER BY quarter DESC
  ) last_quarter_revenue
FROM tax_revenue;

-- example
SELECT
  *,
  LEAD(revenue, 1, 0) OVER (
    PARTITION BY year
    ORDER BY quarter DESC
  ) last_quarter_revenue
FROM tax_revenue;

-- LAG

SELECT
  *,
  LAG(revenue, 1) OVER (
    PARTITION BY year
    ORDER BY quarter DESC
  ) next_quarter_revenue
FROM tax_revenue;

SELECT
  *,
  LAG(revenue, 1,"not known") OVER (
    PARTITION BY year
    ORDER BY quarter DESC
  ) next_quarter_revenue
FROM tax_revenue;


-- TRIGGER: check link below

-- http://alihossein.ir/tutorials/%D8%A2%D9%85%D9%88%D8%B2%D8%B4-trigger-mysql


-- SQL INJECTION

-- https://www.w3schools.com/sql/sql_injection.asp