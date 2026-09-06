mysql> CREATE TABLE staff (staff_id INT PRIMARY KEY AUTO_INCREMENT, staff_name VARCHAR(50), department VARCHAR(30), city VARCHAR(30), salary DECIMAL(10,2), experience INT, age INT, email VARCHAR(100) NULL, phone VARCHAR(15) NULL, bonus DECIMAL(10,2) NULL, status VARCHAR(20));
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO staff (staff_name, department, city, salary, experience, age, email, phone, bonus, status) VALUES ('Amit','IT','Indore',85000.00,6,28,'amit@gmail.com','9876543210',8500.00,'Active'),('Rahul','IT','Bhopal',55000.00,3,25,'rahul@gmail.com','9876501234',5000.00,'Active'),('Priya','HR','Indore',62000.00,4,27,NULL,'9123456780',6200.00,'Active'),('Neha','Finance','Mumbai',75000.00,4,30,'neha@gmail.com',NULL,7500.00,'Active'),('Rohit','IT','Pune',50000.00,5,29,'rohit@gmail.com','9090909090',5000.00,'Active'),('Sneha','HR','Delhi',58000.00,2,24,'sneha@gmail.com',NULL,NULL,'Inactive'),('Vikas','Finance','Jaipur',72000.00,6,32,NULL,'9345678901',7200.00,'Active'),('Pooja','IT','Indore',90000.00,7,31,'pooja@gmail.com','9988776655',9000.00,'Active'),('Karan','Finance','Bhopal',65000.00,3,26,'karan@gmail.com','8899776655',6500.00,'Active'),('Anjali','HR','Mumbai',48000.00,1,23,NULL,NULL,NULL,'Inactive'),('Suresh','Finance','Indore',50000.00,5,34,'suresh@gmail.com','9001122334',5000.00,'Active'),('Kavita','IT','Delhi',68000.00,5,29,'kavita@gmail.com',NULL,6800.00,'Active'),('Manish','Finance','Pune',82000.00,8,35,'manish@gmail.com','9765432109',8200.00,'Active'),('Riya','HR','Bhopal',61000.00,3,27,'riya@gmail.com','9012345678',6100.00,'Active'),('Arjun','Sales','Indore',45000.00,2,24,NULL,NULL,NULL,'Inactive');
Query OK, 15 rows affected (0.01 sec)
Records: 15  Duplicates: 0  Warnings: 0

mysql> +
    -> ^C
mysql>
mysql> select * from staff;
+----------+------------+------------+--------+----------+------------+------+------------------+------------+---------+----------+
| staff_id | staff_name | department | city   | salary   | experience | age  | email            | phone      | bonus   | status   |
+----------+------------+------------+--------+----------+------------+------+------------------+------------+---------+----------+
|        1 | Amit       | IT         | Indore | 85000.00 |          6 |   28 | amit@gmail.com   | 9876543210 | 8500.00 | Active   |
|        2 | Rahul      | IT         | Bhopal | 55000.00 |          3 |   25 | rahul@gmail.com  | 9876501234 | 5000.00 | Active   |
|        3 | Priya      | HR         | Indore | 62000.00 |          4 |   27 | NULL             | 9123456780 | 6200.00 | Active   |
|        4 | Neha       | Finance    | Mumbai | 75000.00 |          4 |   30 | neha@gmail.com   | NULL       | 7500.00 | Active   |
|        5 | Rohit      | IT         | Pune   | 50000.00 |          5 |   29 | rohit@gmail.com  | 9090909090 | 5000.00 | Active   |
|        6 | Sneha      | HR         | Delhi  | 58000.00 |          2 |   24 | sneha@gmail.com  | NULL       |    NULL | Inactive |
|        7 | Vikas      | Finance    | Jaipur | 72000.00 |          6 |   32 | NULL             | 9345678901 | 7200.00 | Active   |
|        8 | Pooja      | IT         | Indore | 90000.00 |          7 |   31 | pooja@gmail.com  | 9988776655 | 9000.00 | Active   |
|        9 | Karan      | Finance    | Bhopal | 65000.00 |          3 |   26 | karan@gmail.com  | 8899776655 | 6500.00 | Active   |
|       10 | Anjali     | HR         | Mumbai | 48000.00 |          1 |   23 | NULL             | NULL       |    NULL | Inactive |
|       11 | Suresh     | Finance    | Indore | 50000.00 |          5 |   34 | suresh@gmail.com | 9001122334 | 5000.00 | Active   |
|       12 | Kavita     | IT         | Delhi  | 68000.00 |          5 |   29 | kavita@gmail.com | NULL       | 6800.00 | Active   |
|       13 | Manish     | Finance    | Pune   | 82000.00 |          8 |   35 | manish@gmail.com | 9765432109 | 8200.00 | Active   |
|       14 | Riya       | HR         | Bhopal | 61000.00 |          3 |   27 | riya@gmail.com   | 9012345678 | 6100.00 | Active   |
|       15 | Arjun      | Sales      | Indore | 45000.00 |          2 |   24 | NULL             | NULL       |    NULL | Inactive |
+----------+------------+------------+--------+----------+------------+------+------------------+------------+---------+----------+
15 rows in set (0.00 sec)


