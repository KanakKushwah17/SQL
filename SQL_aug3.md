# Structured Query Language (SQL)

- Structured Query Language is a standard Query Language used to communicate with relational Database Management System.
- It allows users to create, store, retrieve, update, delete and manage data stored in RDBMS.
- SQL is the bridge between the user and the database.
- User send SQL commands to the DBMS and the DBMS process those commands to perform the requested operations.

#### Applications :

1. ERP Systems
2. Banking System
3. Railway Reservations
4. Hospital Management
5. E-commerce
6. Social Media Platforms etc

# Structured Query Language(SQL)

#### Structured :

Structured means data is organized in some format.(rows and columns)

#### Query :

A request made to the database to perform an operation.

#### Language :

A standard language used to communicate with relational database.

# Features of SQL

1. It is an international standard language supported by almost all relational database.
2. **Easy to learn :** SQL has a simple English-like syntax.
3. It supports transactions.
4. It provides data definition, manipulation, retrieval.

# MYSQL

- MySQL is an open source Relational Database Management System that uses structured Query Language to store, manage, retrieve and manipulate data efficiently.
- It stores data in the form of tables consisting of rows and columns and establish relationship between tables using Primary keys and Foreign keys.
- The name MySQL consist of 2 parts (My) and (SQL) named after **My Widenius**, the daughter of MySQL co-founder **Michael Widenius. SQL** stands for **Structured Query Language.**

## WHY MYSQL?

- **Open-source :** MySQL Community Edition is free to download and use.
- Easy to learn.
- **High Performance :** It is optimized for fast data retrieval.
- Efficient Query execution.
- **Cross Platform :** It runs on Windows, Linux, MacOS etc
- Secure.
- **Easy Integration :** MySQL integrates easily with Java, Python, PHP, etc.
- SQL Support.
- Multi User Access.
- Large Community Support.

# SQL vs MySQL

|  | **SQL** | **MySQL** |
| --- | --- | --- |
| **1.** | SQL is a language. | MySQL is a database. |
| **2.** | SQL cannot store data by itself. | MySQL store data in database and tables. |
| **3.** | SQL provides commands such as SELECT, INSERT, UPDATE etc. | MySQL executed SQL commands and returns the result. |
| **4.** | SQL is a standard Language supported by many database systems | MySQL is one specific database system that implement SQL |
| **5.** | SQL does not need installation because it is a language. | MySQL must be installed on a computer or a server before use. |

# History of MySQL

- MySQL was developed in 1995 by MySQLAB by Michael Widenius.
- 2008 - Acquired by SunMicroSystems.
- 2010 - Oracle Corporation acquired SunMicroSystems and became the owner of MySQL.

→ curtime()

→ select user()

→ select database()

→ select @@hostname;

hostname : A hostname is a unique name assigned to a computer or a server on a network so that it can be identified and accessed

→ select @@port;

port : Port is a system variable which returns the port number on which the mysql server is listening for incoming client connection

**NOTE : Whenever any application wants to connect with MySQL then we need connection details like Host**(currently LocalHost)**, port**(currently 3306)**, username** (currently root)**, password** (currently root)**, database** (currently university)

→ select 20%2;

→ select pow(2,5)

→ select sqrt(144)

→ SELECT RAND( )

→ 

# Types of SQL Languages

- SQL consist of different categories of commands
- Each category is designed to perform specific type of operations on a Database such as creating database objects manipulating data retrieving information, managing user permissions and controlling transactions.
1. DDL → Data Definition Language
2. DML → Data Manipulation Language
3. DQL → Data Query Language
4. TCL → Transaction Control Language

## DDL

- It is used to define, create, modify, and delete the structure of database object.
- DDL command deals with structure of the object.
- Index, View, store procedure, trigger, function
- DDL commands interact with the database directly.
- DDL commands enforce an implicit commit before and after the commit.
- In DDL Commands, we cannot undo (rollback) the changes
- DDL commands are faster than other commands.
- Example of DDL Commands: CREATE, ALTER, DROP, TRUNCATE, RENAME, etc

