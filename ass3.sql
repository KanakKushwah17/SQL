-- ============================================================
-- ASSIGNMENT 3 - PRODUCT MANAGEMENT SYSTEM
-- ============================================================

-- Q1. Create database and use the database
-- ============================================================

CREATE DATABASE shop_db;
USE shop_db;

-- OUTPUT:
-- Database created successfully
-- Database changed


-- ============================================================
-- Q2. Create product table
-- ============================================================

CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    brand VARCHAR(50),
    price INT,
    quantity INT
);

-- OUTPUT:
-- Query OK, 0 rows affected


-- ============================================================
-- Q3. Insert 10 product records
-- ============================================================

INSERT INTO product
(product_name, category, brand, price, quantity)
VALUES
('Laptop', 'Electronics', 'Dell', 55000, 10),
('Smartphone', 'Electronics', 'Samsung', 25000, 15),
('Keyboard', 'Accessories', 'Logitech', 1500, 25),
('Mouse', 'Accessories', 'HP', 800, 30),
('Monitor', 'Electronics', 'LG', 18000, 12),
('Headphones', 'Accessories', 'Sony', 3000, 20),
('Printer', 'Electronics', 'Canon', 12000, 8),
('Tablet', 'Electronics', 'Lenovo', 22000, 14),
('Webcam', 'Accessories', 'Logitech', 2500, 18),
('Speaker', 'Accessories', 'JBL', 4500, 16);

-- OUTPUT:
-- Query OK, 10 rows affected
-- Records: 10
-- Duplicates: 0
-- Warnings: 0


-- ============================================================
-- Q4. Display structure of product table
-- ============================================================

DESC product;

-- OUTPUT:
-- +--------------+-------------+------+-----+---------+----------------+
-- | Field        | Type        | Null | Key | Default | Extra          |
-- +--------------+-------------+------+-----+---------+----------------+
-- | product_id   | int         | NO   | PRI | NULL    | auto_increment |
-- | product_name | varchar(50) | YES  |     | NULL    |                |
-- | category     | varchar(50) | YES  |     | NULL    |                |
-- | brand        | varchar(50) | YES  |     | NULL    |                |
-- | price        | int         | YES  |     | NULL    |                |
-- | quantity     | int         | YES  |     | NULL    |                |
-- +--------------+-------------+------+-----+---------+----------------+


-- ============================================================
-- Q5. Display all records from product table
-- ============================================================

SELECT * FROM product;

-- OUTPUT:
-- +------------+--------------+-------------+----------+-------+----------+
-- | product_id | product_name | category    | brand    | price | quantity |
-- +------------+--------------+-------------+----------+-------+----------+
-- | 1          | Laptop       | Electronics | Dell     | 55000 | 10       |
-- | 2          | Smartphone   | Electronics | Samsung  | 25000 | 15       |
-- | 3          | Keyboard     | Accessories | Logitech | 1500  | 25       |
-- | 4          | Mouse        | Accessories | HP       | 800   | 30       |
-- | 5          | Monitor      | Electronics | LG       | 18000 | 12       |
-- | 6          | Headphones   | Accessories | Sony     | 3000  | 20       |
-- | 7          | Printer      | Electronics | Canon    | 12000 | 8        |
-- | 8          | Tablet       | Electronics | Lenovo   | 22000 | 14       |
-- | 9          | Webcam       | Accessories | Logitech | 2500  | 18       |
-- | 10         | Speaker      | Accessories | JBL      | 4500  | 16       |
-- +------------+-------------+-------------+----------+-------+----------+
-- 10 rows in set