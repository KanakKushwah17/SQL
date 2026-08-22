-- ============================================================
-- ASSIGNMENT 3 - EMPLOYEE MANAGEMENT SYSTEM
-- ============================================================

-- Q1. Create Database
CREATE DATABASE employee_management_3;

USE employee_management_3;


-- ============================================================
-- Q2. Create employees Table
-- ============================================================

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    city VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE,
    experience INT,
    age INT,
    gender ENUM('MALE', 'FEMALE'),
    employment_type ENUM('FULL_TIME', 'PART_TIME', 'CONTRACT', 'INTERN'),
    skills SET('JAVA', 'PYTHON', 'SQL', 'REACT', 'SPRING', 'AWS'),
    email VARCHAR(100) NULL,
    manager_id INT NULL
);


-- ============================================================
-- Q3. Insert 15 Employees
-- ============================================================

INSERT INTO employees
(employee_id, employee_name, department, city, salary,
 joining_date, experience, age, gender, employment_type,
 skills, email, manager_id)
VALUES

(101, 'Amit Sharma', 'IT', 'Indore', 65000.00,
 '2021-06-15', 5, 29, 'MALE', 'FULL_TIME',
 'JAVA,SQL,SPRING', 'amit@gmail.com', 105),

(102, 'Sneha Verma', 'Finance', 'Pune', 72000.00,
 '2023-02-10', 6, 31, 'FEMALE', 'FULL_TIME',
 'PYTHON,SQL,AWS', 'sneha@gmail.com', 110),

(103, 'Rahul Singh', 'HR', 'Bhopal', 38000.00,
 '2024-05-20', 3, 27, 'MALE', 'FULL_TIME',
 'PYTHON,SQL', NULL, 108),

(104, 'Anjali Patel', 'IT', 'Delhi', 85000.00,
 '2022-08-12', 7, 34, 'FEMALE', 'FULL_TIME',
 'JAVA,REACT,SQL', 'anjali@gmail.com', 105),

(105, 'Suresh Mehta', 'Development', 'Indore', 95000.00,
 '2025-01-15', 9, 38, 'MALE', 'FULL_TIME',
 'JAVA,SPRING,AWS', 'suresh@gmail.com', NULL),

(106, 'Pooja Jain', 'Finance', 'Mumbai', 45000.00,
 '2023-09-18', 3, 26, 'FEMALE', 'PART_TIME',
 'PYTHON,SQL', NULL, 110),

(107, 'Arjun Gupta', 'IT', 'Pune', 58000.00,
 '2024-01-25', 4, 28, 'MALE', 'CONTRACT',
 'JAVA,REACT', 'arjun@gmail.com', 105),

(108, 'Simran Kapoor', 'HR', 'Delhi', 52000.00,
 '2022-03-10', 5, 30, 'FEMALE', 'FULL_TIME',
 'PYTHON,SQL', 'simran@gmail.com', NULL),

(109, 'Mohit Tiwari', 'Development', 'Indore', 78000.00,
 '2025-06-01', 6, 33, 'MALE', 'FULL_TIME',
 'PYTHON,REACT,AWS', 'mohit@gmail.com', 105),

(110, 'Ayesha Khan', 'Finance', 'Pune', 62000.00,
 '2021-11-20', 5, 29, 'FEMALE', 'FULL_TIME',
 'JAVA,SQL', 'ayesha@gmail.com', NULL),

(111, 'Sameer Joshi', 'IT', 'Mumbai', 90000.00,
 '2020-07-15', 8, 36, 'MALE', 'FULL_TIME',
 'JAVA,SQL,SPRING', NULL, 105),

(112, 'Meena Rao', 'Development', 'Delhi', 55000.00,
 '2024-11-10', 3, 25, 'FEMALE', 'CONTRACT',
 'PYTHON,REACT', 'meena@gmail.com', 109),

(113, 'Aman Verma', 'IT', 'Indore', 48000.00,
 '2026-02-15', 2, 24, 'MALE', 'INTERN',
 'PYTHON,SQL', 'aman@gmail.com', 105),

(114, 'Shreya Patel', 'Finance', 'Delhi', 68000.00,
 '2023-06-25', 4, 28, 'FEMALE', 'PART_TIME',
 'JAVA,PYTHON,SQL', NULL, 110),