## DML

- DATA MANIPULATION LANGUAGE
- Deals only with data.
- These commands interact with the buffer first, then with the database.
- We can undo or roll back changes.
- They are slower than DDL commands.
- They are used to manipulate the data stored in database tables.
- They do not create or modify the table structure.
- EXAMPLES: INSERT, UPDATE, DELETE, etc.

## DQL

- DATA QUERY LANGUAGE
- It is a subset of SQL that is used to retrieve(fetch) data from one or more database tables.
- It allows users to view, search, filter Data.
- EXAMPLE :- SELECT

## TCL

- TRANSACTION CONTROL LANGUAGE
- It is a category of SQL and used to manage transactions in a database.
- A TRANSACTION is sequence of one or more SQL statements that are treated as a single unit of work.
- A set of DML OPERATIONS with commit or rollback is called TRANSACTION.
- Every TRANSACTION will start with DML operations and commit, or rollback is an ending point to these transactions.
- This commit maybe implicit or explicit.
- EXAMPLE: - BEGIN, COMMIT, ROLLBACK, SAVEPOINT, SETTRANSACTION

1.  Check MySQL Version

```sql
SELECT VERSION();  
#Explanation:
#Returns the installed MySQL server version.

#Output:
+-------------------------+
| version()               |
+-------------------------+
| 8.0.46-0ubuntu0.24.04.3 |
+-------------------------+
```

1. Current Date and Time

```sql
#Query:
SELECT NOW();

#Explanation:
#Returns the current system date and time.

#Output:
+---------------------+
| now()               |
+---------------------+
| 2026-08-06 10:20:01 |
+---------------------+
```

1. Current Time

```sql
Query:
SELECT CURTIME();

Explanation:
Returns only the current time.

Output:
+-----------+
| curtime() |
+-----------+
| 10:20:32  |
+-----------+

```

1. Current Logged-in User (Wrong)

```sql
Query:
SELECT USER;

Explanation:
ERROR because USER is treated as a column name.

Output:
ERROR 1054 (42S22): Unknown column 'user' in 'field list'
```

1. Current Logged-in User (Correct)

```sql
Query:
SELECT USER();

Explanation:
Returns the current MySQL user and host.

Output:
+----------------+
| user()         |
+----------------+
| root@localhost |
+----------------+
```

1.  Current Database

```sql
Query:
SELECT DATABASE();

Explanation:
Returns the currently selected database.

Output:
+------------+
| database() |
+------------+
| NULL       |
+------------+

Note:
NULL means no database is selected.
```

1.  Show All Databases

```sql
Query:
SHOW DATABASES;

Explanation:
Displays all databases in MySQL.

Output:
+--------------------+
| Database           |
+--------------------+
| Bank               |
| DBMS               |
| Students           |
| attendance_db1     |
| cricket            |
| db1                |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| sys                |
+--------------------+
```

1. Hostname

```sql
Query:
SELECT @@hostname;

Explanation:
Returns the name of the computer running MySQL.

Output:
+------------+
| @@hostname |
+------------+
| kanak      |
+------------+

```

1. MySQL Port Number

```sql
Query:
SELECT @@port;

Explanation:
Returns the port number used by MySQL.

Output:
+--------+
| @@port |
+--------+
|   3306 |
+--------+
```

1. Password Variable (Wrong)

```sql
Query:
SELECT @@password;

Explanation:
ERROR because this system variable does not exist.

Output:
ERROR 1193 (HY000): Unknown system variable 'password'
```

1. Addition

```sql
Query:
SELECT 10+20;

Explanation:
Adds two numbers.

Output:
+-------+
| 10+20 |
+-------+
|    30 |
+-------+
```

1. Modulus (%)