mysql> select staff_name, salary,status , if(salary >= 60000,'High Salary','Low salary') as salary_status from staff;
+------------+----------+----------+---------------+
| staff_name | salary   | status   | salary_status |
+------------+----------+----------+---------------+
| Amit       | 85000.00 | Active   | High Salary   |
| Rahul      | 55000.00 | Active   | Low salary    |
| Priya      | 62000.00 | Active   | High Salary   |
| Neha       | 75000.00 | Active   | High Salary   |
| Rohit      | 50000.00 | Active   | Low salary    |
| Sneha      | 58000.00 | Inactive | Low salary    |
| Vikas      | 72000.00 | Active   | High Salary   |
| Pooja      | 90000.00 | Active   | High Salary   |
| Karan      | 65000.00 | Active   | High Salary   |
| Anjali     | 48000.00 | Inactive | Low salary    |
| Suresh     | 50000.00 | Active   | Low salary    |
| Kavita     | 68000.00 | Active   | High Salary   |
| Manish     | 82000.00 | Active   | High Salary   |
| Riya       | 61000.00 | Active   | High Salary   |
| Arjun      | 45000.00 | Inactive | Low salary    |
+------------+----------+----------+---------------+
15 rows in set (0.00 sec)

mysql> select staff_name,experience, if(experience >= 5,'Experienced','Fresher') as Experience_status from staff;
+------------+------------+-------------------+
| staff_name | experience | Experience_status |
+------------+------------+-------------------+
| Amit       |          6 | Experienced       |
| Rahul      |          3 | Fresher           |
| Priya      |          4 | Fresher           |
| Neha       |          4 | Fresher           |
| Rohit      |          5 | Experienced       |
| Sneha      |          2 | Fresher           |
| Vikas      |          6 | Experienced       |
| Pooja      |          7 | Experienced       |
| Karan      |          3 | Fresher           |
| Anjali     |          1 | Fresher           |
| Suresh     |          5 | Experienced       |
| Kavita     |          5 | Experienced       |
| Manish     |          8 | Experienced       |
| Riya       |          3 | Fresher           |
| Arjun      |          2 | Fresher           |
+------------+------------+-------------------+
15 rows in set (0.00 sec)

mysql> select staff_name,email, ifnull(email,'Email not available') as Email from staff;
+------------+------------------+---------------------+
| staff_name | email            | Email               |
+------------+------------------+---------------------+
| Amit       | amit@gmail.com   | amit@gmail.com      |
| Rahul      | rahul@gmail.com  | rahul@gmail.com     |
| Priya      | NULL             | Email not available |
| Neha       | neha@gmail.com   | neha@gmail.com      |
| Rohit      | rohit@gmail.com  | rohit@gmail.com     |
| Sneha      | sneha@gmail.com  | sneha@gmail.com     |
| Vikas      | NULL             | Email not available |
| Pooja      | pooja@gmail.com  | pooja@gmail.com     |
| Karan      | karan@gmail.com  | karan@gmail.com     |
| Anjali     | NULL             | Email not available |
| Suresh     | suresh@gmail.com | suresh@gmail.com    |
| Kavita     | kavita@gmail.com | kavita@gmail.com    |
| Manish     | manish@gmail.com | manish@gmail.com    |
| Riya       | riya@gmail.com   | riya@gmail.com      |
| Arjun      | NULL             | Email not available |
+------------+------------------+---------------------+
15 rows in set (0.00 sec)

