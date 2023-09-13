-- How to load a CSV file on table of our database?


CREATE TABLE hospital (
    ProviderNumber INT(11),
    HospitalName VARCHAR(100),
    Address1 TEXT,
    City VARCHAR(100),
    State VARCHAR(100),
    ZipCode VARCHAR(20),
    HospitalOwner VARCHAR(100)
);


-- Let's load it on it 

LOAD DATA LOCAL INFILE 'CSV_FILE_PATH'
INTO TABLE hospital
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ProviderNumber, HospitalName, Address1, City, State, ZipCode, HospitalOwner);

-- But Don't forget we can get help from datagrip to this as well with so much ease

-- DDL: DDL stands for Data Definition Language and are the statements required to create the tables used in the FROM clause examples

CREATE TABLE categories
( category_id int NOT NULL,
  category_name char(50) NOT NULL,
  CONSTRAINT categories_pk PRIMARY KEY (category_id)
);

CREATE TABLE customers
( customer_id int NOT NULL,
  last_name char(50) NOT NULL,
  first_name char(50) NOT NULL,
  favorite_website char(50),
  CONSTRAINT customers_pk PRIMARY KEY (customer_id)
);

CREATE TABLE departments
( dept_id int NOT NULL,
  dept_name char(50) NOT NULL,
  CONSTRAINT departments_pk PRIMARY KEY (dept_id)
);

CREATE TABLE employees
( employee_number int NOT NULL,
  last_name char(50) NOT NULL,
  first_name char(50) NOT NULL,
  salary int,
  dept_id int,
  CONSTRAINT employees_pk PRIMARY KEY (employee_number)
);
  
CREATE TABLE orders
( order_id int NOT NULL,
  customer_id int,
  order_date date,
  CONSTRAINT orders_pk PRIMARY KEY (order_id)
);

CREATE TABLE products
( product_id int NOT NULL,
  product_name char(50) NOT NULL,
  category_id int,
  CONSTRAINT products_pk PRIMARY KEY (product_id)
);

CREATE TABLE suppliers
( supplier_id int NOT NULL,
  supplier_name char(50) NOT NULL,
  city char(50),
  state char(50),
  CONSTRAINT suppliers_pk PRIMARY KEY (supplier_id)
);

-- DML stands for Data Manipulation Language. These are the INSERT statements that you will need to run in your database to populate the data:

INSERT INTO categories
(category_id, category_name)
VALUES
(25, 'Deli');

INSERT INTO categories
(category_id, category_name)
VALUES
(50, 'Produce');

INSERT INTO categories
(category_id, category_name)
VALUES
(75, 'Bakery');

INSERT INTO categories
(category_id, category_name)
VALUES
(100, 'General Merchandise');

INSERT INTO categories
(category_id, category_name)
VALUES
(125, 'Technology');

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(4000, 'Jackson', 'Joe', 'techonthenet.com');

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(5000, 'Smith', 'Jane', 'digminecraft.com');

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(6000, 'Ferguson', 'Samantha', 'bigactivities.com');

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(7000, 'Reynolds', 'Allen', 'checkyourmath.com');

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(8000, 'Anderson', 'Paige', NULL);

INSERT INTO customers
(customer_id, last_name, first_name, favorite_website)
VALUES
(9000, 'Johnson', 'Derek', 'techonthenet.com');

INSERT INTO departments
(dept_id, dept_name)
VALUES
(500, 'Accounting');

INSERT INTO departments
(dept_id, dept_name)
VALUES
(501, 'Sales');

INSERT INTO employees
(employee_number, last_name, first_name, salary, dept_id)
VALUES
(1001, 'Smith', 'John', 62000, 500);

INSERT INTO employees
(employee_number, last_name, first_name, salary, dept_id)
VALUES
(1002, 'Anderson', 'Jane', 57500, 500);

INSERT INTO employees
(employee_number, last_name, first_name, salary, dept_id)
VALUES
(1003, 'Everest', 'Brad', 71000, 501);

INSERT INTO employees
(employee_number, last_name, first_name, salary, dept_id)
VALUES
(1004, 'Horvath', 'Jack', 42000, 501);

INSERT INTO orders
(order_id, customer_id, order_date)
VALUES
(1,7000,'2016/04/18');

INSERT INTO orders
(order_id, customer_id, order_date)
VALUES
(2,5000,'2016/04/18');