```sql
Query:
SELECT 20%2;

Explanation:
Returns the remainder after division.

Output:
+------+
| 20%2 |
+------+
|    0 |
+------+
```

1. Square Root

```sql
Query:
SELECT SQRT(10);

Explanation:
Returns the square root of a number.

Output:
+--------------------+
| sqrt(10)           |
+--------------------+
| 3.1622776601683795 |
+--------------------+
```

1. Wrong Function Name

```sql
Query:
SELECT PW(2,5);

Explanation:
ERROR because PW() is not a valid MySQL function.

Output:
ERROR 1046 (3D000): No database selected

Note:
The intended function is POW(). The error shown is because MySQL interpreted PW as something else while no database was selected.
```

1. Power Function

```sql
Query:
SELECT POW(2,5);

Explanation:
Returns 2 raised to the power of 5.

Output:
+----------+
| pow(2,5) |
+----------+
|       32 |
+----------+

```

1.  Random Number (Seed = 10)

```sql
Query:
SELECT RAND(10);

Explanation:
Returns a random number based on seed value 10.

Output:
+--------------------+
| rand(10)           |
+--------------------+
| 0.6570515219653505 |
+--------------------+
```

1. Random Number (Seed = 100)

```sql
Query:
SELECT RAND(100);

Explanation:
Returns the same random number every time because the seed is fixed.

Output:
+---------------------+
| rand(100)           |
+---------------------+
| 0.17353134804734155 |
+---------------------+
```

1. Same seed again

```sql
Query:
SELECT RAND(100);

Explanation:
Same seed produces the same random number.

Output:
+---------------------+
| rand(100)           |
+---------------------+
| 0.17353134804734155 |
+---------------------+
```

1. Random Number (Seed = 1)

```sql
Query:
SELECT RAND(1);

Explanation:
Returns a random number based on seed value 1.

Output:
+---------------------+
| rand(1)             |
+---------------------+
| 0.40540353712197724 |
+---------------------+
```

1. Same seed Again

```sql
Query:
SELECT RAND(1);

Explanation:
Same seed gives the same random number again.

Output:
+---------------------+
| rand(1)             |
+---------------------+
| 0.40540353712197724 |
```

## MYSQL DATABASE, TABLE & DATA BASICS

1. LOGIN TO MYSQL

```sql
Command:  mysql -u root -p

Explanation:
Logs into MySQL using the root user and password.

Output:
Welcome to the MySQL monitor.
Server version: 8.0.46-0ubuntu0.24.04.3 (Ubuntu)
```

### DATABASE CREATION

1. CREATE DATABASE

```sql
Query:
CREATE DATABASE batch18;

Explanation:
Creates a new database named batch18.

Output:
Query OK, 1 row affected (1.30 sec)
```

1. SHOW DATABASES

```sql
Query:
SHOW DATABASES;

Explanation:
Displays all databases available in MySQL.

Output:
+--------------------+
| Database           |
+--------------------+
| Bank               |
| DBMS               |
| Students           |
| attendance_db1     |
| batch18            |
| cricket            |
| db1                |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| sys                |
+--------------------+
12 rows in set (0.09 sec)
```

1. CREATE EXISTING DATABASE

```sql
Query:
CREATE DATABASE batch18;

Explanation:
Gives an error because batch18 already exists.

Output:
ERROR 1007 (HY000): Can't create database 'batch18'; database exists
```

1. CREATE DATABASE IF NOT EXISTS

```sql
Query:
CREATE DATABASE IF NOT EXISTS batch18;

Explanation:
Creates the database only if it does not already exist.

Output:
Query OK, 1 row affected, 1 warning (0.18 sec)

Note:
The warning occurs because batch18 already exists.
```

1. SELECT DATABASE

```sql
Query:
USE batch18;

Explanation:
Selects batch18 as the current database.

Output:
Database changed
```

1. WRONG DATABASE SYNTAX

