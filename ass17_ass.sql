Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 8.0.46 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use dbms;
Database changed
mysql> select * from self_employee;
+-------+----------+-----------+
| empid | empname  | managerid |
+-------+----------+-----------+
|   101 | deepika  |      NULL |
|   102 | thapaji  |       101 |
|   103 | rashmika |       102 |
|   104 | Umesh    |       103 |
|   105 | Abhi     |       105 |
+-------+----------+-----------+
5 rows in set (0.00 sec)

mysql> select e.empname,m.empname from self_employee as e join self_employee as m on e.empid = m.managerid;
+----------+----------+
| empname  | empname  |
+----------+----------+
| deepika  | thapaji  |
| thapaji  | rashmika |
| rashmika | Umesh    |
| Abhi     | Abhi     |
+----------+----------+
4 rows in set (0.00 sec)

mysql> select e.empname,e.empname from self_employee as e join self_employee as m on e.empid = e.managerid;
+---------+---------+
| empname | empname |
+---------+---------+
| Abhi    | Abhi    |
| Abhi    | Abhi    |
| Abhi    | Abhi    |
| Abhi    | Abhi    |
| Abhi    | Abhi    |
+---------+---------+
5 rows in set (0.00 sec)

mysql> select e.empname,m.empname from self_employee as m join self_employee as m on e.empid = e.managerid;
ERROR 1066 (42000): Not unique table/alias: 'm'
mysql> select e.empname,m.empname from self_employee as e join self_employee as m on e.empid = e.managerid;
+---------+----------+
| empname | empname  |
+---------+----------+
| Abhi    | deepika  |
| Abhi    | thapaji  |
| Abhi    | rashmika |
| Abhi    | Umesh    |
| Abhi    | Abhi     |
+---------+----------+
5 rows in set (0.00 sec)

mysql> create database assignment;
Query OK, 1 row affected (0.02 sec)

mysql> use assignment;
Database changed
mysql> create table department(did int unique,dname varchar(20) unique not null);
Query OK, 0 rows affected (0.06 sec)

mysql> create table employee(eid int unique,ename varchar(20) not null,esalary varchar(20) not null, did int,foreign key(did) references department(did)on delete cascade);
Query OK, 0 rows affected (0.06 sec)

mysql> insert into department values(101,'kanak'),(102,'anil'),(103,'harsh');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> truncate department;
ERROR 1701 (42000): Cannot truncate a table referenced in a foreign key constraint (`assignment`.`employee`, CONSTRAINT `employee_ibfk_1`)
mysql> begin;
Query OK, 0 rows affected (0.00 sec)

mysql> update department set dname="CSE" where did = 101;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update department set dname="ML" where did = 102;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update department set dname="Mechanical" where did = 103;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from department;
+------+------------+
| did  | dname      |
+------+------------+
|  101 | CSE        |
|  102 | ML         |
|  103 | Mechanical |
+------+------------+
3 rows in set (0.00 sec)

mysql> select * from employee;
Empty set (0.01 sec)

mysql> insert into employee values(1,'kanak',80000,101);
Query OK, 1 row affected (0.00 sec)

mysql> insert into employee values(2,'Anil',70000,101);
Query OK, 1 row affected (0.00 sec)

mysql> insert into employee values(3,'Harsh',60000,102);
Query OK, 1 row affected (0.00 sec)

mysql> insert into employee values(4,'Bhumi',75000,103);
Query OK, 1 row affected (0.00 sec)

mysql> insert into employee values(5,'Avni',65000,102);
Query OK, 1 row affected (0.00 sec)

mysql> select * from employee;
+------+-------+---------+------+
| eid  | ename | esalary | did  |
+------+-------+---------+------+
|    1 | kanak | 80000   |  101 |
|    2 | Anil  | 70000   |  101 |
|    3 | Harsh | 60000   |  102 |
|    4 | Bhumi | 75000   |  103 |
|    5 | Avni  | 65000   |  102 |
+------+-------+---------+------+
5 rows in set (0.00 sec)

mysql> select ename,dname from employee,department;
+-------+------------+
| ename | dname      |
+-------+------------+
| kanak | Mechanical |
| kanak | ML         |
| kanak | CSE        |
| Anil  | Mechanical |
| Anil  | ML         |
| Anil  | CSE        |
| Harsh | Mechanical |
| Harsh | ML         |
| Harsh | CSE        |
| Bhumi | Mechanical |
| Bhumi | ML         |
| Bhumi | CSE        |
| Avni  | Mechanical |
| Avni  | ML         |
| Avni  | CSE        |
+-------+------------+
15 rows in set (0.00 sec)


#QUESTION2
mysql> create table doctor(doctorid int primary key auto_increment,doctorname varchar(20) not null, specialization varchar(20) unique not null);
Query OK, 0 rows affected (0.05 sec)

mysql> create table patient(patientid int primary key auto_increment, patientname varchar(20) not null, doctorid int ,foreign key (doctorid) references doctor(doctorid) on delete cascade);
Query OK, 0 rows affected (0.04 sec)

mysql> desc patient;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| patientid   | int         | NO   | PRI | NULL    | auto_increment |
| patientname | varchar(20) | NO   |     | NULL    |                |
| doctorid    | int         | YES  | MUL | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
3 rows in set (0.03 sec)


