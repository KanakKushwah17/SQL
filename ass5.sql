-- ============================================================
-- ASSIGNMENT 1 - EMPLOYEE MANAGEMENT SYSTEM
-- ============================================================

-- ============================================================
-- PART 1: CREATE DATABASE
-- ============================================================

CREATE DATABASE employee_management;

USE employee_management;


-- ============================================================
-- PART 2: CREATE employees TABLE
-- ============================================================

CREATE TABLE employees (

    employee_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,

    employee_code CHAR(6) NOT NULL,

    employee_name VARCHAR(100) NOT NULL,

    age TINYINT UNSIGNED,

    number_of_children TINYINT UNSIGNED,

    experience_months SMALLINT UNSIGNED,

    salary DECIMAL(10,2),

    performance_score FLOAT,

    productivity_score DOUBLE,

    department_id MEDIUMINT UNSIGNED,

    employee_status ENUM(
        'ACTIVE',
        'INACTIVE',
        'ON_LEAVE',
        'RESIGNED'
    ),

    skills SET(
        'JAVA',
        'PYTHON',
        'MYSQL',
        'REACT',
        'AWS'
    ),

    gender ENUM(
        'MALE',
        'FEMALE',
        'OTHER'
    ),

    date_of_birth DATE,

    joining_date DATE,

    login_time TIME,

    interview_datetime DATETIME,

    birth_year YEAR,

    is_active BOOLEAN DEFAULT TRUE,

    short_note TINYTEXT,

    employee_description TEXT,

    training_history MEDIUMTEXT,

    employee_profile LONGTEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);


-- ============================================================
-- CHECK TABLE STRUCTURE
-- ============================================================

DESC employees;


-- ============================================================
-- PART 3: INSERT 15 EMPLOYEES
-- employee_id is NOT inserted because AUTO_INCREMENT
-- generates it automatically.
-- ============================================================

INSERT INTO employees
(
    employee_code,
    employee_name,
    age,
    number_of_children,
    experience_months,
    salary,
    performance_score,
    productivity_score,
    department_id,
    employee_status,
    skills,
    gender,
    date_of_birth,
    joining_date,
    login_time,
    interview_datetime,
    birth_year,
    is_active,
    short_note,
    employee_description,
    training_history,
    employee_profile
)
VALUES

(
    'EMP001',
    'Rahul Sharma',
    28,
    1,
    48,
    52500.50,
    8.5,
    91.45678,
    101,
    'ACTIVE',
    'JAVA,MYSQL',
    'MALE',
    '1998-04-15',
    '2022-06-10',
    '09:05:00',
    '2022-05-20 10:30:00',
    1998,
    TRUE,
    'Good performer',
    'Software developer working on backend applications.',
    'Completed Java and MySQL training programs.',
    'Rahul is an experienced Java developer responsible for backend development and database management.'
),

(
    'EMP002',
    'Priya Verma',
    26,
    0,
    36,
    58500.75,
    9.1,
    94.12345,
    102,
    'ACTIVE',
    'PYTHON,MYSQL',
    'FEMALE',
    '2000-07-21',
    '2023-01-15',
    '09:10:00',
    '2022-12-20 11:00:00',
    2000,
    TRUE,
    'Quick learner',
    'Python developer working on automation projects.',
    'Completed Python, SQL and automation training.',
    'Priya works on Python automation and data processing projects.'
),

(
    'EMP003',
    'Amit Singh',
    32,
    2,
    84,
    78500.75,
    9.3,
    96.78912,
    101,
    'ACTIVE',
    'JAVA,PYTHON,MYSQL',
    'MALE',
    '1994-02-10',
    '2019-08-12',
    '08:55:00',
    '2019-07-15 09:30:00',
    1994,
    TRUE,
    'Team player',
    'Senior software engineer with strong programming skills.',
    'Completed advanced Java, Python and database training.',
    'Amit is a senior developer who handles complex software development and mentoring activities.'
),

(
    'EMP004',
    'Neha Patel',
    24,
    0,
    18,
    45000.25,
    7.8,
    87.34567,
    103,
    'ON_LEAVE',
    'PYTHON,REACT',
    'FEMALE',
    '2002-11-05',
    '2025-01-20',
    '09:20:00',
    '2024-12-15 14:00:00',
    2002,
    FALSE,
    'On leave',
    'Frontend developer working with React applications.',
    'Completed React and frontend development training.',
    'Neha specializes in frontend development and user interface implementation.'
),