```sql
Query:
SELECT @DATABASE();

Explanation:
Incorrect syntax because DATABASE() is a function.

Output:
ERROR 1064 (42000): You have an error in your SQL syntax;
```

1. WRONG @@DATABASE SYNTAX

```sql
Query:
SELECT @@DATABASE();

Explanation:
Incorrect syntax because DATABASE() is not used with @@.

Output:
ERROR 1064 (42000): You have an error in your SQL syntax;
```

1. CHECK CURRENT DATABASE

```sql
Query:
SELECT DATABASE();

Explanation:
Shows the currently selected database.

Output:
+------------+
| database() |
+------------+
| batch18    |
+------------+
```

1. CREATE ANOTHER DATABASE

```sql
Query:
CREATE DATABASE newone;

Explanation:
Creates a new database named newone.

Output:
Query OK, 1 row affected (0.24 sec)
```

1. USE NEWONE

```sql
Query:
USE newone;

Explanation:
Selects newone as the current database.

Output:
Database changed
```

1. CHECK CURRENT DATABASE

```sql
Query:
SELECT DATABASE();

Explanation:
Shows the currently selected database.

Output:
+------------+
| database() |
+------------+
| newone     |
+------------+
```

1. DROP DATABASE

```sql
Query:
DROP DATABASE newone;

Explanation:
Permanently deletes the newone database.

Output:
Query OK, 0 rows affected (1.25 sec)
```

1. USE NON-EXISTING DATABASE

```sql
Query:
USE batck18;

Explanation:
Gives an error because batck18 does not exist.

Output:
ERROR 1049 (42000): Unknown database 'batck18'

```

1. USE CORRECT DATABASE

```sql
Query:
USE batch18;

Explanation:
Selects the existing batch18 database.

Output:
Database changed
```

1. DROP DATABASE IF EXISTS

```sql
Query:
DROP DATABASE IF EXISTS newone;

Explanation:
Deletes newone if it exists and avoids an error if it does not exist.

Output:
Query OK, 0 rows affected, 1 warning (0.07 sec)
```

### TABLE CREATION

1.  CREATE STUDENT TABLE

```sql
Query:
CREATE TABLE student(
    id INT,
    name VARCHAR(20),
    age INT
);

Explanation:
Creates a student table with id, name and age columns.

Output:
Query OK, 0 rows affected (7.56 sec)
```

1.  DESCRIBE TABLE

```sql
Query:
DESC student;

Explanation:
Shows the structure of the student table.

Output:
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int         | YES  |     | NULL    |       |
| name  | varchar(20) | YES  |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
```

1. SHOW TABLES

```sql
Query:
SHOW TABLES;

Explanation:
Displays all tables in the current database.

Output:
+-------------------+
| Tables_in_batch18 |
+-------------------+
| student           |
+-------------------+

```

1. CREATE TABLE A

```sql
Query:
CREATE TABLE A(A INT);

Explanation:
Creates a table named A with one integer column named A.

Output:
Query OK, 0 rows affected (2.15 sec)
```

1. DESCRIBE TABLE A

```sql
Query:
DESC A;

Explanation:
Shows the structure of table A.

Output:
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| A     | int  | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
```

1. SHOW TABLES

```sql
Query:
SHOW TABLES;

Explanation:
Displays all tables in batch18.

Output:
+-------------------+
| Tables_in_batch18 |
+-------------------+
| A                 |
| student           |
+-------------------+

```

### SELECT DATA

1. SELECT ALL DATA FROM STUDENT

```sql
Query:
SELECT * FROM student;

Explanation:
Displays all columns and all rows from student.

Output:
Empty set (0.07 sec)

Note:
The table exists, but no data has been inserted.
```

1. SELECT TABLE USING WRONG CASE

```sql
Query:
SELECT * FROM a;

Explanation:
Gives an error because the actual table name is A.

Output:
ERROR 1146 (42S02): Table 'batch18.a' doesn't exist
```

1. SELECT TABLE A