INSERT INTO orders
(order_id, customer_id, order_date)
VALUES
(3,8000,'2016/04/19');

INSERT INTO orders
(order_id, customer_id, order_date)
VALUES
(4,4000,'2016/04/20');

INSERT INTO orders
(order_id, customer_id, order_date)
VALUES
(5,null,'2016/05/01');

INSERT INTO products
(product_id, product_name, category_id)
VALUES
(1,'Pear',50);

INSERT INTO products
(product_id, product_name, category_id)
VALUES
(2,'Banana',50);

INSERT INTO products
(product_id, product_name, category_id)
VALUES
(3,'Orange',50);

INSERT INTO products
(product_id, product_name, category_id)
VALUES
(4,'Apple',50);

INSERT INTO products
(product_id, product_name, category_id)
VALUES
(5,'Bread',75);

INSERT INTO products
(product_id, product_name, category_id)
VALUES
(6,'Sliced Ham',25);

INSERT INTO products
(product_id, product_name, category_id)
VALUES
(7,'Kleenex',null);

INSERT INTO suppliers
(supplier_id, supplier_name, city, state)
VALUES
(100, 'Microsoft', 'Redmond', 'Washington');

INSERT INTO suppliers
(supplier_id, supplier_name, city, state)
VALUES
(200, 'Google', 'Mountain View', 'California');

INSERT INTO suppliers
(supplier_id, supplier_name, city, state)
VALUES
(300, 'Oracle', 'Redwood City', 'California');

INSERT INTO suppliers
(supplier_id, supplier_name, city, state)
VALUES
(400, 'Kimberly-Clark', 'Irving', 'Texas');

INSERT INTO suppliers
(supplier_id, supplier_name, city, state)
VALUES
(500, 'Tyson Foods', 'Springdale', 'Arkansas');

INSERT INTO suppliers
(supplier_id, supplier_name, city, state)
VALUES
(600, 'SC Johnson', 'Racine', 'Wisconsin');

INSERT INTO suppliers
(supplier_id, supplier_name, city, state)
VALUES
(700, 'Dole Food Company', 'Westlake Village', 'California');

INSERT INTO suppliers
(supplier_id, supplier_name, city, state)
VALUES
(800, 'Flowers Foods', 'Thomasville', 'Georgia');

INSERT INTO suppliers
(supplier_id, supplier_name, city, state)
VALUES
(900, 'Electronic Arts', 'Redwood City', 'California');


-- Make changes in tables? Let's start with renaming it 

ALTER TABLE table_name
RENAME TO new_table_name;  

-- How about renaming a column?

ALTER TABLE table_name
CHANGE COLUMN column_name new_column_name definition;

ALTER TABLE users
CHANGE COLUMN family last_name
VARCHAR(255) NOT NULL;

-- How about using modify?

ALTER TABLE table_name
MODIFY COLUMN column_name definition;

ALTER TABLE users
MODIFY family VARCHAR(255) NOT NULL;

-- Let's add a column to our table 

ALTER TABLE table_name
ADD new_column_name definition [FIRST|AFTER column_name];

ALTER TABLE table_name
ADD new_column_name1 definition [FIRST|AFTER column_name],
ADD new_column_name2 definition [FIRST|AFTER column_name],
...
ADD new_column_nameN definition [FIRST|AFTER column_name];


ALTER TABLE users
ADD role VARCHAR(5) NOT NULL DEFAULT 'user' FIRST,  
ADD family VARCHAR(30) NOT NULL AFTER name;

-- Deleting a column?

ALTER TABLE table_name 
DROP COLUMN column_name;   


-- Keys? Let's talk about Primary ones.

CREATE TABLE table_name (
    column1 definition1 PRIMARY KEY,
    column2 definition2,
    column3 definition3,
    ...
    constraints
);

-- or 

CREATE TABLE table_name (
    column1 definition1,
    column2 definition2,
    column3 definition3,
    ...
    PRIMARY KEY (column or column_list), other_constraints
);


-- How about FOREIGN KEYS?

CREATE TABLE table_name (
    column1 definition1,
    column2 definition2,
    column3 definition3,
    ...
    FOREIGN KEY (column) REFERENCES parent_table(column or column_list) option,
    FOREIGN KEY (column) REFERENCES parent_table(column or column_list) option
);

-- Options?

CASCADE

SET NULL

RESTRICT

NO ACTION

-- End of Session
