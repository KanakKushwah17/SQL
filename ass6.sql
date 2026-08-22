-- ============================================================
-- ASSIGNMENT 2 - LIBRARY MANAGEMENT SYSTEM
-- ============================================================

-- ============================================================
-- CREATE DATABASE
-- ============================================================

CREATE DATABASE library_management;

USE library_management;


-- ============================================================
-- TABLE 1: BOOKS
-- ============================================================

CREATE TABLE books (

    book_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,

    book_title VARCHAR(150) NOT NULL,

    author_name VARCHAR(100) NOT NULL,

    isbn VARCHAR(20) UNIQUE NOT NULL,

    price DECIMAL(8,2) UNSIGNED NOT NULL,

    available_copies SMALLINT UNSIGNED DEFAULT 0,

    category ENUM(
        'FICTION',
        'SCIENCE',
        'TECHNOLOGY',
        'HISTORY',
        'BIOGRAPHY',
        'EDUCATION'
    ),

    publication_date DATE,

    is_available BOOLEAN DEFAULT TRUE,

    description TEXT
);


-- ============================================================
-- INSERT 10 BOOKS
-- ============================================================

INSERT INTO books
(
    book_title,
    author_name,
    isbn,
    price,
    available_copies,
    category,
    publication_date,
    is_available,
    description
)
VALUES

(
    'The Alchemist',
    'Paulo Coelho',
    '9780061122415',
    450.00,
    5,
    'FICTION',
    '1988-01-01',
    TRUE,
    'A philosophical novel about following dreams.'
),

(
    'Atomic Habits',
    'James Clear',
    '9780735211292',
    550.00,
    8,
    'EDUCATION',
    '2018-10-16',
    TRUE,
    'A practical guide to building good habits.'
),

(
    'Clean Code',
    'Robert C. Martin',
    '9780132350884',
    750.00,
    4,
    'TECHNOLOGY',
    '2008-08-01',
    TRUE,
    'A guide to writing clean and maintainable software.'
),

(
    'The Pragmatic Programmer',
    'Andrew Hunt',
    '9780135957059',
    850.00,
    6,
    'TECHNOLOGY',
    '1999-10-20',
    TRUE,
    'Programming practices for professional developers.'
),

(
    'Wings of Fire',
    'A.P.J. Abdul Kalam',
    '9788173711466',
    350.00,
    10,
    'BIOGRAPHY',
    '1999-01-01',
    TRUE,
    'Autobiography of Dr. A.P.J. Abdul Kalam.'
),

(
    'A Brief History of Time',
    'Stephen Hawking',
    '9780553380163',
    600.00,
    3,
    'SCIENCE',
    '1988-04-01',
    TRUE,
    'An introduction to cosmology and the universe.'
),

(
    'Sapiens',
    'Yuval Noah Harari',
    '9780062316097',
    700.00,
    7,
    'HISTORY',
    '2011-01-01',
    TRUE,
    'A history of humankind.'
),

(
    'Introduction to Algorithms',
    'Thomas H. Cormen',
    '9780262033848',
    1200.00,
    2,
    'TECHNOLOGY',
    '2009-07-31',
    TRUE,
    'Comprehensive reference for algorithms and data structures.'
),

(
    'The Great Gatsby',
    'F. Scott Fitzgerald',
    '9780743273565',
    400.00,
    5,
    'FICTION',
    '1925-04-10',
    TRUE,
    'A classic American novel.'
),

(
    'India After Gandhi',
    'Ramachandra Guha',
    '9780060958589',
    900.00,
    4,
    'HISTORY',
    '2007-08-15',
    TRUE,
    'A detailed history of independent India.'
);


-- ============================================================
-- TABLE 2: STUDENTS
-- ============================================================

CREATE TABLE students (

    student_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,

    student_name VARCHAR(100) NOT NULL,

    enrollment_number VARCHAR(30) UNIQUE NOT NULL,

    age TINYINT UNSIGNED,

    gender ENUM(
        'MALE',
        'FEMALE',
        'OTHER'
    ),

    date_of_birth DATE,

    contact_number VARCHAR(15),

    email VARCHAR(100) UNIQUE,

    is_active BOOLEAN DEFAULT TRUE,

    registration_date DATE DEFAULT (CURRENT_DATE)
);


-- ============================================================
-- INSERT 10 STUDENTS
-- ============================================================

INSERT INTO students
(
    student_name,
    enrollment_number,
    age,
    gender,
    date_of_birth,
    contact_number,
    email,
    is_active,
    registration_date
)
VALUES

(
    'Rahul Sharma',
    'STU001',
    21,
    'MALE',
    '2005-04-15',
    '9876500001',
    'rahul@student.com',
    TRUE,
    '2025-07-10'
),

(
    'Priya Verma',
    'STU002',
    22,
    'FEMALE',
    '2004-07-21',
    '9876500002',
    'priya@student.com',
    TRUE,
    '2025-07-11'
),

(
    'Amit Singh',
    'STU003',
    20,
    'MALE',
    '2006-02-10',
    '9876500003',
    'amit@student.com',
    TRUE,
    '2025-07-12'
),

