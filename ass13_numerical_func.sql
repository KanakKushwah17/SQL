mysql> CREATE TABLE numeric_practice (id INT PRIMARY KEY, employee_name VARCHAR(50), salary DECIMAL(10,2), bonus DECIMAL(10,2), experience DECIMAL(5,2), score DECIMAL(5,2), number_value DECIMAL(10,3));
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO numeric_practice (id, employee_name, salary, bonus, experience, score, number_value) VALUES (1,'Amit',45000.75,5000.50,2.5,78.456,-25.678),(2,'Rahul',52000.40,6500.25,3.2,85.789,15.234),(3,'Priya',38500.90,4200.75,1.8,67.345,-12.567),(4,'Neha',61000.55,8000.60,4.5,91.678,34.789),(5,'Rohit',47500.25,5500.40,2.2,72.123,-45.345),(6,'Sneha',72000.80,9500.90,5.7,88.567,25.678),(7,'Vikas',33000.35,3000.20,1.1,59.876,-18.234),(8,'Pooja',56500.65,7000.35,3.8,82.456,42.567),(9,'Karan',68000.45,8500.55,4.2,95.234,-33.789),(10,'Anjali',41000.70,4500.80,2.7,74.678,19.456),(11,'Suresh',55000.30,6200.45,3.5,69.345,-27.567),(12,'Kavita',49500.95,5800.65,2.9,86.789,51.234),(13,'Manish',76000.60,10000.75,6.3,92.567,-61.789),(14,'Riya',36000.85,3500.30,1.5,63.456,28.345),(15,'Arjun',64000.20,7800.50,4.8,89.123,-39.456);
Query OK, 15 rows affected, 15 warnings (0.01 sec)
Records: 15  Duplicates: 0  Warnings: 15

mysql> select * from numeric_practice;
+----+---------------+----------+----------+------------+-------+--------------+
| id | employee_name | salary   | bonus    | experience | score | number_value |
+----+---------------+----------+----------+------------+-------+--------------+
|  1 | Amit          | 45000.75 |  5000.50 |       2.50 | 78.46 |      -25.678 |
|  2 | Rahul         | 52000.40 |  6500.25 |       3.20 | 85.79 |       15.234 |
|  3 | Priya         | 38500.90 |  4200.75 |       1.80 | 67.35 |      -12.567 |
|  4 | Neha          | 61000.55 |  8000.60 |       4.50 | 91.68 |       34.789 |
|  5 | Rohit         | 47500.25 |  5500.40 |       2.20 | 72.12 |      -45.345 |
|  6 | Sneha         | 72000.80 |  9500.90 |       5.70 | 88.57 |       25.678 |
|  7 | Vikas         | 33000.35 |  3000.20 |       1.10 | 59.88 |      -18.234 |
|  8 | Pooja         | 56500.65 |  7000.35 |       3.80 | 82.46 |       42.567 |
|  9 | Karan         | 68000.45 |  8500.55 |       4.20 | 95.23 |      -33.789 |
| 10 | Anjali        | 41000.70 |  4500.80 |       2.70 | 74.68 |       19.456 |
| 11 | Suresh        | 55000.30 |  6200.45 |       3.50 | 69.35 |      -27.567 |
| 12 | Kavita        | 49500.95 |  5800.65 |       2.90 | 86.79 |       51.234 |
| 13 | Manish        | 76000.60 | 10000.75 |       6.30 | 92.57 |      -61.789 |
| 14 | Riya          | 36000.85 |  3500.30 |       1.50 | 63.46 |       28.345 |
| 15 | Arjun         | 64000.20 |  7800.50 |       4.80 | 89.12 |      -39.456 |
+----+---------------+----------+----------+------------+-------+--------------+
15 rows in set (0.00 sec)

