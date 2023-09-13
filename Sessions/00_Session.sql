-- Creating Databases

CREATE DATABASE database_name;

-- Check all Databases that EXIST

SHOW DATABASES;

-- DELETE a DATABASE

DROP DATABASE database_name;

-- Delete a DATABASE if it EXISTS

DROP DATABASE IF EXISTS database_name 


-- Check enginges (InnoDB)

SHOW ENGINES;

-- Using a DATABASE to add a table to it

USE database_name;

-- How to create a TABLE?

CREATE TABLE table_name (
    column1 definition1,
    column2 definition2,
    column3 definition3,
    ...
    constraints
);

-- data_type constraints

PRIMARY KEY

AUTO_INCREMENT

UNIQUE

NOT NULL

DEFAULT value

UNSIGNED

--  Let's create a real table in our DATABASE

CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    level ENUM('user', 'admin') NOT NULL DEFAULT 'user',
    name VARCHAR(45) NOT NULL,
    family VARCHAR(45) NOT NULL,
    birth_date DATETIME
);

-- How to check all the tables Exist in our DATABASE?

SHOW TABLES;

-- Summary of A TABLE

DESCRIBE table_name;

-- How to DELETE a table?

DROP TABLE table_name;

-- delete a table if it exists in our database?

DROP TABLE IF EXISTS table_name;

-- All Datatypes

-- Varchar(size)
CREATE TABLE users (
    name VARCHAR(20) NOT NULL,
    family VARCHAR(30) NOT NULL
);

-- Text

CREATE TABLE posts (
    title VARCHAR(255) NOT NULL,
    body TEXT NOT NULL
);

-- Enum

CREATE TABLE users (
    title VARCHAR(255) NOT NULL,
    priority ENUM('Low', 'Medium', 'High') NOT NULL
);

-- INT (size)

CREATE TABLE users (
    name VARCHAR(255) NOT NULL,
    amount INT UNSIGNED
);

-- DECIMAL(SIZE,ROUND)

CREATE TABLE users (
    name VARCHAR(255) NOT NULL,
    average DECIMAL(10,2) NOT NULL
);

-- TIMESTAMP

CREATE TABLE users (
    name VARCHAR(255) NOT NULL,
    birth_date TIMESTAMP
);

-- DATETIME

CREATE TABLE users (
    name VARCHAR(255) NOT NULL,
    birth_date DATETIME
);

-- We also have BOOL and JSON type