(
    'EMP005',
    'Rohit Mehta',
    35,
    2,
    120,
    125000.25,
    9.7,
    98.76543,
    104,
    'ACTIVE',
    'JAVA,MYSQL,AWS',
    'MALE',
    '1991-01-25',
    '2016-03-18',
    '08:45:00',
    '2016-02-20 10:00:00',
    1991,
    TRUE,
    'Senior employee',
    'Senior cloud engineer with extensive technical experience.',
    'Completed AWS, Java and cloud architecture training.',
    'Rohit manages cloud infrastructure and enterprise backend systems.'
),

(
    'EMP006',
    'Sneha Jain',
    29,
    1,
    60,
    67500.50,
    8.9,
    92.67891,
    105,
    'ACTIVE',
    'PYTHON,MYSQL,AWS',
    'FEMALE',
    '1997-09-14',
    '2021-04-10',
    '09:00:00',
    '2021-03-15 12:30:00',
    1997,
    TRUE,
    'Reliable employee',
    'Data engineer working with Python and cloud technologies.',
    'Completed Python, MySQL and AWS training.',
    'Sneha develops data processing solutions and supports cloud-based applications.'
),

(
    'EMP007',
    'Karan Gupta',
    41,
    3,
    180,
    145000.75,
    9.8,
    99.12345,
    106,
    'ACTIVE',
    'JAVA,MYSQL,AWS',
    'MALE',
    '1985-06-18',
    '2011-07-01',
    '08:40:00',
    '2011-06-10 09:00:00',
    1985,
    TRUE,
    'Team leader',
    'Technology manager leading multiple development teams.',
    'Completed leadership and cloud architecture training.',
    'Karan leads technical teams and manages enterprise application development.'
),

(
    'EMP008',
    'Pooja Mishra',
    31,
    1,
    72,
    72500.00,
    8.7,
    90.56789,
    102,
    'INACTIVE',
    'PYTHON,REACT',
    'FEMALE',
    '1995-03-22',
    '2020-09-15',
    '09:15:00',
    '2020-08-20 11:30:00',
    1995,
    FALSE,
    'Inactive employee',
    'Full stack developer experienced in web applications.',
    'Completed Python, React and web development training.',
    'Pooja has experience in developing web applications and frontend interfaces.'
),

(
    'EMP009',
    'Ankit Tiwari',
    27,
    0,
    30,
    51000.50,
    8.2,
    88.34567,
    103,
    'ACTIVE',
    'JAVA,MYSQL',
    'MALE',
    '1999-12-10',
    '2023-07-10',
    '09:25:00',
    '2023-06-15 15:00:00',
    1999,
    TRUE,
    'Junior developer',
    'Junior Java developer working on application maintenance.',
    'Completed Java and database fundamentals training.',
    'Ankit supports application development and database maintenance tasks.'
),

(
    'EMP010',
    'Riya Kapoor',
    23,
    0,
    12,
    42000.75,
    7.9,
    85.67891,
    104,
    'ACTIVE',
    'PYTHON,REACT',
    'FEMALE',
    '2003-08-16',
    '2025-06-01',
    '09:30:00',
    '2025-05-10 10:30:00',
    2003,
    TRUE,
    'New employee',
    'Junior frontend and Python developer.',
    'Completed Python and React beginner training.',
    'Riya is a junior developer learning modern web technologies.'
),

(
    'EMP011',
    'Vikas Yadav',
    38,
    2,
    150,
    98000.25,
    9.2,
    95.45678,
    105,
    'ON_LEAVE',
    'JAVA,AWS',
    'MALE',
    '1988-10-12',
    '2013-05-15',
    '08:50:00',
    '2013-04-20 09:30:00',
    1988,
    FALSE,
    'On leave',
    'Cloud application architect with extensive experience.',
    'Completed AWS and enterprise Java training.',
    'Vikas designs scalable cloud applications and enterprise software solutions.'
),

(
    'EMP012',
    'Meena Joshi',
    45,
    3,
    240,
    115000.50,
    9.5,
    97.34567,
    106,
    'ACTIVE',
    'JAVA,PYTHON,MYSQL,AWS',
    'FEMALE',
    '1981-05-30',
    '2008-02-10',
    '08:35:00',
    '2008-01-15 10:00:00',
    1981,
    TRUE,
    'Senior manager',
    'Senior technology manager with extensive leadership experience.',
    'Completed management, cloud and database training.',
    'Meena manages technology projects and leads multiple software development teams.'
),

