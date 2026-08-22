-- ============================================================
-- SQL ASSIGNMENT - DDL & DML PRACTICE
-- ============================================================


-- ============================================================
-- QNO 1: Create and Populate students Table
-- ============================================================

CREATE TABLE students (
    id INT,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    address VARCHAR(150),
    phone VARCHAR(15),
    email VARCHAR(100)
);

-- OUTPUT:
-- Query OK, 0 rows affected


INSERT INTO students
(id, name, age, gender, address, phone, email)
VALUES
(1, 'Rahul Sharma', 21, 'Male', 'Indore', '9876543210', 'rahul@gmail.com'),
(2, 'Priya Verma', 22, 'Female', 'Bhopal', '9876543211', 'priya@gmail.com'),
(3, 'Amit Singh', 20, 'Male', 'Pune', '9876543212', 'amit@gmail.com'),
(4, 'Neha Patel', 23, 'Female', 'Mumbai', '9876543213', 'neha@gmail.com'),
(5, 'Karan Gupta', 21, 'Male', 'Delhi', '9876543214', 'karan@gmail.com');

-- OUTPUT:
-- Query OK, 5 rows affected
-- Records: 5
-- Duplicates: 0
-- Warnings: 0


SELECT * FROM students;

-- OUTPUT:
-- +----+--------------+------+--------+---------+------------+------------------+
-- | id | name         | age  | gender | address | phone      | email            |
-- +----+--------------+------+--------+---------+------------+------------------+
-- | 1  | Rahul Sharma | 21   | Male   | Indore  | 9876543210 | rahul@gmail.com  |
-- | 2  | Priya Verma  | 22   | Female | Bhopal  | 9876543211 | priya@gmail.com  |
-- | 3  | Amit Singh   | 20   | Male   | Pune    | 9876543212 | amit@gmail.com   |
-- | 4  | Neha Patel   | 23   | Female | Mumbai  | 9876543213 | neha@gmail.com   |
-- | 5  | Karan Gupta  | 21   | Male   | Delhi   | 9876543214 | karan@gmail.com  |
-- +----+--------------+------+--------+---------+------------+------------------+


-- ============================================================
-- QNO 2: Create and Populate books Table
-- ============================================================

CREATE TABLE books (
    book_id INT,
    title VARCHAR(150),
    author VARCHAR(100),
    genre VARCHAR(50),
    publication_year INT,
    price DECIMAL(6,2),
    publisher VARCHAR(100)
);

-- OUTPUT:
-- Query OK, 0 rows affected


INSERT INTO books
(book_id, title, author, genre, publication_year, price, publisher)
VALUES
(101, 'The Alchemist', 'Paulo Coelho', 'Fiction', 1988, 450.00, 'HarperCollins'),
(102, 'Wings of Fire', 'A.P.J. Abdul Kalam', 'Biography', 1999, 350.00, 'Universities Press'),
(103, 'Atomic Habits', 'James Clear', 'Self Help', 2018, 550.00, 'Penguin'),
(104, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937, 600.00, 'Allen & Unwin');

-- OUTPUT:
-- Query OK, 4 rows affected


SELECT * FROM books;

-- OUTPUT:
-- +---------+----------------+----------------------+----------+------------------+--------+--------------------+
-- | book_id | title          | author               | genre    | publication_year | price  | publisher          |
-- +---------+----------------+----------------------+----------+------------------+--------+--------------------+
-- | 101     | The Alchemist  | Paulo Coelho         | Fiction  | 1988             | 450.00 | HarperCollins      |
-- | 102     | Wings of Fire  | A.P.J. Abdul Kalam   | Biography| 1999             | 350.00 | Universities Press |
-- | 103     | Atomic Habits  | James Clear          | Self Help| 2018             | 550.00 | Penguin            |
-- | 104     | The Hobbit     | J.R.R. Tolkien       | Fantasy  | 1937             | 600.00 | Allen & Unwin      |
-- +---------+----------------+----------------------+----------+------------------+--------+--------------------+


-- ============================================================
-- QNO 3: ALTER students Table
-- ============================================================

-- Add dob column

ALTER TABLE students
ADD dob DATE;

-- OUTPUT:
-- Query OK, 0 rows affected


-- Rename phone to mobile_number

ALTER TABLE students
RENAME COLUMN phone TO mobile_number;

-- OUTPUT:
-- Query OK, 0 rows affected


-- Modify age to SMALLINT

ALTER TABLE students
MODIFY age SMALLINT;

-- OUTPUT:
-- Query OK, 0 rows affected


-- Drop email column

ALTER TABLE students
DROP COLUMN email;

-- OUTPUT:
-- Query OK, 0 rows affected


DESC students;

-- OUTPUT:
-- +---------------+--------------+
-- | Field         | Type         |
-- +---------------+--------------+
-- | id            | int          |
-- | name          | varchar(100) |
-- | age           | smallint     |
-- | gender        | varchar(10)  |
-- | address       | varchar(150) |
-- | mobile_number | varchar(15)  |
-- | dob           | date         |
-- +---------------+--------------+