(115, 'Manish Kumar', 'Development', 'Pune', 82000.00,
 '2022-12-05', 7, 35, 'MALE', 'FULL_TIME',
 'JAVA,REACT,SQL', 'manish@gmail.com', 109);


-- ============================================================
-- DISPLAY ALL RECORDS
-- ============================================================

SELECT * FROM employees;


-- ============================================================
-- Q1. IT, Finance, HR + joined after 2023
-- salary 40000-90000 + experience > 3
-- ============================================================

SELECT * FROM employees
WHERE department IN ('IT', 'Finance', 'HR')
AND joining_date > '2023-01-01'
AND salary BETWEEN 40000 AND 90000
AND experience > 3;


-- ============================================================
-- Q2. Email NULL + salary > 50000 + joined after 2022
-- ============================================================

SELECT * FROM employees
WHERE email IS NULL
AND salary > 50000
AND joining_date > '2022-01-01';


-- ============================================================
-- Q3. Manager NOT NULL + department NOT HR
-- salary < 40000 OR salary > 80000
-- ============================================================

SELECT * FROM employees
WHERE manager_id IS NOT NULL
AND department <> 'HR'
AND (salary < 40000 OR salary > 80000);


-- ============================================================
-- Q4. Indore/Pune/Delhi
-- joined 2022-2025
-- salary > 45000
-- experience >= 3
-- ============================================================

SELECT * FROM employees
WHERE city IN ('Indore', 'Pune', 'Delhi')
AND joining_date BETWEEN '2022-01-01' AND '2025-12-31'
AND salary > 45000
AND experience >= 3;


-- ============================================================
-- Q5. FULL_TIME + JAVA/PYTHON + salary > 50000
-- email NOT NULL
-- ============================================================

SELECT * FROM employees
WHERE employment_type = 'FULL_TIME'
AND (FIND_IN_SET('JAVA', skills) > 0
     OR FIND_IN_SET('PYTHON', skills) > 0)
AND salary > 50000
AND email IS NOT NULL;


-- ============================================================
-- Q6. Name starts A/S
-- joined after 2023
-- salary 30000-80000
-- age 25-35
-- ============================================================

SELECT * FROM employees
WHERE (employee_name LIKE 'A%'
       OR employee_name LIKE 'S%')
AND joining_date > '2023-01-01'
AND salary BETWEEN 30000 AND 80000
AND age BETWEEN 25 AND 35;


-- ============================================================
-- Q7. IT/Finance + JAVA
-- experience > 4
-- salary NOT 50000-80000
-- ============================================================

SELECT * FROM employees
WHERE department IN ('IT', 'Finance')
AND FIND_IN_SET('JAVA', skills) > 0
AND experience > 4
AND salary NOT BETWEEN 50000 AND 80000;


-- ============================================================
-- Q8. IT/HR/Marketing
-- city NOT Mumbai
-- salary > 40000
-- email NULL OR manager NULL
-- ============================================================

SELECT * FROM employees
WHERE department IN ('IT', 'HR', 'Marketing')
AND city <> 'Mumbai'
AND salary > 40000
AND (email IS NULL OR manager_id IS NULL);


-- ============================================================
-- Q9. Joined after 2022
-- NOT INTERN
-- salary > 45000
-- SQL/PYTHON skills
-- ============================================================

SELECT * FROM employees
WHERE joining_date > '2022-01-01'
AND employment_type <> 'INTERN'
AND salary > 45000
AND (FIND_IN_SET('SQL', skills) > 0
     OR FIND_IN_SET('PYTHON', skills) > 0);


-- ============================================================
-- Q10. Salary > 60000 OR experience > 7
-- exclude Mumbai/Bhopal
-- ============================================================

SELECT * FROM employees
WHERE (salary > 60000 OR experience > 7)
AND city NOT IN ('Mumbai', 'Bhopal');


-- ============================================================
-- Q11. IT/Development
-- joined 2023-2026
-- salary > 50000
-- email NOT NULL
-- ============================================================

SELECT * FROM employees
WHERE joining_date BETWEEN '2023-01-01' AND '2026-12-31'
AND department IN ('IT', 'Development')
AND salary > 50000
AND email IS NOT NULL;