(
    'Neha Patel',
    'STU004',
    23,
    'FEMALE',
    '2003-11-05',
    '9876500004',
    'neha@student.com',
    TRUE,
    '2025-07-13'
),

(
    'Rohit Mehta',
    'STU005',
    21,
    'MALE',
    '2005-01-25',
    '9876500005',
    'rohit@student.com',
    TRUE,
    '2025-07-14'
),

(
    'Sneha Jain',
    'STU006',
    22,
    'FEMALE',
    '2004-09-14',
    '9876500006',
    'sneha@student.com',
    TRUE,
    '2025-07-15'
),

(
    'Karan Gupta',
    'STU007',
    20,
    'MALE',
    '2006-06-18',
    '9876500007',
    'karan@student.com',
    TRUE,
    '2025-07-16'
),

(
    'Pooja Mishra',
    'STU008',
    23,
    'FEMALE',
    '2003-03-22',
    '9876500008',
    'pooja@student.com',
    TRUE,
    '2025-07-17'
),

(
    'Ankit Tiwari',
    'STU009',
    21,
    'MALE',
    '2005-12-10',
    '9876500009',
    'ankit@student.com',
    TRUE,
    '2025-07-18'
),

(
    'Riya Kapoor',
    'STU010',
    22,
    'FEMALE',
    '2004-08-16',
    '9876500010',
    'riya@student.com',
    TRUE,
    '2025-07-19'
);


-- ============================================================
-- TABLE 3: BOOK TRANSACTIONS
-- ============================================================

CREATE TABLE book_transactions (

    transaction_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,

    student_id INT UNSIGNED NOT NULL,

    book_id INT UNSIGNED NOT NULL,

    issue_date DATE NOT NULL,

    expected_return_date DATE NOT NULL,

    actual_return_date DATE NULL,

    fine_amount DECIMAL(7,2) UNSIGNED DEFAULT 0.00,

    is_returned BOOLEAN DEFAULT FALSE,

    remarks VARCHAR(255),

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    FOREIGN KEY (book_id)
        REFERENCES books(book_id)
);


-- ============================================================
-- INSERT 15 BOOK ISSUE/RETURN TRANSACTIONS
-- ============================================================

INSERT INTO book_transactions
(
    student_id,
    book_id,
    issue_date,
    expected_return_date,
    actual_return_date,
    fine_amount,
    is_returned,
    remarks
)
VALUES

(1, 1, '2026-01-05', '2026-01-19', '2026-01-18',
 0.00, TRUE, 'Returned on time'),

(2, 2, '2026-01-10', '2026-01-24', '2026-01-28',
 40.00, TRUE, 'Returned late'),

(3, 3, '2026-01-15', '2026-01-29', NULL,
 0.00, FALSE, 'Currently issued'),

(4, 4, '2026-02-01', '2026-02-15', '2026-02-14',
 0.00, TRUE, 'Returned on time'),

(5, 5, '2026-02-05', '2026-02-19', NULL,
 0.00, FALSE, 'Currently issued'),

(6, 6, '2026-02-10', '2026-02-24', '2026-02-25',
 10.00, TRUE, 'Returned one day late'),

(7, 7, '2026-02-15', '2026-03-01', NULL,
 0.00, FALSE, 'Currently issued'),

(8, 8, '2026-02-20', '2026-03-06', '2026-03-05',
 0.00, TRUE, 'Returned on time'),

(9, 9, '2026-03-01', '2026-03-15', NULL,
 0.00, FALSE, 'Currently issued'),

(10, 10, '2026-03-05', '2026-03-19', '2026-03-18',
 0.00, TRUE, 'Returned on time'),

(1, 3, '2026-03-10', '2026-03-24', '2026-03-26',
 20.00, TRUE, 'Returned late'),

(2, 5, '2026-03-15', '2026-03-29', NULL,
 0.00, FALSE, 'Currently issued'),

(3, 7, '2026-04-01', '2026-04-15', '2026-04-14',
 0.00, TRUE, 'Returned on time'),

(4, 9, '2026-04-05', '2026-04-19', NULL,
 0.00, FALSE, 'Currently issued'),

(5, 2, '2026-04-10', '2026-04-24', '2026-04-27',
 30.00, TRUE, 'Returned late');


-- ============================================================
-- VERIFICATION
-- ============================================================

SHOW TABLES;

DESC books;

DESC students;

DESC book_transactions;


-- Display books

SELECT * FROM books;


-- Display students

SELECT * FROM students;


-- Display transactions

SELECT * FROM book_transactions;


-- ============================================================
-- USEFUL JOIN QUERY
-- Shows student name, book title and transaction details
-- ============================================================

SELECT
    bt.transaction_id,
    s.student_name,
    b.book_title,
    bt.issue_date,
    bt.expected_return_date,
    bt.actual_return_date,
    bt.fine_amount,
    bt.is_returned,
    bt.remarks
FROM book_transactions bt
JOIN students s
    ON bt.student_id = s.student_id
JOIN books b
    ON bt.book_id = b.book_id;