-- ============================================================
-- QNO 4: RENAME Table
-- ============================================================

RENAME TABLE books TO library_books;

-- OUTPUT:
-- Query OK, 0 rows affected


-- Check renamed table

SHOW TABLES;

-- OUTPUT:
-- library_books
-- students


-- ============================================================
-- QNO 5: TRUNCATE Table
-- ============================================================

TRUNCATE TABLE students;

-- OUTPUT:
-- Query OK, 0 rows affected


SELECT * FROM students;

-- OUTPUT:
-- Empty set


-- ============================================================
-- QNO 6: DROP Table
-- ============================================================

DROP TABLE library_books;

-- OUTPUT:
-- Query OK, 0 rows affected


SHOW TABLES;

-- OUTPUT:
-- students


-- ============================================================
-- QNO 7: Create and Insert into products Table
-- ============================================================

CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(7,2),
    stock_quantity INT,
    supplier_name VARCHAR(100),
    manufacture_date DATE,
    expiry_date DATE
);

-- OUTPUT:
-- Query OK, 0 rows affected


INSERT INTO products
(product_id, product_name, category, price, stock_quantity,
 supplier_name, manufacture_date, expiry_date)
VALUES
(1, 'Laptop', 'Electronics', 55000.00, 10, 'Dell India',
 '2025-01-10', NULL),

(2, 'Smartphone', 'Electronics', 25000.00, 15, 'Samsung India',
 '2025-02-15', NULL),

(3, 'Milk', 'Grocery', 60.00, 50, 'Amul',
 '2026-01-05', '2026-01-20'),

(4, 'Biscuits', 'Grocery', 40.00, 100, 'Parle',
 '2026-02-10', '2026-08-10'),

(5, 'Notebook', 'Stationery', 80.00, 75, 'Classmate',
 '2025-12-01', NULL),

(6, 'Shampoo', 'Personal Care', 250.00, 40, 'Hindustan Unilever',
 '2025-11-15', '2027-11-15');

-- OUTPUT:
-- Query OK, 6 rows affected


SELECT * FROM products;

-- OUTPUT:
-- +------------+--------------+--------------+----------+---------------+---------------------+------------------+-------------+
-- | product_id | product_name | category     | price    | stock_quantity| supplier_name       | manufacture_date | expiry_date |
-- +------------+--------------+--------------+----------+---------------+---------------------+------------------+-------------+
-- | 1          | Laptop       | Electronics  | 55000.00 | 10            | Dell India          | 2025-01-10       | NULL        |
-- | 2          | Smartphone   | Electronics  | 25000.00 | 15            | Samsung India       | 2025-02-15       | NULL        |
-- | 3          | Milk        | Grocery      | 60.00    | 50            | Amul                | 2026-01-05       | 2026-01-20  |
-- | 4          | Biscuits     | Grocery      | 40.00    | 100           | Parle               | 2026-02-10       | 2026-08-10  |
-- | 5          | Notebook     | Stationery   | 80.00    | 75            | Classmate           | 2025-12-01       | NULL        |
-- | 6          | Shampoo      | Personal Care| 250.00   | 40            | Hindustan Unilever  | 2025-11-15       | 2027-11-15  |
-- +------------+--------------+--------------+----------+---------------+---------------------+------------------+-------------+


-- ============================================================
-- QNO 8: Create and Insert into employees Table
-- ============================================================

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(100),
    gender VARCHAR(10),
    dob DATE,
    department VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(8,2),
    joining_date DATE,
    phone VARCHAR(15)
);

-- OUTPUT:
-- Query OK, 0 rows affected


INSERT INTO employees
(emp_id, emp_name, gender, dob, department, position,
 salary, joining_date, phone)
VALUES
(101, 'Rahul Sharma', 'Male', '1998-05-12',
 'IT', 'Developer', 55000.00, '2022-07-10', '9876500001'),

(102, 'Priya Verma', 'Female', '1999-08-20',
 'HR', 'HR Executive', 45000.00, '2023-01-15', '9876500002'),

(103, 'Amit Singh', 'Male', '1997-03-25',
 'Finance', 'Accountant', 50000.00, '2021-06-20', '9876500003'),

(104, 'Neha Patel', 'Female', '2000-11-10',
 'Marketing', 'Marketing Executive', 42000.00, '2024-02-05', '9876500004'),

(105, 'Karan Gupta', 'Male', '1996-09-18',
 'IT', 'Team Lead', 75000.00, '2020-08-12', '9876500005');

-- OUTPUT:
-- Query OK, 5 rows affected


SELECT * FROM employees;