-- ============================================================
-- Q12. Name contains 'a'
-- department NOT HR
-- salary 35000-75000
-- joined after 2022-06-01
-- ============================================================

SELECT * FROM employees
WHERE employee_name LIKE '%a%'
AND department <> 'HR'
AND salary BETWEEN 35000 AND 75000
AND joining_date > '2022-06-01';


-- ============================================================
-- Q13. JAVA AND SQL
-- salary > 55000
-- experience > 3
-- manager NOT NULL
-- ============================================================

SELECT * FROM employees
WHERE FIND_IN_SET('JAVA', skills) > 0
AND FIND_IN_SET('SQL', skills) > 0
AND salary > 55000
AND experience > 3
AND manager_id IS NOT NULL;


-- ============================================================
-- Q14. PYTHON OR REACT
-- IT/Development
-- joined after 2023
-- salary > 50000
-- ============================================================

SELECT * FROM employees
WHERE (FIND_IN_SET('PYTHON', skills) > 0
       OR FIND_IN_SET('REACT', skills) > 0)
AND department IN ('IT', 'Development')
AND joining_date > '2023-01-01'
AND salary > 50000;


-- ============================================================
-- Q15. CONTRACT/PART_TIME
-- salary > 35000
-- joined 2022-2025
-- email NOT NULL
-- ============================================================

SELECT * FROM employees
WHERE employment_type IN ('CONTRACT', 'PART_TIME')
AND salary > 35000
AND joining_date BETWEEN '2022-01-01' AND '2025-12-31'
AND email IS NOT NULL;


-- ============================================================
-- Q16. FEMALE + IT/Finance
-- salary > 45000
-- experience > 2
-- ============================================================

SELECT * FROM employees
WHERE gender = 'FEMALE'
AND department IN ('IT', 'Finance')
AND salary > 45000
AND experience > 2;


-- ============================================================
-- Q17. Indore/Pune/Delhi
-- department NOT HR
-- joined after 2023
-- salary 40000-100000
-- manager NOT NULL
-- ============================================================

SELECT * FROM employees
WHERE city IN ('Indore', 'Pune', 'Delhi')
AND department <> 'HR'
AND joining_date > '2023-01-01'
AND salary BETWEEN 40000 AND 100000
AND manager_id IS NOT NULL;


-- ============================================================
-- Q18. Salary NOT 30000-60000
-- experience > 5
-- IT/Finance
-- ============================================================

SELECT * FROM employees
WHERE salary NOT BETWEEN 30000 AND 60000
AND experience > 5
AND department IN ('IT', 'Finance');


-- ============================================================
-- Q19. Email NULL OR manager NULL
-- salary > 40000
-- joined after 2022
-- ============================================================

SELECT * FROM employees
WHERE (email IS NULL OR manager_id IS NULL)
AND salary > 40000
AND joining_date > '2022-01-01';


-- ============================================================
-- Q20. Name starts S OR contains a
-- IT/Finance
-- salary 40000-90000
-- experience >= 3
-- ============================================================

SELECT * FROM employees
WHERE (employee_name LIKE 'S%'
       OR employee_name LIKE '%a%')
AND department IN ('IT', 'Finance')
AND salary BETWEEN 40000 AND 90000
AND experience >= 3;


-- ============================================================
-- Q21. Joined 2022-2025
-- NOT Mumbai/Bhopal
-- salary > 50000
-- JAVA skill
-- ============================================================

SELECT * FROM employees
WHERE joining_date BETWEEN '2022-01-01' AND '2025-12-31'
AND city NOT IN ('Mumbai', 'Bhopal')
AND salary > 50000
AND FIND_IN_SET('JAVA', skills) > 0;


-- ============================================================
-- Q22. FULL_TIME
-- joined after 2023
-- salary > 60000
-- JAVA+SQL OR PYTHON+REACT
-- ============================================================

SELECT * FROM employees
WHERE employment_type = 'FULL_TIME'
AND joining_date > '2023-01-01'
AND salary > 60000
AND (
    (
        FIND_IN_SET('JAVA', skills) > 0
        AND FIND_IN_SET('SQL', skills) > 0
    )
    OR
    (
        FIND_IN_SET('PYTHON', skills) > 0
        AND FIND_IN_SET('REACT', skills) > 0
    )
);