```sql
Query:
SELECT * FROM A;

Explanation:
Displays all data from table A.

Output:
Empty set (0.02 sec)
```

### PRIMARY KEY

1. CREATE STUDENT1 TABLE

```sql
Query:
CREATE TABLE student1(
    id INT PRIMARY KEY,
    name VARCHAR(20),
    age INT
);

Explanation:
Creates student1 with id as the PRIMARY KEY.

Output:
Query OK, 0 rows affected (1.47 sec)
```

### PRIMARY KEY :

- A PRIMARY KEY uniquely identifies each row in a table.

#### IMPORTANT POINTS:

- PRIMARY KEY must contain UNIQUE values.
- PRIMARY KEY cannot contain NULL.
- A table can have only one PRIMARY KEY.
- PRIMARY KEY uniquely identifies every record.

### CREATE TABLE AS SELECT

1. CREATE EMPLOYEE FROM STUDENT 

```sql
Query:
CREATE TABLE employee AS SELECT * FROM student;

Explanation:
Creates employee table with the same columns and copies all data from student.

Output:
Query OK, 0 rows affected (1.83 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

1. DESCRIBE EMPLOYEE

```sql
Query:
DESC employee;

Explanation:
Shows the structure of the employee table.

Output:
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int         | YES  |     | NULL    |       |
| name  | varchar(20) | YES  |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
```

1. SHOW TABLES

```sql
Query:
SHOW TABLES;

Explanation:
Shows all tables currently present in batch18.

Output:
+-------------------+
| Tables_in_batch18 |
+-------------------+
| A                 |
| employee          |
| student           |
| student1          |
+-------------------+
```

1. CREATE TABLE WITH SELECTED COLUMNS

```sql
Query:
CREATE TABLE emp2 AS SELECT id,name FROM student;

Explanation:
Creates emp2 using only the id and name columns from student.