mysql> select employee_name,number value, abs(number_value) as absolute_value from numeric_practice;
ERROR 1054 (42S22): Unknown column 'number' in 'field list'
mysql> select employee_name,number_value, abs(number_value) as absolute_value from numeric_practice;
+---------------+--------------+----------------+
| employee_name | number_value | absolute_value |
+---------------+--------------+----------------+
| Amit          |      -25.678 |         25.678 |
| Rahul         |       15.234 |         15.234 |
| Priya         |      -12.567 |         12.567 |
| Neha          |       34.789 |         34.789 |
| Rohit         |      -45.345 |         45.345 |
| Sneha         |       25.678 |         25.678 |
| Vikas         |      -18.234 |         18.234 |
| Pooja         |       42.567 |         42.567 |
| Karan         |      -33.789 |         33.789 |
| Anjali        |       19.456 |         19.456 |
| Suresh        |      -27.567 |         27.567 |
| Kavita        |       51.234 |         51.234 |
| Manish        |      -61.789 |         61.789 |
| Riya          |       28.345 |         28.345 |
| Arjun         |      -39.456 |         39.456 |
+---------------+--------------+----------------+
15 rows in set (0.00 sec)

mysql> select employee_name,salary, ceil(salary) as rounded_upward from numeric_practice;
+---------------+----------+----------------+
| employee_name | salary   | rounded_upward |
+---------------+----------+----------------+
| Amit          | 45000.75 |          45001 |
| Rahul         | 52000.40 |          52001 |
| Priya         | 38500.90 |          38501 |
| Neha          | 61000.55 |          61001 |
| Rohit         | 47500.25 |          47501 |
| Sneha         | 72000.80 |          72001 |
| Vikas         | 33000.35 |          33001 |
| Pooja         | 56500.65 |          56501 |
| Karan         | 68000.45 |          68001 |
| Anjali        | 41000.70 |          41001 |
| Suresh        | 55000.30 |          55001 |
| Kavita        | 49500.95 |          49501 |
| Manish        | 76000.60 |          76001 |
| Riya          | 36000.85 |          36001 |
| Arjun         | 64000.20 |          64001 |
+---------------+----------+----------------+
15 rows in set (0.00 sec)

mysql> select employee_name,salary, floor(salary) as rounded_downward from numeric_practice;
+---------------+----------+------------------+
| employee_name | salary   | rounded_downward |
+---------------+----------+------------------+
| Amit          | 45000.75 |            45000 |
| Rahul         | 52000.40 |            52000 |
| Priya         | 38500.90 |            38500 |
| Neha          | 61000.55 |            61000 |
| Rohit         | 47500.25 |            47500 |
| Sneha         | 72000.80 |            72000 |
| Vikas         | 33000.35 |            33000 |
| Pooja         | 56500.65 |            56500 |
| Karan         | 68000.45 |            68000 |
| Anjali        | 41000.70 |            41000 |
| Suresh        | 55000.30 |            55000 |
| Kavita        | 49500.95 |            49500 |
| Manish        | 76000.60 |            76000 |
| Riya          | 36000.85 |            36000 |
| Arjun         | 64000.20 |            64000 |
+---------------+----------+------------------+
15 rows in set (0.00 sec)

mysql> select employee_name,score,round(score,1) as Round_score from numeric_practice;
+---------------+-------+-------------+
| employee_name | score | Round_score |
+---------------+-------+-------------+
| Amit          | 78.46 |        78.5 |
| Rahul         | 85.79 |        85.8 |
| Priya         | 67.35 |        67.4 |
| Neha          | 91.68 |        91.7 |
| Rohit         | 72.12 |        72.1 |
| Sneha         | 88.57 |        88.6 |
| Vikas         | 59.88 |        59.9 |
| Pooja         | 82.46 |        82.5 |
| Karan         | 95.23 |        95.2 |
| Anjali        | 74.68 |        74.7 |
| Suresh        | 69.35 |        69.4 |
| Kavita        | 86.79 |        86.8 |
| Manish        | 92.57 |        92.6 |
| Riya          | 63.46 |        63.5 |
| Arjun         | 89.12 |        89.1 |
+---------------+-------+-------------+
15 rows in set (0.00 sec)

mysql> select employee_name,id from numeric_practice where mod(id,2)=0;
+---------------+----+
| employee_name | id |
+---------------+----+
| Rahul         |  2 |
| Neha          |  4 |
| Sneha         |  6 |
| Pooja         |  8 |
| Anjali        | 10 |
| Kavita        | 12 |
| Riya          | 14 |
+---------------+----+
7 rows in set (0.00 sec)