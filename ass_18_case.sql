Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 31
Server version: 8.0.46 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+---------------------+
| Database            |
+---------------------+
| analysis            |
| assignment          |
| batch18             |
| batch19             |
| batch8              |
| college_temp        |
| company_db          |
| dbms                |
| functions           |
| hospital            |
| hospital_management |
| information_schema  |
| mysql               |
| new                 |
| new1                |
| performance_schema  |
| school_db           |
| shop_db             |
| student             |
+---------------------+
19 rows in set (0.01 sec)

mysql> use batch18;
Database changed
mysql> use hospital_management;
Database changed
mysql> create table medicine(medicine_id int primary key, medicine_name(50) not null, manufacturer varchar(50) not null,price decimal(10,2) not null);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(50) not null, manufacturer varchar(50) not null,price decimal(10,2) not null)' at line 1
mysql> create table medicine(medicine_id int primary key, medicine_name varchar(50) not null, manufacturer varchar(50) not null,price decimal(10,2) not null);
Query OK, 0 rows affected (0.05 sec)

mysql> CREATE TABLE appointment (
    ->     appointment_id INT PRIMARY KEY,
    ->     appointment_date DATE NOT NULL,
    ->     appointment_time TIME NOT NULL,
    ->     patient_id INT,
    ->     doctor_id INT,
    ->     department_id INT,
    ->     status VARCHAR(20) NOT NULL,
    ->     CONSTRAINT fk_appointment_patient FOREIGN KEY (patient_id)
    ->         REFERENCES patient(patient_id)
    ->         ON DELETE CASCADE
    ->         ON UPDATE CASCADE,
    ->     CONSTRAINT fk_appointment_doctor FOREIGN KEY (doctor_id)
    ->         REFERENCES doctor(doctor_id)
    ->         ON DELETE SET NULL
    ->         ON UPDATE SET NULL,
    ->     CONSTRAINT fk_appointment_department FOREIGN KEY (department_id)
    ->         REFERENCES department(department_id)
    ->         ON DELETE SET NULL
    ->         ON UPDATE CASCADE
    -> );