-- OUTPUT:
-- +--------+--------------+--------+------------+------------+----------------------+----------+--------------+-------------+
-- | emp_id | emp_name     | gender | dob        | department | position             | salary   | joining_date | phone       |
-- +--------+--------------+--------+------------+------------+----------------------+----------+--------------+-------------+
-- | 101    | Rahul Sharma | Male   | 1998-05-12 | IT         | Developer            | 55000.00 | 2022-07-10   | 9876500001  |
-- | 102    | Priya Verma  | Female | 1999-08-20 | HR         | HR Executive         | 45000.00 | 2023-01-15   | 9876500002  |
-- | 103    | Amit Singh   | Male   | 1997-03-25 | Finance    | Accountant           | 50000.00 | 2021-06-20   | 9876500003  |
-- | 104    | Neha Patel   | Female | 2000-11-10 | Marketing  | Marketing Executive  | 42000.00 | 2024-02-05   | 9876500004  |
-- | 105    | Karan Gupta  | Male   | 1996-09-18 | IT         | Team Lead            | 75000.00 | 2020-08-12   | 9876500005  |
-- +--------+--------------+--------+------------+------------+----------------------+----------+--------------+-------------+


-- ============================================================
-- QNO 9: MOVIE REVIEWS
-- ============================================================


-- Initial Table Creation
-- ============================================================

CREATE TABLE movie_reviews (
    review_id INT,
    movie_title VARCHAR(150),
    reviewer_name VARCHAR(100),
    rating DECIMAL(2,1),
    review_text TEXT
);

-- OUTPUT:
-- Query OK, 0 rows affected


-- Insert 3 sample reviews

INSERT INTO movie_reviews
(review_id, movie_title, reviewer_name, rating, review_text)
VALUES
(1, '3 Idiots', 'Rahul Sharma', 4.5,
 'Excellent movie with a great message.'),

(2, 'Dangal', 'Priya Verma', 4.8,
 'Inspirational and powerful movie.'),

(3, 'Taare Zameen Par', 'Amit Singh', 4.7,
 'Emotional and meaningful story.');

-- OUTPUT:
-- Query OK, 3 rows affected


SELECT * FROM movie_reviews;

-- OUTPUT:
-- 3 records displayed


-- ============================================================
-- STEP 1: Add More Columns
-- ============================================================

ALTER TABLE movie_reviews
ADD review_date DATE,
ADD platform VARCHAR(50),
ADD likes INT;

-- OUTPUT:
-- Query OK, 0 rows affected


-- Insert 2 more rows with new columns

INSERT INTO movie_reviews
(review_id, movie_title, reviewer_name, rating, review_text,
 review_date, platform, likes)
VALUES
(4, 'PK', 'Neha Patel', 4.3,
 'Funny movie with a social message.',
 '2026-08-01', 'IMDb', 120),

(5, 'Zindagi Na Milegi Dobara', 'Karan Gupta', 4.6,
 'Beautiful movie about friendship and life.',
 '2026-08-02', 'Rotten Tomatoes', 150);

-- OUTPUT:
-- Query OK, 2 rows affected


-- ============================================================
-- STEP 2: Rename a Column
-- ============================================================

ALTER TABLE movie_reviews
RENAME COLUMN reviewer_name TO critic_name;

-- OUTPUT:
-- Query OK, 0 rows affected


-- ============================================================
-- STEP 3: Modify Column Types
-- ============================================================

ALTER TABLE movie_reviews
MODIFY rating DECIMAL(3,1);

-- OUTPUT:
-- Query OK, 0 rows affected


ALTER TABLE movie_reviews
MODIFY movie_title VARCHAR(200);

-- OUTPUT:
-- Query OK, 0 rows affected


-- ============================================================
-- STEP 4: Drop an Unnecessary Column
-- ============================================================

ALTER TABLE movie_reviews
DROP COLUMN likes;

-- OUTPUT:
-- Query OK, 0 rows affected


DESC movie_reviews;

-- OUTPUT:
-- +--------------+---------------+
-- | Field        | Type          |
-- +--------------+---------------+
-- | review_id    | int           |
-- | movie_title  | varchar(200)  |
-- | critic_name  | varchar(100)  |
-- | rating       | decimal(3,1)  |
-- | review_text  | text          |
-- | review_date  | date          |
-- | platform     | varchar(50)   |
-- +--------------+---------------+


-- ============================================================
-- STEP 5: Truncate the Table
-- ============================================================

TRUNCATE TABLE movie_reviews;

-- OUTPUT:
-- Query OK, 0 rows affected


SELECT * FROM movie_reviews;

-- OUTPUT:
-- Empty set


-- ============================================================
-- STEP 6: Rename the Table
-- ============================================================

RENAME TABLE movie_reviews TO archived_reviews;

-- OUTPUT:
-- Query OK, 0 rows affected


SHOW TABLES;

-- OUTPUT:
-- archived_reviews
-- employees
-- products


-- ============================================================
-- STEP 7: Drop the Table
-- ============================================================

DROP TABLE archived_reviews;

-- OUTPUT:
-- Query OK, 0 rows affected