-- ============================================================
-- Q23. IT/Finance/Development
-- salary 45000-90000
-- experience > 3
-- email NOT NULL
-- manager NOT NULL
-- ============================================================

SELECT * FROM employees
WHERE department IN ('IT', 'Finance', 'Development')
AND salary BETWEEN 45000 AND 90000
AND experience > 3
AND email IS NOT NULL
AND manager_id IS NOT NULL;


-- ============================================================
-- Q24. Joined after 2023
-- department NOT HR
-- salary > 50000 OR experience > 6
-- city NOT Mumbai
-- ============================================================

SELECT * FROM employees
WHERE joining_date > '2023-01-01'
AND department <> 'HR'
AND (salary > 50000 OR experience > 6)
AND city <> 'Mumbai';


-- ============================================================
-- Q25. Name starts A/M
-- FEMALE
-- FULL_TIME
-- salary > 45000
-- email NOT NULL
-- ============================================================

SELECT * FROM employees
WHERE (employee_name LIKE 'A%'
       OR employee_name LIKE 'M%')
AND gender = 'FEMALE'
AND employment_type = 'FULL_TIME'
AND salary > 45000
AND email IS NOT NULL;


-- ============================================================
-- Q26. JAVA or SPRING
-- joined after 2022
-- salary NOT 40000-70000
-- manager NOT NULL
-- ============================================================

SELECT * FROM employees
WHERE (FIND_IN_SET('JAVA', skills) > 0
       OR FIND_IN_SET('SPRING', skills) > 0)
AND joining_date > '2022-01-01'
AND salary NOT BETWEEN 40000 AND 70000
AND manager_id IS NOT NULL;


-- ============================================================
-- Q27. Indore/Pune/Delhi
-- joined 2023-2026
-- salary 40000-100000
-- experience > 2
-- email OR manager NULL
-- ============================================================

SELECT * FROM employees
WHERE city IN ('Indore', 'Pune', 'Delhi')
AND joining_date BETWEEN '2023-01-01' AND '2026-12-31'
AND salary BETWEEN 40000 AND 100000
AND experience > 2
AND (email IS NULL OR manager_id IS NULL);


-- ============================================================
-- Q28. IT/Development
-- name contains a
-- JAVA/PYTHON
-- salary > 50000
-- joined after 2023
-- email NOT NULL
-- ============================================================

SELECT * FROM employees
WHERE department IN ('IT', 'Development')
AND employee_name LIKE '%a%'
AND (FIND_IN_SET('JAVA', skills) > 0
     OR FIND_IN_SET('PYTHON', skills) > 0)
AND salary > 50000
AND joining_date > '2023-01-01'
AND email IS NOT NULL;


-- ============================================================
-- Q29. IT/Finance/Development
-- city NOT Mumbai/Bhopal
-- salary 40000-90000
-- experience > 3
-- SQL skill
-- manager NOT NULL
-- ORDER BY salary DESC
-- ============================================================

SELECT * FROM employees
WHERE department IN ('IT', 'Finance', 'Development')
AND city NOT IN ('Mumbai', 'Bhopal')
AND salary BETWEEN 40000 AND 90000
AND experience > 3
AND FIND_IN_SET('SQL', skills) > 0
AND manager_id IS NOT NULL
ORDER BY salary DESC;


-- ============================================================
-- Q30. FINAL COMPLEX QUERY
-- Name starts S OR contains a
-- IT/Finance
-- joined 2023-2026
-- salary 40000-100000
-- experience > 2
-- email NOT NULL
-- manager NOT NULL
-- JAVA/PYTHON
-- city Indore/Pune/Delhi
-- ORDER BY department ASC, salary DESC
-- ============================================================

SELECT * FROM employees
WHERE
(
    employee_name LIKE 'S%'
    OR employee_name LIKE '%a%'
)
AND department IN ('IT', 'Finance')
AND joining_date BETWEEN '2023-01-01' AND '2026-12-31'
AND salary BETWEEN 40000 AND 100000
AND experience > 2
AND email IS NOT NULL
AND manager_id IS NOT NULL
AND (
    FIND_IN_SET('JAVA', skills) > 0
    OR FIND_IN_SET('PYTHON', skills) > 0
)
AND city IN ('Indore', 'Pune', 'Delhi')
ORDER BY department ASC, salary DESC;