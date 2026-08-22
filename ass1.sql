-- ============================================================
-- ASSIGNMENT 1 - STUDENT MANAGEMENT SYSTEM
-- ============================================================

-- Q1. Create database and use the database

CREATE DATABASE school_db;
USE school_db;

-- OUTPUT:
-- Database created successfully
-- Database changed


-- ============================================================
-- Q2. Create student table
-- ============================================================

CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(50),
    age INT,
    course VARCHAR(50),
    city VARCHAR(50),
    marks INT
);

-- OUTPUT:
-- Query OK, 0 rows affected


-- ============================================================
-- Q3. Insert 10 student records
-- ============================================================

INSERT INTO student
(student_name, age, course, city, marks)
VALUES
('Rahul Sharma', 21, 'Python', 'Indore', 85),
('Priya Verma', 22, 'Java', 'Bhopal', 78),
('Amit Singh', 20, 'Python', 'Indore', 92),
('Neha Patel', 23, 'Java', 'Pune', 81),
('Rohit Mehta', 21, 'Python', 'Mumbai', 88),
('Sneha Jain', 22, 'Java', 'Indore', 76),
('Karan Gupta', 20, 'Python', 'Delhi', 95),
('Pooja Mishra', 23, 'Java', 'Bhopal', 84),
('Ankit Tiwari', 21, 'Python', 'Pune', 79),
('Riya Kapoor', 22, 'Java', 'Mumbai', 91);

-- OUTPUT:
-- Query OK, 10 rows affected
-- Records: 10
-- Duplicates: 0
-- Warnings: 0


-- ============================================================
-- Q4. Display structure of student table
-- ============================================================

DESC student;

-- OUTPUT:
-- +--------------+-------------+------+-----+---------+----------------+
-- | Field        | Type        | Null | Key | Default | Extra          |
-- +--------------+-------------+------+-----+---------+----------------+
-- | student_id   | int         | NO   | PRI | NULL    | auto_increment |
-- | student_name | varchar(50) | YES  |     | NULL    |                |
-- | age          | int         | YES  |     | NULL    |                |
-- | course       | varchar(50) | YES  |     | NULL    |                |
-- | city         | varchar(50) | YES  |     | NULL    |                |
-- | marks        | int         | YES  |     | NULL    |                |
-- +--------------+-------------+------+-----+---------+----------------+


-- ============================================================
-- Q5. Display all records
-- ============================================================

SELECT * FROM student;

-- OUTPUT:
-- +------------+---------------+------+--------+--------+-------+
-- | student_id | student_name  | age  | course | city   | marks |
-- +------------+---------------+------+--------+--------+-------+
-- | 1          | Rahul Sharma  | 21   | Python | Indore | 85    |
-- | 2          | Priya Verma   | 22   | Java   | Bhopal | 78    |
-- | 3          | Amit Singh    | 20   | Python | Indore | 92    |
-- | 4          | Neha Patel    | 23   | Java   | Pune   | 81    |
-- | 5          | Rohit Mehta   | 21   | Python | Mumbai | 88    |
-- | 6          | Sneha Jain    | 22   | Java   | Indore | 76    |
-- | 7          | Karan Gupta   | 20   | Python | Delhi  | 95    |
-- | 8          | Pooja Mishra  | 23   | Java   | Bhopal | 84    |
-- | 9          | Ankit Tiwari  | 21   | Python | Pune   | 79    |
-- | 10         | Riya Kapoor   | 22   | Java   | Mumbai | 91    |
-- +------------+---------------+------+--------+--------+-------+
-- 10 rows in set