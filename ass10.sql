#TABLE1



mysql> create table Students(StudentID int primary key, Name varchar(50) not null, age int check (age between 18 and 25), marks decimal(10,2) check(marks between 0 and 100));
Query OK, 0 rows affected (0.04 sec)

mysql> desc Students;
+-----------+---------------+------+-----+---------+-------+
| Field     | Type          | Null | Key | Default | Extra |
+-----------+---------------+------+-----+---------+-------+
| StudentID | int           | NO   | PRI | NULL    |       |
| Name      | varchar(50)   | NO   |     | NULL    |       |
| age       | int           | YES  |     | NULL    |       |
| marks     | decimal(10,2) | YES  |     | NULL    |       |
+-----------+---------------+------+-----+---------+-------+
4 rows in set (0.01 sec)


mysql> insert into students values(101, 'Alice', 20, 85.5);
Query OK, 1 row affected (0.02 sec)

mysql> insert into students values(102, 'Bob', 17, 90.0);
ERROR 3819 (HY000): Check constraint 'students_chk_1' is violated.
mysql> insert into students values(103, 'Charlie', 22, 105.0);
ERROR 3819 (HY000): Check constraint 'students_chk_2' is violated.
mysql> insert into students values(104, 'David', 24, 75.0);
Query OK, 1 row affected (0.01 sec)

mysql> select * from students;
+-----------+-------+------+-------+
| StudentID | Name  | age  | marks |
+-----------+-------+------+-------+
|       101 | Alice |   20 | 85.50 |
|       104 | David |   24 | 75.00 |
+-----------+-------+------+-------+
2 rows in set (0.00 sec)





#Table2


mysql> create table Patients(PatientID int primary key, PatientName varchar(50) not null, age int check(age between 1 and 100), AdmissionStatus varchar(15) Default 'Admitted' check (AdmissionStatus in ('Admitted','Discharged')),TreatmentCost decimal(10,2) check(TreatmentCost>=1000));
Query OK, 0 rows affected (0.03 sec)

mysql> desc Patients;
+-----------------+---------------+------+-----+----------+-------+
| Field           | Type          | Null | Key | Default  | Extra |
+-----------------+---------------+------+-----+----------+-------+
| PatientID       | int           | NO   | PRI | NULL     |       |
| PatientName     | varchar(50)   | NO   |     | NULL     |       |
| age             | int           | YES  |     | NULL     |       |
| AdmissionStatus | varchar(15)   | YES  |     | Admitted |       |
| TreatmentCost   | decimal(10,2) | YES  |     | NULL     |       |
+-----------------+---------------+------+-----+----------+-------+
5 rows in set (0.00 sec)

mysql> insert into Patients values(201, 'Michael', 25, 'Admitted', 5000);
Query OK, 1 row affected (0.01 sec)

mysql> insert into Patients values(202, 'Linda', 105, 'Admitted', 8000);
ERROR 3819 (HY000): Check constraint 'patients_chk_1' is violated.

mysql> insert into Patients values(203, 'David', 40, DEFAULT, 1200);
Query OK, 1 row affected (0.01 sec)

mysql> insert into Patients values(204, 'Sarah', 30, 'Discharged', 700);
ERROR 3819 (HY000): Check constraint 'patients_chk_3' is violated.


mysql> select * from Patients;
+-----------+-------------+------+-----------------+---------------+
| PatientID | PatientName | age  | AdmissionStatus | TreatmentCost |
+-----------+-------------+------+-----------------+---------------+
|       201 | Michael     |   25 | Admitted        |       5000.00 |
|       203 | David       |   40 | Admitted        |       1200.00 |
+-----------+-------------+------+-----------------+---------------+
2 rows in set (0.00 sec)




#Table3
mysql> create table GymMembers(MemberID int primary key,MemberName varchar(50) Not null, MembershipType Varchar(15) DEFAULT 'BASIC' check(MembershipType in ('Basic','Premium','VIP')), MonthlyFee Decimal(6,2) check(MonthlyFee>=500));
Query OK, 0 rows affected (0.03 sec)

mysql> desc GymMembers;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| MemberID       | int          | NO   | PRI | NULL    |       |
| MemberName     | varchar(50)  | NO   |     | NULL    |       |
| MembershipType | varchar(15)  | YES  |     | BASIC   |       |
| MonthlyFee     | decimal(6,2) | YES  |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)


mysql> insert into GymMembers values(501, 'John', 'Premium', 1200);
Query OK, 1 row affected (0.01 sec)

mysql> insert into GymMembers values(502, 'Emma', 'Gold', 800);
ERROR 3819 (HY000): Check constraint 'gymmembers_chk_1' is violated.
mysql> insert into GymMembers values(503, 'Daniel', DEFAULT, 700);
Query OK, 1 row affected (0.01 sec)

mysql> insert into GymMembers values(504, 'Sophia', 'VIP', 300);
ERROR 3819 (HY000): Check constraint 'gymmembers_chk_2' is violated.
mysql> select * from GymMembers;
+----------+------------+----------------+------------+
| MemberID | MemberName | MembershipType | MonthlyFee |
+----------+------------+----------------+------------+
|      501 | John       | Premium        |    1200.00 |
|      503 | Daniel     | BASIC          |     700.00 |
+----------+------------+----------------+------------+
2 rows in set (0.00 sec)












#TABLE4
mysql> create table Events(EventID int primary key auto_increment,EventName varchar(50), EventDate date check(EventDate > '2026-09-01'));
Query OK, 0 rows affected (0.04 sec)

mysql> desc events;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| EventID   | int         | NO   | PRI | NULL    | auto_increment |
| EventName | varchar(50) | YES  |     | NULL    |                |
| EventDate | date        | YES  |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)


















#TABLE5
mysql> create table MovieTickets(TicketID int primary key Auto_increment,CustomerName varchar(50), ShowTime DateTime , BookingTime DateTime Default CURRENT_TIMESTAMP);
Query OK, 0 rows affected (0.04 sec)

mysql> desc MovieTickets;
+--------------+-------------+------+-----+-------------------+-------------------+
| Field        | Type        | Null | Key | Default           | Extra             |
+--------------+-------------+------+-----+-------------------+-------------------+
| TicketID     | int         | NO   | PRI | NULL              | auto_increment    |
| CustomerName | varchar(50) | YES  |     | NULL              |                   |
| ShowTime     | datetime    | YES  |     | NULL              |                   |
| BookingTime  | datetime    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
+--------------+-------------+------+-----+-------------------+-------------------+
4 rows in set (0.01 sec)