-- ============================================================
-- ASSIGNMENT 2 - EMPLOYEE MANAGEMENT SYSTEM
-- ============================================================

-- Q1. Create database and use the database
-- ============================================================

CREATE DATABASE company_db;
USE company_db;

-- OUTPUT:
-- Database created successfully
-- Database changed


-- ============================================================
-- Q2. Create employee table
-- ============================================================

CREATE TABLE employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    designation VARCHAR(50),
    salary INT
);

-- OUTPUT:
-- Query OK, 0 rows affected


-- ============================================================
-- Q3. Insert 10 employee records
-- ============================================================

INSERT INTO employee
(employee_name, age, department, designation, salary)
VALUES
('Rahul Sharma', 28, 'IT', 'Developer', 55000),
('Priya Verma', 26, 'HR', 'Executive', 42000),
('Amit Singh', 30, 'IT', 'Team Lead', 75000),
('Neha Patel', 27, 'Finance', 'Accountant', 48000),
('Rohit Mehta', 32, 'IT', 'Manager', 90000),
('Sneha Jain', 25, 'Marketing', 'Executive', 40000),
('Karan Gupta', 29, 'IT', 'Developer', 60000),
('Pooja Mishra', 31, 'HR', 'Manager', 80000),
('Ankit Tiwari', 28, 'Finance', 'Analyst', 65000),
('Riya Kapoor', 27, 'Marketing', 'Manager', 70000);

-- OUTPUT:
-- Query OK, 10 rows affected
-- Records: 10
-- Duplicates: 0
-- Warnings: 0


-- ============================================================
-- Q4. Display structure of employee table
-- ============================================================

DESC employee;

-- OUTPUT:
-- +---------------+-------------+------+-----+---------+----------------+
-- | Field         | Type        | Null | Key | Default | Extra          |
-- +---------------+-------------+------+-----+---------+----------------+
-- | employee_id   | int         | NO   | PRI | NULL    | auto_increment |
-- | employee_name | varchar(50) | YES  |     | NULL    |                |
-- | age           | int         | YES  |     | NULL    |                |
-- | department    | varchar(50) | YES  |     | NULL    |                |
-- | designation   | varchar(50) | YES  |     | NULL    |                |
-- | salary        | int         | YES  |     | NULL    |                |
-- +---------------+-------------+------+-----+---------+----------------+


-- ============================================================
-- Q5. Display all records from employee table
-- ============================================================

SELECT * FROM employee;

-- OUTPUT:
-- +-------------+---------------+------+------------+-------------+--------+
-- | employee_id | employee_name | age  | department | designation | salary |
-- +-------------+---------------+------+------------+-------------+--------+
-- | 1           | Rahul Sharma  | 28   | IT         | Developer   | 55000  |
-- | 2           | Priya Verma   | 26   | HR         | Executive   | 42000  |
-- | 3           | Amit Singh    | 30   | IT         | Team Lead   | 75000  |
-- | 4           | Neha Patel    | 27   | Finance    | Accountant  | 48000  |
-- | 5           | Rohit Mehta   | 32   | IT         | Manager     | 90000  |
-- | 6           | Sneha Jain    | 25   | Marketing  | Executive   | 40000  |
-- | 7           | Karan Gupta   | 29   | IT         | Developer   | 60000  |
-- | 8           | Pooja Mishra  | 31   | HR         | Manager     | 80000  |
-- | 9           | Ankit Tiwari  | 28   | Finance    | Analyst     | 65000  |
-- | 10          | Riya Kapoor   | 27   | Marketing  | Manager     | 70000  |
-- +-------------+---------------+------+------------+-------------+--------+
-- 10 rows in set