mysql> INSERT INTO doctor(DoctorName,Specialization) VALUES('Dr. Mehta','Dermatology'),('Dr. Singh','Pediatrics'),('Dr. Khan','Dentistry');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO patient(PatientName,DoctorID) VALUES('Anjali',1),('Rohan',1),('Kavya',2),('Arjun',2),('Simran',3);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> delete from doctor where did=1;
ERROR 1054 (42S22): Unknown column 'did' in 'where clause'
mysql> select * from doctor;
+----------+------------+----------------+
| doctorid | doctorname | specialization |
+----------+------------+----------------+
|        1 | Dr. Mehta  | Dermatology    |
|        2 | Dr. Singh  | Pediatrics     |
|        3 | Dr. Khan   | Dentistry      |
+----------+------------+----------------+
3 rows in set (0.00 sec)

mysql> select * from patient;
+-----------+-------------+----------+
| patientid | patientname | doctorid |
+-----------+-------------+----------+
|         1 | Anjali      |        1 |
|         2 | Rohan       |        1 |
|         3 | Kavya       |        2 |
|         4 | Arjun       |        2 |
|         5 | Simran      |        3 |
+-----------+-------------+----------+
5 rows in set (0.00 sec)

mysql> delete from doctor where doctorid=1;
Query OK, 1 row affected (0.01 sec)

mysql> select * from patient;
+-----------+-------------+----------+
| patientid | patientname | doctorid |
+-----------+-------------+----------+
|         3 | Kavya       |        2 |
|         4 | Arjun       |        2 |
|         5 | Simran      |        3 |
+-----------+-------------+----------+
3 rows in set (0.00 sec)

mysql> update doctor set doctorid=1 where doctorid=3;
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`assignment`.`patient`, CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`doctorid`) ON DELETE CASCADE)





QUESTION 3

ntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'primay key auto_increment, authorname varchar(20) unique not null)' at line 1
mysql>  create table author(authorid int primary key auto_increment, authorname varchar(20) unique not null);
Query OK, 0 rows affected (0.03 sec)











































































































































































































































sql>  create table book(bookid int primary key auto_increment,booktitle varchar(20) unique not null,authorid int ,foreign key(authorid) references author(authorid) on delete set null);
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO author(authorname) VALUES('J.K. Rowling'),('George Orwell'),('Chetan Bhagat');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO book(booktitle,authorid) VALUES('Harry Potter',1),('1984',2),('Animal Farm',2),('Five Point Someone',3),('2 States',3);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from author;
+----------+---------------+
| authorid | authorname    |
+----------+---------------+
|        3 | Chetan Bhagat |
|        2 | George Orwell |
|        1 | J.K. Rowling  |
+----------+---------------+
3 rows in set (0.00 sec)

mysql> select * from book;
+--------+--------------------+----------+
| bookid | booktitle          | authorid |
+--------+--------------------+----------+
|      1 | Harry Potter       |        1 |
|      2 | 1984               |        2 |
|      3 | Animal Farm        |        2 |
|      4 | Five Point Someone |        3 |
|      5 | 2 States           |        3 |
+--------+--------------------+----------+
5 rows in set (0.00 sec)

mysql> delete from author where id=1;
ERROR 1054 (42S22): Unknown column 'id' in 'where clause'
mysql> delete from author where authorid=1;
Query OK, 1 row affected (0.01 sec)

mysql> select * from book;
+--------+--------------------+----------+
| bookid | booktitle          | authorid |
+--------+--------------------+----------+
|      1 | Harry Potter       |     NULL |
|      2 | 1984               |        2 |
|      3 | Animal Farm        |        2 |
|      4 | Five Point Someone |        3 |
|      5 | 2 States           |        3 |
+--------+--------------------+----------+
5 rows in set (0.00 sec)

mysql> update author set authorid=2 where authorid is null;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> select * from book;
+--------+--------------------+----------+
| bookid | booktitle          | authorid |
+--------+--------------------+----------+
|      1 | Harry Potter       |     NULL |
|      2 | 1984               |        2 |
|      3 | Animal Farm        |        2 |
|      4 | Five Point Someone |        3 |
|      5 | 2 States           |        3 |
+--------+--------------------+----------+
5 rows in set (0.00 sec)

mysql>
mysql> update author set authorid=1 where authorid is null;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> select * from book;
+--------+--------------------+----------+
| bookid | booktitle          | authorid |
+--------+--------------------+----------+
|      1 | Harry Potter       |     NULL |
|      2 | 1984               |        2 |
|      3 | Animal Farm        |        2 |
|      4 | Five Point Someone |        3 |
|      5 | 2 States           |        3 |
+--------+--------------------+----------+
5 rows in set (0.00 sec)

mysql> update book set authorid=2 where authorid is null;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from book;
+--------+--------------------+----------+
| bookid | booktitle          | authorid |
+--------+--------------------+----------+
|      1 | Harry Potter       |        2 |
|      2 | 1984               |        2 |
|      3 | Animal Farm        |        2 |
|      4 | Five Point Someone |        3 |
|      5 | 2 States           |        3 |
+--------+--------------------+----------+
5 rows in set (0.00 sec)




shayad normal to he tu pr
tujhe nhi pta ki tu mujhe jb yaad krti he jb koi na ho
mujhe nahi laga esa 10 baar tere taraf najar hi rhetu he ki tu kyu krra h
\