(
    'EMP013',
    'Arjun Malhotra',
    52,
    2,
    300,
    150000.75,
    9.9,
    99.87654,
    107,
    'RESIGNED',
    'JAVA,MYSQL,AWS',
    'MALE',
    '1974-03-11',
    '2000-06-15',
    '08:30:00',
    '2000-05-20 09:00:00',
    1974,
    FALSE,
    'Resigned employee',
    'Former senior architect with extensive industry experience.',
    'Completed advanced architecture and leadership programs.',
    'Arjun has extensive experience in software architecture and enterprise technology.'
),

(
    'EMP014',
    'Kavita Rao',
    34,
    1,
    96,
    83500.25,
    8.8,
    93.23456,
    103,
    'ACTIVE',
    'PYTHON,MYSQL,REACT',
    'FEMALE',
    '1992-07-08',
    '2018-11-01',
    '09:05:00',
    '2018-10-10 13:00:00',
    1992,
    TRUE,
    'Experienced developer',
    'Full stack developer working on business applications.',
    'Completed Python, React and database training.',
    'Kavita develops full stack applications and works closely with database teams.'
),

(
    'EMP015',
    'Manish Kumar',
    30,
    1,
    66,
    69500.50,
    8.6,
    91.87654,
    101,
    'ACTIVE',
    'JAVA,PYTHON,MYSQL',
    'OTHER',
    '1996-12-19',
    '2020-03-10',
    '09:12:00',
    '2020-02-15 11:00:00',
    1996,
    TRUE,
    'Good developer',
    'Software engineer working on backend systems.',
    'Completed Java, Python and SQL training.',
    'Manish develops backend services and supports database-driven applications.'
);


-- ============================================================
-- VERIFY EMPLOYEE DATA
-- ============================================================

SELECT * FROM employees;


-- ============================================================
-- PART 4: TIMESTAMP REQUIREMENT
-- ============================================================

-- Check created_at and updated_at

SELECT employee_id,
       employee_name,
       created_at,
       updated_at
FROM employees
WHERE employee_id = 1;


-- Update employee name

UPDATE employees
SET employee_name = 'Rahul Sharma Updated'
WHERE employee_id = 1;


-- Check timestamps again

SELECT employee_id,
       employee_name,
       created_at,
       updated_at
FROM employees
WHERE employee_id = 1;


-- created_at should remain unchanged.
-- updated_at should be updated automatically.


-- ============================================================
-- PART 5: DDL OPERATIONS
-- ============================================================

-- Add phone_number

ALTER TABLE employees
ADD phone_number VARCHAR(15);


-- Add email

ALTER TABLE employees
ADD email VARCHAR(100);


-- Modify employee_name size

ALTER TABLE employees
MODIFY employee_name VARCHAR(150);


-- Modify employee_code size

ALTER TABLE employees
MODIFY employee_code CHAR(8);


-- Rename short_note to employee_note

ALTER TABLE employees
RENAME COLUMN short_note TO employee_note;


-- Drop email

ALTER TABLE employees
DROP COLUMN email;


-- Drop phone_number

ALTER TABLE employees
DROP COLUMN phone_number;


-- Verify structure

DESC employees;


-- ============================================================
-- AUTO_INCREMENT USING ALTER
-- ============================================================

CREATE TABLE employee_documents (
    document_id INT,
    employee_id INT,
    document_name VARCHAR(100),
    document_type VARCHAR(50)
);


-- Make document_id AUTO_INCREMENT using ALTER

ALTER TABLE employee_documents
MODIFY document_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY;


DESC employee_documents;


-- ============================================================
-- CREATE TABLE AS SELECT
-- ============================================================

CREATE TABLE employee_backup AS
SELECT * FROM employees;


-- Verify backup

SELECT * FROM employee_backup;


-- ============================================================
-- TRUNCATE
-- ============================================================

CREATE TABLE employee_test (
    test_id INT AUTO_INCREMENT PRIMARY KEY,
    test_name VARCHAR(100),
    test_status VARCHAR(30)
);


-- Insert test records

INSERT INTO employee_test
(test_name, test_status)
VALUES
('Test Employee 1', 'ACTIVE'),
('Test Employee 2', 'INACTIVE'),
('Test Employee 3', 'ACTIVE');


-- Display records before TRUNCATE

SELECT * FROM employee_test;


-- Truncate table

TRUNCATE TABLE employee_test;


-- Display records after TRUNCATE

SELECT * FROM employee_test;


-- Verify table still exists

SHOW TABLES;


-- ============================================================
-- DROP
-- ============================================================

DROP TABLE employee_test;

DROP TABLE employee_documents;


-- Verify remaining tables

SHOW TABLES;


-- ============================================================
-- PART 6: VERIFICATION
-- ============================================================

SHOW DATABASES;

SHOW TABLES;

DESC employees;

SHOW CREATE TABLE employees;