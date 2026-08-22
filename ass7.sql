-- ============================================================
-- ASSIGNMENT 1 - EMPLOYEE MANAGEMENT SYSTEM
-- ============================================================

-- Q1. Create Database
CREATE DATABASE employee_management;

USE employee_management;


-- ============================================================
-- Q2. Create employees Table
-- ============================================================

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    city VARCHAR(50),
    salary INT,
    experience INT,
    age INT,
    joining_date DATE
);


-- ============================================================
-- Q3. Insert 15 Employees
-- ============================================================

INSERT INTO employees
(employee_name, department, city, salary, experience, age, joining_date)
VALUES
('Rahul Sharma', 'IT', 'Indore', 55000, 4, 27, '2022-06-15'),
('Priya Verma', 'HR', 'Bhopal', 42000, 3, 25, '2023-01-20'),
('Amit Singh', 'IT', 'Pune', 75000, 7, 32, '2021-08-10'),
('Neha Patel', 'Finance', 'Mumbai', 68000, 6, 30, '2020-11-05'),
('Rohit Mehta', 'Sales', 'Bangalore', 48000, 4, 29, '2024-03-18'),
('Sneha Jain', 'IT', 'Indore', 82000, 8, 35, '2020-07-12'),
('Karan Gupta', 'Finance', 'Pune', 60000, 5, 31, '2022-09-25'),
('Pooja Mishra', 'HR', 'Bhopal', 38000, 2, 24, '2025-02-15'),
('Ankit Tiwari', 'Sales', 'Mumbai', 45000, 3, 26, '2023-07-01'),
('Riya Kapoor', 'IT', 'Bangalore', 95000, 10, 38, '2020-01-10'),
('Vikas Yadav', 'Finance', 'Indore', 72000, 6, 34, '2021-05-20'),
('Kavita Rao', 'Sales', 'Pune', 52000, 5, 30, '2024-08-12'),
('Manish Kumar', 'HR', 'Mumbai', 65000, 7, 36, '2022-04-18'),
('Anjali Sharma', 'IT', 'Delhi', 70000, 5, 33, '2025-06-10'),
('Suresh Patel', 'Finance', 'Bangalore', 88000, 9, 40, '2023-10-15');


-- ============================================================
-- DISPLAY ALL EMPLOYEES
-- ============================================================

SELECT * FROM employees;


-- ============================================================
-- Q1. Salary greater than 60000
-- ============================================================

SELECT * FROM employees
WHERE salary > 60000;


-- ============================================================
-- Q2. Salary less than 50000
-- ============================================================

SELECT * FROM employees
WHERE salary < 50000;


-- ============================================================
-- Q3. Age greater than 30
-- ============================================================

SELECT * FROM employees
WHERE age > 30;


-- ============================================================
-- Q4. Experience >= 5 years
-- ============================================================

SELECT * FROM employees
WHERE experience >= 5;


-- ============================================================
-- Q5. Employees working in IT or Finance
-- ============================================================

SELECT * FROM employees
WHERE department IN ('IT', 'Finance');


-- ============================================================
-- Q6. Employees working in IT, HR, or Sales
-- ============================================================

SELECT * FROM employees
WHERE department IN ('IT', 'HR', 'Sales');


-- ============================================================
-- Q7. Employees NOT working in IT or HR
-- ============================================================

SELECT * FROM employees
WHERE department NOT IN ('IT', 'HR');


-- ============================================================
-- Q8. Employees from Indore or Pune
-- ============================================================

SELECT * FROM employees
WHERE city IN ('Indore', 'Pune');


-- ============================================================
-- Q9. Employees NOT from Indore, Mumbai, or Bhopal
-- ============================================================

SELECT * FROM employees
WHERE city NOT IN ('Indore', 'Mumbai', 'Bhopal');


-- ============================================================
-- Q10. Salary between 40000 and 70000
-- ============================================================

SELECT * FROM employees
WHERE salary BETWEEN 40000 AND 70000;


-- ============================================================
-- Q11. Age between 25 and 35
-- ============================================================

SELECT * FROM employees
WHERE age BETWEEN 25 AND 35;


-- ============================================================
-- Q12. Experience between 3 and 7 years
-- ============================================================

SELECT * FROM employees
WHERE experience BETWEEN 3 AND 7;