ERROR 3734 (HY000): Failed to add the foreign key constraint. Missing column 'patient_id' for constraint 'fk_appointment_patient' in the referenced table 'patient'
mysql> desc patient;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| ppatient_id  | int         | NO   | PRI | NULL    |       |
| patient_name | varchar(50) | NO   |     | NULL    |       |
| gender       | varchar(10) | NO   |     | NULL    |       |
| city         | varchar(50) | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> drop table patient;
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE patient (
    ->     patient_id INT PRIMARY KEY,
    ->     patient_name VARCHAR(50) NOT NULL,
    ->     gender VARCHAR(10) NOT NULL,
    ->     city VARCHAR(50) NOT NULL
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE appointment (
    ->     appointment_id INT PRIMARY KEY,
    ->     appointment_date DATE NOT NULL,
    ->     appointment_time TIME NOT NULL,
    ->     patient_id INT,
    ->     doctor_id INT,
    ->     department_id INT,
    ->     status VARCHAR(20) NOT NULL,
    ->     CONSTRAINT fk_appointment_patient FOREIGN KEY (patient_id)
    ->         REFERENCES patient(patient_id)
    ->         ON DELETE CASCADE
    ->         ON UPDATE CASCADE,
    ->     CONSTRAINT fk_appointment_doctor FOREIGN KEY (doctor_id)
    ->         REFERENCES doctor(doctor_id)
    ->         ON DELETE SET NULL
    ->         ON UPDATE SET NULL,
    ->     CONSTRAINT fk_appointment_department FOREIGN KEY (department_id)
    ->         REFERENCES department(department_id)
    ->         ON DELETE SET NULL
    ->         ON UPDATE CASCADE
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> CREATE TABLE prescription (
    ->     prescription_id INT PRIMARY KEY,
    ->     prescription_date DATE NOT NULL,
    ->     appointment_id INT,
    ->     patient_id INT,
    ->     doctor_id INT,
    ->     remarks VARCHAR(255),
    ->     CONSTRAINT fk_prescription_appointment FOREIGN KEY (appointment_id)
    ->         REFERENCES appointment(appointment_id)
    ->         ON DELETE CASCADE
    ->         ON UPDATE CASCADE,
    ->     CONSTRAINT fk_prescription_patient FOREIGN KEY (patient_id)
    ->         REFERENCES patient(patient_id)
    ->         ON DELETE CASCADE
    ->         ON UPDATE CASCADE,
    ->     CONSTRAINT fk_prescription_doctor FOREIGN KEY (doctor_id)
    ->         REFERENCES doctor(doctor_id)
    ->         ON DELETE SET NULL
    ->         ON UPDATE SET NULL
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE prescription_medicine (
    ->     prescription_id INT,
    ->     medicine_id INT,
    ->     dosage VARCHAR(20) NOT NULL,
    ->     duration_days INT NOT NULL,
    ->     quantity INT NOT NULL,
    ->     PRIMARY KEY (prescription_id, medicine_id),
    ->     CONSTRAINT fk_pm_prescription FOREIGN KEY (prescription_id)
    ->         REFERENCES prescription(prescription_id)
    ->         ON DELETE CASCADE
    ->         ON UPDATE CASCADE,
    ->     CONSTRAINT fk_pm_medicine FOREIGN KEY (medicine_id)
    ->         REFERENCES medicine(medicine_id)
    ->         ON DELETE RESTRICT
    ->         ON UPDATE CASCADE
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> USE hospital_management;
Database changed
mysql>
mysql> -- -------------------------------------------------------------
mysql> -- 1. Insert Data into Department
mysql> -- -------------------------------------------------------------
mysql> INSERT INTO department (department_id, department_name, floor_no) VALUES
    -> (101, 'Cardiology', 3),
    -> (102, 'Neurology', 4),
    -> (103, 'Orthopedics', 2),
    -> (104, 'Dermatology', 1);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> -- -------------------------------------------------------------
mysql> -- 2. Insert Data into Doctor
mysql> -- -------------------------------------------------------------
mysql> INSERT INTO doctor (doctor_id, doctor_name, specialization, department_id) VALUES
    -> (201, 'Dr. Rajesh Sharma', 'Cardiologist', 101),
    -> (202, 'Dr. Neha Verma', 'Neurologist', 102),
    -> (203, 'Dr. Amit Jain', 'Orthopedic', 103),
    -> (204, 'Dr. Priya Singh', 'Dermatologist', 104),
    -> (205, 'Dr. Karan Mehta', 'Cardiologist', 101);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>
mysql> -- -------------------------------------------------------------
mysql> -- 3. Insert Data into Patient
mysql> -- -------------------------------------------------------------
mysql> INSERT INTO patient (patient_id, patient_name, gender, city) VALUES
    -> (301, 'Rahul Verma', 'Male', 'Indore'),
    -> (302, 'Sneha Sharma', 'Female', 'Bhopal'),
    -> (303, 'Amit Patel', 'Male', 'Indore'),
    -> (304, 'Pooja Gupta', 'Female', 'Ujjain'),
    -> (305, 'Rohan Jain', 'Male', 'Dewas'),
    -> (306, 'Neha Patel', 'Female', 'Indore');
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql>
mysql> -- -------------------------------------------------------------
mysql> -- 4. Insert Data into Medicine
mysql> -- -------------------------------------------------------------
mysql> INSERT INTO medicine (medicine_id, medicine_name, manufacturer, price) VALUES
    -> (401, 'Paracetamol', 'ABC Pharma', 30.00),
    -> (402, 'Azithromycin', 'XYZ Pharma', 120.00),
    -> (403, 'Pantoprazole', 'MedLife', 80.00),
    -> (404, 'Amoxicillin', 'HealthCare Pharma', 150.00),
    -> (405, 'Ibuprofen', 'ABC Pharma', 60.00),
    -> (406, 'Cetirizine', 'MedLife', 45.00);
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql>
mysql> -- -------------------------------------------------------------
mysql> -- 5. Insert Data into Appointment
mysql> -- -------------------------------------------------------------
mysql> INSERT INTO appointment (appointment_id, appointment_date, appointment_time, patient_id, doctor_id, department_id, status) VALUES
    -> (501, '2026-09-01', '10:00:00', 301, 201, 101, 'Completed'),
    -> (502, '2026-09-01', '11:00:00', 302, 202, 102, 'Completed'),
    -> (503, '2026-09-02', '09:30:00', 303, 203, 103, 'Completed'),
    -> (504, '2026-09-02', '12:00:00', 304, 204, 104, 'Cancelled'),
    -> (505, '2026-09-03', '10:30:00', 301, 205, 101, 'Completed'),
    -> (506, '2026-09-03', '11:30:00', 305, 203, 103, 'Completed'),
    -> (507, '2026-09-04', '09:00:00', 306, 201, 101, 'Scheduled'),
    -> (508, '2026-09-04', '14:00:00', 302, 202, 102, 'Scheduled');
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql>
mysql> -- -------------------------------------------------------------
mysql> -- 6. Insert Data into Prescription
mysql> -- -------------------------------------------------------------
mysql> INSERT INTO prescription (prescription_id, prescription_date, appointment_id, patient_id, doctor_id, remarks) VALUES
    -> (601, '2026-09-01', 501, 301, 201, 'BP observation'),
    -> (602, '2026-09-01', 502, 302, 202, 'Migraine treatment'),
    -> (603, '2026-09-02', 503, 303, 203, 'Knee pain'),
    -> (604, '2026-09-03', 505, 301, 205, 'Heart checkup'),
    -> (605, '2026-09-03', 506, 305, 203, 'Back pain');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>
mysql> -- -------------------------------------------------------------
mysql> -- 7. Insert Data into Prescription_Medicine
mysql> -- -------------------------------------------------------------
mysql> INSERT INTO prescription_medicine (prescription_id, medicine_id, dosage, duration_days, quantity) VALUES
    -> (601, 401, '1-0-1', 5, 10),
    -> (601, 403, '1-0-0', 5, 5),
    -> (602, 403, '1-0-0', 7, 7),
    -> (602, 406, '0-0-1', 5, 5),
    -> (603, 405, '1-0-1', 5, 10),
    -> (603, 403, '1-0-0', 5, 5),
    -> (604, 401, '1-0-1', 3, 6),
    -> (604, 403, '1-0-0', 3, 3),
    -> (605, 405, '1-0-1', 7, 14);
Query OK, 9 rows affected (0.01 sec)
Records: 9  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM department;
+---------------+-----------------+----------+
| department_id | department_name | floor_no |
+---------------+-----------------+----------+
|           101 | Cardiology      |        3 |
|           102 | Neurology       |        4 |
|           103 | Orthopedics     |        2 |
|           104 | Dermatology     |        1 |
+---------------+-----------------+----------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM doctor;
+-----------+-------------------+----------------+---------------+
| doctor_id | doctor_name       | specialization | department_id |
+-----------+-------------------+----------------+---------------+
|       201 | Dr. Rajesh Sharma | Cardiologist   |           101 |
|       202 | Dr. Neha Verma    | Neurologist    |           102 |
|       203 | Dr. Amit Jain     | Orthopedic     |           103 |
|       204 | Dr. Priya Singh   | Dermatologist  |           104 |
|       205 | Dr. Karan Mehta   | Cardiologist   |           101 |
+-----------+-------------------+----------------+---------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM patient;
+------------+--------------+--------+--------+
| patient_id | patient_name | gender | city   |
+------------+--------------+--------+--------+
|        301 | Rahul Verma  | Male   | Indore |
|        302 | Sneha Sharma | Female | Bhopal |
|        303 | Amit Patel   | Male   | Indore |
|        304 | Pooja Gupta  | Female | Ujjain |
|        305 | Rohan Jain   | Male   | Dewas  |
|        306 | Neha Patel   | Female | Indore |
+------------+--------------+--------+--------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM medicine;
+-------------+---------------+-------------------+--------+
| medicine_id | medicine_name | manufacturer      | price  |
+-------------+---------------+-------------------+--------+
|         401 | Paracetamol   | ABC Pharma        |  30.00 |
|         402 | Azithromycin  | XYZ Pharma        | 120.00 |
|         403 | Pantoprazole  | MedLife           |  80.00 |
|         404 | Amoxicillin   | HealthCare Pharma | 150.00 |
|         405 | Ibuprofen     | ABC Pharma        |  60.00 |
|         406 | Cetirizine    | MedLife           |  45.00 |
+-------------+---------------+-------------------+--------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM appointment;
+----------------+------------------+------------------+------------+-----------+---------------+-----------+
| appointment_id | appointment_date | appointment_time | patient_id | doctor_id | department_id | status    |
+----------------+------------------+------------------+------------+-----------+---------------+-----------+
|            501 | 2026-09-01       | 10:00:00         |        301 |       201 |           101 | Completed |
|            502 | 2026-09-01       | 11:00:00         |        302 |       202 |           102 | Completed |
|            503 | 2026-09-02       | 09:30:00         |        303 |       203 |           103 | Completed |
|            504 | 2026-09-02       | 12:00:00         |        304 |       204 |           104 | Cancelled |
|            505 | 2026-09-03       | 10:30:00         |        301 |       205 |           101 | Completed |
|            506 | 2026-09-03       | 11:30:00         |        305 |       203 |           103 | Completed |
|            507 | 2026-09-04       | 09:00:00         |        306 |       201 |           101 | Scheduled |
|            508 | 2026-09-04       | 14:00:00         |        302 |       202 |           102 | Scheduled |
+----------------+------------------+------------------+------------+-----------+---------------+-----------+
8 rows in set (0.00 sec)

mysql> SELECT * FROM prescription;
+-----------------+-------------------+----------------+------------+-----------+--------------------+
| prescription_id | prescription_date | appointment_id | patient_id | doctor_id | remarks            |
+-----------------+-------------------+----------------+------------+-----------+--------------------+
|             601 | 2026-09-01        |            501 |        301 |       201 | BP observation     |
|             602 | 2026-09-01        |            502 |        302 |       202 | Migraine treatment |
|             603 | 2026-09-02        |            503 |        303 |       203 | Knee pain          |
|             604 | 2026-09-03        |            505 |        301 |       205 | Heart checkup      |
|             605 | 2026-09-03        |            506 |        305 |       203 | Back pain          |
+-----------------+-------------------+----------------+------------+-----------+--------------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM prescription_medicine;
+-----------------+-------------+--------+---------------+----------+
| prescription_id | medicine_id | dosage | duration_days | quantity |
+-----------------+-------------+--------+---------------+----------+
|             601 |         401 | 1-0-1  |             5 |       10 |
|             601 |         403 | 1-0-0  |             5 |        5 |
|             602 |         403 | 1-0-0  |             7 |        7 |
|             602 |         406 | 0-0-1  |             5 |        5 |
|             603 |         403 | 1-0-0  |             5 |        5 |
|             603 |         405 | 1-0-1  |             5 |       10 |
|             604 |         401 | 1-0-1  |             3 |        6 |
|             604 |         403 | 1-0-0  |             3 |        3 |
|             605 |         405 | 1-0-1  |             7 |       14 |
+-----------------+-------------+--------+---------------+----------+
9 rows in set (0.00 sec)

mysql>