mysql> select staff_name,coalesce(phone,email,'No contact') as contact_information from staff;
+------------+---------------------+
| staff_name | contact_information |
+------------+---------------------+
| Amit       | 9876543210          |
| Rahul      | 9876501234          |
| Priya      | 9123456780          |
| Neha       | neha@gmail.com      |
| Rohit      | 9090909090          |
| Sneha      | sneha@gmail.com     |
| Vikas      | 9345678901          |
| Pooja      | 9988776655          |
| Karan      | 8899776655          |
| Anjali     | No contact          |
| Suresh     | 9001122334          |
| Kavita     | kavita@gmail.com    |
| Manish     | 9765432109          |
| Riya       | 9012345678          |
| Arjun      | No contact          |
+------------+---------------------+
15 rows in set (0.00 sec)

mysql> select staff_name,nullif(salary,50000) as salary from staff;
+------------+----------+
| staff_name | salary   |
+------------+----------+
| Amit       | 85000.00 |
| Rahul      | 55000.00 |
| Priya      | 62000.00 |
| Neha       | 75000.00 |
| Rohit      |     NULL |
| Sneha      | 58000.00 |
| Vikas      | 72000.00 |
| Pooja      | 90000.00 |
| Karan      | 65000.00 |
| Anjali     | 48000.00 |
| Suresh     |     NULL |
| Kavita     | 68000.00 |
| Manish     | 82000.00 |
| Riya       | 61000.00 |
| Arjun      | 45000.00 |
+------------+----------+
15 rows in set (0.00 sec)

mysql> select staff_name,salary ,case when salary>=80000 then'high' when salary>=60000 then 'Medium' else 'low' end as salary_category from staff;
+------------+----------+-----------------+
| staff_name | salary   | salary_category |
+------------+----------+-----------------+
| Amit       | 85000.00 | high            |
| Rahul      | 55000.00 | low             |
| Priya      | 62000.00 | Medium          |
| Neha       | 75000.00 | Medium          |
| Rohit      | 50000.00 | low             |
| Sneha      | 58000.00 | low             |
| Vikas      | 72000.00 | Medium          |
| Pooja      | 90000.00 | high            |
| Karan      | 65000.00 | Medium          |
| Anjali     | 48000.00 | low             |
| Suresh     | 50000.00 | low             |
| Kavita     | 68000.00 | Medium          |
| Manish     | 82000.00 | high            |
| Riya       | 61000.00 | Medium          |
| Arjun      | 45000.00 | low             |
+------------+----------+-----------------+
15 rows in set (0.00 sec)

mysql> select staff_name, case when department = 'IT' and experience>=5 then 'IT experienced' when department ='Finance' and salary>=70000 then 'Finance high earner' when department='HR' and experience>=3 then 'HR Experienced' else 'other' end as category from staff;
+------------+---------------------+
| staff_name | category            |
+------------+---------------------+
| Amit       | IT experienced      |
| Rahul      | other               |
| Priya      | HR Experienced      |
| Neha       | Finance high earner |
| Rohit      | IT experienced      |
| Sneha      | other               |
| Vikas      | Finance high earner |
| Pooja      | IT experienced      |
| Karan      | other               |
| Anjali     | other               |
| Suresh     | other               |
| Kavita     | IT experienced      |
| Manish     | Finance high earner |
| Riya       | HR Experienced      |
| Arjun      | other               |
+------------+---------------------+
15 rows in set (0.00 sec)