-- ============================================================
-- Q13. Joined between 2022 and 2025
-- ============================================================

SELECT * FROM employees
WHERE joining_date BETWEEN '2022-01-01' AND '2025-12-31';


-- ============================================================
-- Q14. Joined before 2023
-- ============================================================

SELECT * FROM employees
WHERE joining_date < '2023-01-01';


-- ============================================================
-- Q15. Joined after 2024
-- ============================================================

SELECT * FROM employees
WHERE joining_date > '2024-12-31';


-- ============================================================
-- Q16. From Indore AND working in IT
-- ============================================================

SELECT * FROM employees
WHERE city = 'Indore'
AND department = 'IT';


-- ============================================================
-- Q17. IT AND salary greater than 70000
-- ============================================================

SELECT * FROM employees
WHERE department = 'IT'
AND salary > 70000;


-- ============================================================
-- Q18. Salary 50000-90000 AND experience > 4
-- ============================================================

SELECT * FROM employees
WHERE salary BETWEEN 50000 AND 90000
AND experience > 4;


-- ============================================================
-- Q19. IT or Finance AND salary > 60000
-- ============================================================

SELECT * FROM employees
WHERE department IN ('IT', 'Finance')
AND salary > 60000;


-- ============================================================
-- Q20. Joined 2021-2024 AND salary > 50000
-- ============================================================

SELECT * FROM employees
WHERE joining_date BETWEEN '2021-01-01' AND '2024-12-31'
AND salary > 50000;


-- ============================================================
-- Q21. Salary NOT between 40000 and 70000
-- ============================================================

SELECT * FROM employees
WHERE salary NOT BETWEEN 40000 AND 70000;


-- ============================================================
-- Q22. Department NOT IT, HR, Sales
-- ============================================================

SELECT * FROM employees
WHERE department NOT IN ('IT', 'HR', 'Sales');


-- ============================================================
-- Q23. Joining date NOT between 2022 and 2025
-- ============================================================

SELECT * FROM employees
WHERE joining_date NOT BETWEEN '2022-01-01' AND '2025-12-31';


-- ============================================================
-- Q24. Indore/Pune + salary 45000-80000 + experience > 3
-- ============================================================

SELECT * FROM employees
WHERE city IN ('Indore', 'Pune')
AND salary BETWEEN 45000 AND 80000
AND experience > 3;


-- ============================================================
-- Q25. Did NOT join 2020-2023 + salary > 60000
-- ============================================================

SELECT * FROM employees
WHERE joining_date NOT BETWEEN '2020-01-01' AND '2023-12-31'
AND salary > 60000;


-- ============================================================
-- Q26. Indore/Pune/Bangalore
-- salary 50000-90000
-- experience >= 4
-- ============================================================

SELECT * FROM employees
WHERE city IN ('Indore', 'Pune', 'Bangalore')
AND salary BETWEEN 50000 AND 90000
AND experience >= 4;


-- ============================================================
-- Q27. NOT Bhopal/Mumbai
-- NOT HR
-- joined 2021-2025
-- ============================================================

SELECT * FROM employees
WHERE city NOT IN ('Bhopal', 'Mumbai')
AND department <> 'HR'
AND joining_date BETWEEN '2021-01-01' AND '2025-12-31';


-- ============================================================
-- Q28. IT/Finance
-- salary > 60000
-- age 25-35
-- joined after 2022
-- ============================================================

SELECT * FROM employees
WHERE department IN ('IT', 'Finance')
AND salary > 60000
AND age BETWEEN 25 AND 35
AND joining_date > '2022-12-31';


-- ============================================================
-- Q29. Salary NOT 40000-75000
-- experience 2-8
-- NOT Sales
-- ============================================================

SELECT * FROM employees
WHERE salary NOT BETWEEN 40000 AND 75000
AND experience BETWEEN 2 AND 8
AND department <> 'Sales';


-- ============================================================
-- Q30. Indore/Pune
-- IT/Finance/HR
-- salary 45000-85000
-- joined 2020-2024
-- ============================================================

SELECT * FROM employees
WHERE city IN ('Indore', 'Pune')
AND department IN ('IT', 'Finance', 'HR')
AND salary BETWEEN 45000 AND 85000
AND joining_date BETWEEN '2020-01-01' AND '2024-12-31';