Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 14
Server version: 8.0.46 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database functions;
Query OK, 1 row affected (0.02 sec)

mysql> use functions;
Database changed
mysql> create table employee_string(emp_id      INT     PRIMARY KEY, AUTO_INCREMENT
    -> emp_name VARCHAR(50)     NOT NULL
    -> email    VARCHAR(100)    NOT NULL
    -> department       VARCHAR(30)     NOT NULL
    -> designation      VARCHAR(50)     NOT NULL
    -> city     VARCHAR(30)     NOT NULL
    -> phone    VARCHAR(15)     NOT NULL
    -> DATA^C
mysql> CREATE TABLE employee_string (emp_id INT PRIMARY KEY AUTO_INCREMENT, emp_name VARCHAR(50) NOT NULL, email VARCHAR(100) NOT NULL, department VARCHAR(30) NOT NULL, designation VARCHAR(50) NOT NULL, city VARCHAR(30) NOT NULL, phone VARCHAR(15) NOT NULL);
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO employee_string (emp_name, email, department, designation, city, phone) VALUES ('  Rahul Sharma  ', 'rahul.sharma@gmail.com', 'it', 'software developer', 'Indore', '9876543210'), ('Priya Verma', 'priya.verma@yahoo.com', 'hr', 'hr executive', 'Bhopal', '9876501234'), ('  Amit Patel', 'amit.patel@gmail.com', 'finance', 'account executive', 'Indore', '9123456780'), ('Neha Singh  ', 'neha.singh@company.com', 'marketing', 'marketing manager', 'Mumbai', '9988776655'), ('Rohit Jain', 'rohit.jain@gmail.com', 'it', 'team leader', 'Pune', '9090909090'), ('  Sneha Gupta ', 'sneha.gupta@yahoo.com', 'sales', 'sales executive', 'Delhi', '9012345678'), ('Vikas Yadav', 'vikas.yadav@gmail.com', 'finance', 'senior accountant', 'Jaipur', '9345678901'), ('Anjali Mehta', 'anjali.mehta@company.com', 'hr', 'hr manager', 'Indore', '9765432109'), ('  Karan Joshi  ', 'karan.joshi@gmail.com', 'it', 'database administrator', 'Bhopal', '8899776655'), ('Meena Kapoor', 'meena.kapoor@yahoo.com', 'sales', 'sales manager', 'Mumbai', '9001122334');
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> select * from employee_string;
+--------+------------------+--------------------------+------------+------------------------+--------+------------+
| emp_id | emp_name         | email                    | department | designation            | city   | phone      |
+--------+------------------+--------------------------+------------+------------------------+--------+------------+
|      1 |   Rahul Sharma   | rahul.sharma@gmail.com   | it         | software developer     | Indore | 9876543210 |
|      2 | Priya Verma      | priya.verma@yahoo.com    | hr         | hr executive           | Bhopal | 9876501234 |
|      3 |   Amit Patel     | amit.patel@gmail.com     | finance    | account executive      | Indore | 9123456780 |
|      4 | Neha Singh       | neha.singh@company.com   | marketing  | marketing manager      | Mumbai | 9988776655 |
|      5 | Rohit Jain       | rohit.jain@gmail.com     | it         | team leader            | Pune   | 9090909090 |
|      6 |   Sneha Gupta    | sneha.gupta@yahoo.com    | sales      | sales executive        | Delhi  | 9012345678 |
|      7 | Vikas Yadav      | vikas.yadav@gmail.com    | finance    | senior accountant      | Jaipur | 9345678901 |
|      8 | Anjali Mehta     | anjali.mehta@company.com | hr         | hr manager             | Indore | 9765432109 |
|      9 |   Karan Joshi    | karan.joshi@gmail.com    | it         | database administrator | Bhopal | 8899776655 |
|     10 | Meena Kapoor     | meena.kapoor@yahoo.com   | sales      | sales manager          | Mumbai | 90011
+------
mysql> select upper(emp_name) as employee_name from employee_string;
+------------------+
| employee_name    |
+------------------+
|   RAHUL SHARMA   |
| PRIYA VERMA      |
|   AMIT PATEL     |
| NEHA SINGH       |
| ROHIT JAIN       |
|   SNEHA GUPTA    |
| VIKAS YADAV      |
| ANJALI MEHTA     |
|   KARAN JOSHI    |
| MEENA KAPOOR     |
+------------------+
10 rows in set (0.00 sec)

mysql> select lower(emp_name) as employee_name from employee_string;
+------------------+
| employee_name    |
+------------------+
|   rahul sharma   |
| priya verma      |
|   amit patel     |
| neha singh       |
| rohit jain       |
|   sneha gupta    |
| vikas yadav      |
| anjali mehta     |
|   karan joshi    |
| meena kapoor     |
+------------------+
10 rows in set (0.00 sec)

mysql> select length(emp_name) as name_length from employee_string;
+-------------+
| name_length |
+-------------+
|          16 |
|          11 |
|          12 |
|          12 |
|          10 |
|          14 |
|          11 |
|          12 |
|          15 |
|          12 |
+-------------+
10 rows in set (0.00 sec)

mysql> select concat('Employee : ',trim(emp_name)) as employee from employee_string;
+-------------------------+
| employee                |
+-------------------------+
| Employee : Rahul Sharma |
| Employee : Priya Verma  |
| Employee : Amit Patel   |
| Employee : Neha Singh   |
| Employee : Rohit Jain   |
| Employee : Sneha Gupta  |
| Employee : Vikas Yadav  |
| Employee : Anjali Mehta |
| Employee : Karan Joshi  |
| Employee : Meena Kapoor |
+-------------------------+
10 rows in set (0.00 sec)

mysql> select emp_name ,left(emp_name) as employee_first_5_character from employee_string;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ') as employee_first_5_character from employee_string' at line 1
mysql> select emp_name ,left(emp_name,5) as employee_first_5_character from employee_string;
+------------------+----------------------------+
| emp_name         | employee_first_5_character |
+------------------+----------------------------+
|   Rahul Sharma   |   Rah                      |
| Priya Verma      | Priya                      |
|   Amit Patel     |   Ami                      |
| Neha Singh       | Neha                       |
| Rohit Jain       | Rohit                      |
|   Sneha Gupta    |   Sne                      |
| Vikas Yadav      | Vikas                      |
| Anjali Mehta     | Anjal                      |
|   Karan Joshi    |   Kar                      |
| Meena Kapoor     | Meena                      |
+------------------+----------------------------+
10 rows in set (0.00 sec)

mysql> select emp_name, trim(emp_name) as employee_name from employee_string;
+------------------+---------------+
| emp_name         | employee_name |
+------------------+---------------+
|   Rahul Sharma   | Rahul Sharma  |
| Priya Verma      | Priya Verma   |
|   Amit Patel     | Amit Patel    |
| Neha Singh       | Neha Singh    |
| Rohit Jain       | Rohit Jain    |
|   Sneha Gupta    | Sneha Gupta   |
| Vikas Yadav      | Vikas Yadav   |
| Anjali Mehta     | Anjali Mehta  |
|   Karan Joshi    | Karan Joshi   |
| Meena Kapoor     | Meena Kapoor  |
+------------------+---------------+
10 rows in set (0.00 sec)

mysql> select replace(email,'@gmail.com','@company.com') as email from employee_string;
+--------------------------+
| email                    |
+--------------------------+
| rahul.sharma@company.com |
| priya.verma@yahoo.com    |
| amit.patel@company.com   |
| neha.singh@company.com   |
| rohit.jain@company.com   |
| sneha.gupta@yahoo.com    |
| vikas.yadav@company.com  |
| anjali.mehta@company.com |
| karan.joshi@company.com  |
| meena.kapoor@yahoo.com   |
+--------------------------+
10 rows in set (0.00 sec)

mysql> select emp_name ,upper(left(trim(emp_name),3)) as employee_code from employee_string;
+------------------+---------------+
| emp_name         | employee_code |
+------------------+---------------+
|   Rahul Sharma   | RAH           |
| Priya Verma      | PRI           |
|   Amit Patel     | AMI           |
| Neha Singh       | NEH           |
| Rohit Jain       | ROH           |
|   Sneha Gupta    | SNE           |
| Vikas Yadav      | VIK           |
| Anjali Mehta     | ANJ           |
|   Karan Joshi    | KAR           |
| Meena Kapoor     | MEE           |
+------------------+---------------+
10 rows in set (0.00 sec)

mysql> select emp_name, right(phone,4) as last_digit from employee_string;
+------------------+------------+
| emp_name         | last_digit |
+------------------+------------+
|   Rahul Sharma   | 3210       |
| Priya Verma      | 1234       |
|   Amit Patel     | 6780       |
| Neha Singh       | 6655       |
| Rohit Jain       | 9090       |
|   Sneha Gupta    | 5678       |
| Vikas Yadav      | 8901       |
| Anjali Mehta     | 2109       |
|   Karan Joshi    | 6655       |
| Meena Kapoor     | 2334       |
+------------------+------------+
10 rows in set (0.00 sec)

mysql> select concat(city'-',upper(department)) as location from employee_string;
ERROR 1583 (42000): Incorrect parameters in the call to native function 'concat'
mysql> SELECT CONCAT(city, '-', UPPER(department)) AS location FROM employee_string;
+------------------+
| location         |
+------------------+
| Indore-IT        |
| Bhopal-HR        |
| Indore-FINANCE   |
| Mumbai-MARKETING |
| Pune-IT          |
| Delhi-SALES      |
| Jaipur-FINANCE   |
| Indore-HR        |
| Bhopal-IT        |
| Mumbai-SALES     |
+------------------+
10 rows in set (0.00 sec)

mysql> select emp_name,reverse(trim(emp_name)) as reversed_name from employee_string;
+------------------+---------------+
| emp_name         | reversed_name |
+------------------+---------------+
|   Rahul Sharma   | amrahS luhaR  |
| Priya Verma      | amreV ayirP   |
|   Amit Patel     | letaP timA    |
| Neha Singh       | hgniS aheN    |
| Rohit Jain       | niaJ tihoR    |
|   Sneha Gupta    | atpuG ahenS   |
| Vikas Yadav      | vadaY sakiV   |
| Anjali Mehta     | atheM ilajnA  |
|   Karan Joshi    | ihsoJ naraK   |
| Meena Kapoor     | roopaK aneeM  |
+------------------+---------------+
10 rows in set (0.00 sec)

mysql> select email,instr(email,'@') as at_position from employee_string;
+--------------------------+-------------+
| email                    | at_position |
+--------------------------+-------------+
| rahul.sharma@gmail.com   |          13 |
| priya.verma@yahoo.com    |          12 |
| amit.patel@gmail.com     |          11 |
| neha.singh@company.com   |          11 |
| rohit.jain@gmail.com     |          11 |
| sneha.gupta@yahoo.com    |          12 |
| vikas.yadav@gmail.com    |          12 |
| anjali.mehta@company.com |          13 |
| karan.joshi@gmail.com    |          12 |
| meena.kapoor@yahoo.com   |          13 |
+--------------------------+-------------+
10 rows in set (0.00 sec)

mysql> select concat(upper(emp_name),'-',upper(designation)) as employee_report from employee_string;
+----------------------------------------+
| employee_report                        |
+----------------------------------------+
|   RAHUL SHARMA  -SOFTWARE DEVELOPER    |
| PRIYA VERMA-HR EXECUTIVE               |
|   AMIT PATEL-ACCOUNT EXECUTIVE         |
| NEHA SINGH  -MARKETING MANAGER         |
| ROHIT JAIN-TEAM LEADER                 |
|   SNEHA GUPTA -SALES EXECUTIVE         |
| VIKAS YADAV-SENIOR ACCOUNTANT          |
| ANJALI MEHTA-HR MANAGER                |
|   KARAN JOSHI  -DATABASE ADMINISTRATOR |
| MEENA KAPOOR-SALES MANAGER             |
+----------------------------------------+
10 rows in set (0.00 sec)

mysql> select emp_name, upper(trim(emp_name)) as cleaned_employee_name from employee_string;
+------------------+-----------------------+
| emp_name         | cleaned_employee_name |
+------------------+-----------------------+
|   Rahul Sharma   | RAHUL SHARMA          |
| Priya Verma      | PRIYA VERMA           |
|   Amit Patel     | AMIT PATEL            |
| Neha Singh       | NEHA SINGH            |
| Rohit Jain       | ROHIT JAIN            |
|   Sneha Gupta    | SNEHA GUPTA           |
| Vikas Yadav      | VIKAS YADAV           |
| Anjali Mehta     | ANJALI MEHTA          |
|   Karan Joshi    | KARAN JOSHI           |
| Meena Kapoor     | MEENA KAPOOR          |
+------------------+-----------------------+
10 rows in set (0.00 sec)

mysql> select concat(upper(trim(emp_name)),'|',upper(designation),'|',upper(city),'|',right(phone,4)) as employee_summary from employee_string;
+------------------------------------------------+
| employee_summary                               |
+------------------------------------------------+
| RAHUL SHARMA|SOFTWARE DEVELOPER|INDORE|3210    |
| PRIYA VERMA|HR EXECUTIVE|BHOPAL|1234           |
| AMIT PATEL|ACCOUNT EXECUTIVE|INDORE|6780       |
| NEHA SINGH|MARKETING MANAGER|MUMBAI|6655       |
| ROHIT JAIN|TEAM LEADER|PUNE|9090               |
| SNEHA GUPTA|SALES EXECUTIVE|DELHI|5678         |
| VIKAS YADAV|SENIOR ACCOUNTANT|JAIPUR|8901      |
| ANJALI MEHTA|HR MANAGER|INDORE|2109            |
| KARAN JOSHI|DATABASE ADMINISTRATOR|BHOPAL|6655 |
| MEENA KAPOOR|SALES MANAGER|MUMBAI|2334         |
+------------------------------------------------+
10 rows in set (0.00 sec)

mysql>