Output:
Query OK, 0 rows affected (1.38 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

1. DESCRIBE EMP2

```sql
Query:
DESC emp2;

Explanation:
Shows the structure of emp2.

Output:
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int         | YES  |     | NULL    |       |
| name  | varchar(20) | YES  |     | NULL    |       |
```

### CREATE TABLE WITHOUT DATA

1. CREATE EMP3 WITHOUT DATA

```sql

Query:
CREATE TABLE emp3 AS SELECT * FROM student WHERE 1=2;

Explanation:
Creates emp3 with the same structure as student but copies no records.

Output:
Query OK, 0 rows affected (1.67 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

#### Important:

WHERE 1=2

→ 1=2 is always FALSE.

Therefore:
No rows are copied.

But:
The table structure is created.

### INSERT DATA

1. INSERT RECORD INTO STUDENT

```sql
Query:
INSERT INTO student VALUES(101,"Anil",30);

Explanation:
Inserts one student record into the student table.

Output:
Query OK, 1 row affected (0.17 sec)
```

1. WRONG SELECT KEYWORD

```sql
Query:
SELECT * FORM student;

Explanation:
Gives an error because FORM is incorrect; the correct keyword is FROM.

Output:
ERROR 1064 (42000): You have an error in your SQL syntax;
```

1. WRONG SELECT ON STUDENT1

```sql
Query:
SELECT * FORM student1;

Explanation:
Again gives an error because FORM should be FROM.

Output:
ERROR 1064 (42000): You have an error in your SQL syntax;
```

1. SELECT STUDENT1

```sql
Query:
SELECT * FROM student1;

Explanation:
Displays all records from student1.

Output:
Empty set (0.06 sec)

Note:
student1 has no records yet.
```

1. SELECT STUDENT

```sql
Query:
SELECT * FROM student;

Explanation:
Displays all records from student.

Output:
+------+------+------+
| id   | name | age  |
+------+------+------+
|  101 | Anil |   30 |
+------+------+------+
1 row in set (0.00 sec
```

### COPY TABLE WITHOUT DATA

1. CREATE COPY1 WITHOUT DATA

```sql
Query:
CREATE TABLE copy1 AS SELECT * FROM student WHERE 1=2;

Explanation:
Creates copy1 with the same columns as student but without copying data.

Output:
Query OK, 0 rows affected (2.08 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

1. CHECK COPY1

```sql
Query:
SELECT * FROM copy1;

Explanation:
Displays data from copy1.

Output:
Empty set (0.00 sec)

Reason:
WHERE 1=2 prevented the rows from being copied.
```

### COPY TABLE WITH DATA

1. CREATE COPY2 WITH DATA

```sql
Query:
CREATE TABLE copy2 AS SELECT * FROM student;

Explanation:
Creates copy2 with the same columns and copies all data from student.

Output:
Query OK, 1 row affected (1.98 sec)
Records: 1  Duplicates: 0  Warnings: 0
```

1. CHECK COPY2

```sql
Query:
SELECT * FROM copy2;

Explanation:
Displays the copied data from copy2.

Output:
+------+------+------+
| id   | name | age  |
+------+------+------+
|  101 | Anil |   30 |
+------+------+------+
1 row in set (0.00 sec)
```

# IMPORTANT CONCEPT

CREATE TABLE new table AS SELECT …

- This is called:

                         CTAS
                           (Create Table as Select)

- Example 1:

```sql
CREATE TABLE employee AS SELECT * FROM student;
```

- Example 3:

```sql
CREATE TABLE emp2 AS SELECT id,name FROM student;
```

- Example 4:

```sql
CREATE TABLE copy2 AS SELECT * FROM student;
```

### CTAS QUICK COMPARISON

Command:

```sql
CREATE TABLE employee AS SELECT * FROM student;
#o/p : Structure + Data
```

Command :

```sql
CREATE TABLE emp2 AS SELECT id,name FROM student;
#o/p:Selected Columns + Data
```

Command:

```sql
CREATE TABLE copy1 AS SELECT * FROM student WHERE 1=2;
#O/p: Structure Only 
```

Command:

```sql
CREATE TABLE copy2 AS SELECT * FROM student;
#o/p:Structure + Data 
```

### IMPORTANT COMMANDS

```sql
CREATE DATABASE database_name;
```

```sql
SHOW DATABASES;
```

```sql
USE database_name;
```

```sql
SELECT DATABASE();
```

```sql

DROP DATABASE database_name;
```

```sql
CREATE TABLE table_name(...);
```

```sql

DESC table_name;
```

```sql
SHOW TABLES;
```

```sql
SELECT * FROM table_name;
```

```sql
INSERT INTO table_name VALUES(...);
```

### PRIMARY KEY

- Uniquely identifies each row.

```sql
CREATE TABLE new_table AS SELECT ...
```

WHERE 1=2

→ Always FALSE, so no records are copied.

### IMPORTANT ERRORS FROM YOUR PRACTICE

1.  Database already exists:

```sql
CREATE DATABASE batch18;
```

ERROR 1007:
Database exists.

1. Wrong database name:

```sql
USE batck18;
```

ERROR 1049:
Unknown database.

1. Wrong DATABASE syntax:

```sql
SELECT @DATABASE();
```

ERROR 1064:
Syntax error.

1. Wrong table name/case:

```sql
SELECT * FROM a;
```

ERROR 1146:
Table 'batch18.a' doesn't exist.

1. Wrong keyword:

```sql
SELECT * FORM student;
```

ERROR 1064:
Syntax error.

Correct:
SELECT * FROM student;

---

### CURRENT DATABASE

batch18

---

### CURRENT TABLES

A
employee
emp2
emp3
copy1
copy2
student
student1

- **Which databases use SQL?**

MySQL, PostgreSQL, Oracle

- **Is SQL**

- **Is SQL a software?**

No, It is not a software but a language.

- **Data will be stored in SQL or MySQL?**

MySQL