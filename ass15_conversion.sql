mysql> CREATE TABLE transaction_records (transaction_id VARCHAR(20) PRIMARY KEY, customer_name VARCHAR(50) NOT NULL, amount_str VARCHAR(30) NOT NULL, discount_pct DECIMAL(5,2), tx_date_text VARCHAR(30) NOT NULL, created_timestamp DATETIME NOT NULL, status_code VARCHAR(5) NOT NULL);
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE transaction_records (transaction_id VARCHAR(20) PRIMARY KEY, customer_name VARCHAR(50) NOT NULL, amount_str VARCHAR(30) NOT NULL, discount_pct DECIMAL(5,2), tx_date_text VARCHAR(30) NOT NULL, created_timestamp DATETIME NOT NULL, status_code VARCHAR(5) NOT NULL); INSERT INTO transaction_records VALUES ('TXN-1001', 'Rahul Sharma', '15400.50', 5.50, '15/01/2025', '2025-01-15 10:30:00', '1'), ('TXN-1002', 'Priya Verma', '8200.00', 0.00, '22/01/2025', '2025-01-22 14:15:30', '1'), ('TXN-1003', 'Amit Patel', '12050.75', 10.00, '05/02/2025', '2025-02-05 09:45:12', '0'), ('TXN-1004', 'Neha Singh', '4500.25', NULL, '18/02/2025', '2025-02-18 16:20:00', '1'), ('TXN-1005', 'Rohit Jain', '23000.00', 12.50, '01/03/2025', '2025-03-01 11:10:05', '0'), ('TXN-1006', 'Sneha Gupta', '999.90', 2.00, '12/03/2025', '2025-03-12 18:00:00', '1'), ('TXN-1007', 'Vikas Yadav', '17500.80', 7.25, '25/03/2025', '2025-03-25 08:05:40', '1'), ('TXN-1008', 'Anjali Mehta', '3100.00', NULL, '04/04/2025', '2025-04-04 12:50:22', '0');
ERROR 1050 (42S01): Table 'transaction_records' already exists
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> select * from transaction_records;
+----------------+---------------+------------+--------------+--------------+---------------------+-------------+
| transaction_id | customer_name | amount_str | discount_pct | tx_date_text | created_timestamp   | status_code |
+----------------+---------------+------------+--------------+--------------+---------------------+-------------+
| TXN-1001       | Rahul Sharma  | 15400.50   |         5.50 | 15/01/2025   | 2025-01-15 10:30:00 | 1           |
| TXN-1002       | Priya Verma   | 8200.00    |         0.00 | 22/01/2025   | 2025-01-22 14:15:30 | 1           |
| TXN-1003       | Amit Patel    | 12050.75   |        10.00 | 05/02/2025   | 2025-02-05 09:45:12 | 0           |
| TXN-1004       | Neha Singh    | 4500.25    |         NULL | 18/02/2025   | 2025-02-18 16:20:00 | 1           |
| TXN-1005       | Rohit Jain    | 23000.00   |        12.50 | 01/03/2025   | 2025-03-01 11:10:05 | 0           |
| TXN-1006       | Sneha Gupta   | 999.90     |         2.00 | 12/03/2025   | 2025-03-12 18:00:00 | 1           |
| TXN-1007       | Vikas Yadav   | 17500.80   |         7.25 | 25/03/2025   | 2025-03-25 08:05:40 | 1           |
| TXN-1008       | Anjali Mehta  | 3100.00    |         NULL | 04/04/2025   | 2025-04-04 12:50:22 | 0           |
+------                                  -----+--------------+--------------+---------------------+---
mysql> select * from transaction_records;
+----------------+---------------+------------+--------------+--------------+---------------------+-------------+
| transaction_id | customer_name | amount_str | discount_pct | tx_date_text | created_timestamp   | status_code |
+----------------+---------------+------------+--------------+--------------+---------------------+-------------+
| TXN-1001       | Rahul Sharma  | 15400.50   |         5.50 | 15/01/2025   | 2025-01-15 10:30:00 | 1           |
| TXN-1002       | Priya Verma   | 8200.00    |         0.00 | 22/01/2025   | 2025-01-22 14:15:30 | 1           |
| TXN-1003       | Amit Patel    | 12050.75   |        10.00 | 05/02/2025   | 2025-02-05 09:45:12 | 0           |
| TXN-1004       | Neha Singh    | 4500.25    |         NULL | 18/02/2025   | 2025-02-18 16:20:00 | 1           |
| TXN-1005       | Rohit Jain    | 23000.00   |        12.50 | 01/03/2025   | 2025-03-01 11:10:05 | 0           |
| TXN-1006       | Sneha Gupta   | 999.90     |         2.00 | 12/03/2025   | 2025-03-12 18:00:00 | 1           |
| TXN-1007       | Vikas Yadav   | 17500.80   |         7.25 | 25/03/2025   | 2025-03-25 08:05:40 | 1           |
| TXN-1008       | Anjali Mehta  | 3100.00    |         NULL | 04/04/2025   | 2025-04-04 12:50:22 | 0           |
+----------------+---------------+------------+--------------+--------------+---------------------+-------------+
8 rows in set (0.00 sec)

mysql> select transaction_id,amount_str,cast(amount_str as signed) as amount_integer from transaction_records;
+----------------+------------+----------------+
| transaction_id | amount_str | amount_integer |
+----------------+------------+----------------+
| TXN-1001       | 15400.50   |          15400 |
| TXN-1002       | 8200.00    |           8200 |
| TXN-1003       | 12050.75   |          12050 |
| TXN-1004       | 4500.25    |           4500 |
| TXN-1005       | 23000.00   |          23000 |
| TXN-1006       | 999.90     |            999 |
| TXN-1007       | 17500.80   |          17500 |
| TXN-1008       | 3100.00    |           3100 |
+----------------+------------+----------------+
8 rows in set, 8 warnings (0.00 sec)

mysql> SELECT transaction_id, amount_str, CONVERT(amount_str, DECIMAL(10,2)) AS amount_decimal FROM transaction_records;
+----------------+------------+----------------+
| transaction_id | amount_str | amount_decimal |
+----------------+------------+----------------+
| TXN-1001       | 15400.50   |       15400.50 |
| TXN-1002       | 8200.00    |        8200.00 |
| TXN-1003       | 12050.75   |       12050.75 |
| TXN-1004       | 4500.25    |        4500.25 |
| TXN-1005       | 23000.00   |       23000.00 |
| TXN-1006       | 999.90     |         999.90 |
| TXN-1007       | 17500.80   |       17500.80 |
| TXN-1008       | 3100.00    |        3100.00 |
+----------------+------------+----------------+
8 rows in set (0.00 sec)

mysql> SELECT CONCAT(transaction_id, ' : ', customer_name, ' : ', CAST(discount_pct AS CHAR)) AS invoice_log FROM transaction_records;
+--------------------------------+
| invoice_log                    |
+--------------------------------+
| TXN-1001 : Rahul Sharma : 5.50 |
| TXN-1002 : Priya Verma : 0.00  |
| TXN-1003 : Amit Patel : 10.00  |
| NULL                           |
| TXN-1005 : Rohit Jain : 12.50  |
| TXN-1006 : Sneha Gupta : 2.00  |
| TXN-1007 : Vikas Yadav : 7.25  |
| NULL                           |
+--------------------------------+
8 rows in set (0.00 sec)

mysql> SELECT transaction_id, tx_date_text, STR_TO_DATE(tx_date_text, '%d/%m/%Y') AS transaction_date FROM transaction_records;
+----------------+--------------+------------------+
| transaction_id | tx_date_text | transaction_date |
+----------------+--------------+------------------+
| TXN-1001       | 15/01/2025   | 2025-01-15       |
| TXN-1002       | 22/01/2025   | 2025-01-22       |
| TXN-1003       | 05/02/2025   | 2025-02-05       |
| TXN-1004       | 18/02/2025   | 2025-02-18       |
| TXN-1005       | 01/03/2025   | 2025-03-01       |
| TXN-1006       | 12/03/2025   | 2025-03-12       |
| TXN-1007       | 25/03/2025   | 2025-03-25       |
| TXN-1008       | 04/04/2025   | 2025-04-04       |
+----------------+--------------+------------------+
8 rows in set (0.00 sec)

mysql> SELECT transaction_id, CONCAT(DATE_FORMAT(created_timestamp, '%D %M %Y')) AS formatted_date FROM transaction_records;
+----------------+--------------------+
| transaction_id | formatted_date     |
+----------------+--------------------+
| TXN-1001       | 15th January 2025  |
| TXN-1002       | 22nd January 2025  |
| TXN-1003       | 5th February 2025  |
| TXN-1004       | 18th February 2025 |
| TXN-1005       | 1st March 2025     |
| TXN-1006       | 12th March 2025    |
| TXN-1007       | 25th March 2025    |
| TXN-1008       | 4th April 2025     |
+----------------+--------------------+
8 rows in set (0.00 sec)

mysql> SELECT transaction_id, STR_TO_DATE(tx_date_text, '%d/%m/%Y') AS transaction_date, DAYNAME(STR_TO_DATE(tx_date_text, '%d/%m/%Y')) AS day_name FROM transaction_records;
+----------------+------------------+-----------+
| transaction_id | transaction_date | day_name  |
+----------------+------------------+-----------+
| TXN-1001       | 2025-01-15       | Wednesday |
| TXN-1002       | 2025-01-22       | Wednesday |
| TXN-1003       | 2025-02-05       | Wednesday |
| TXN-1004       | 2025-02-18       | Tuesday   |
| TXN-1005       | 2025-03-01       | Saturday  |
| TXN-1006       | 2025-03-12       | Wednesday |
| TXN-1007       | 2025-03-25       | Tuesday   |
| TXN-1008       | 2025-04-04       | Friday    |
+----------------+------------------+-----------+
8 rows in set (0.00 sec)

mysql> SELECT transaction_id, CAST(REPLACE(transaction_id, 'TXN-', '') AS UNSIGNED) AS transaction_number FROM transaction_records;
+----------------+--------------------+
| transaction_id | transaction_number |
+----------------+--------------------+
| TXN-1001       |               1001 |
| TXN-1002       |               1002 |
| TXN-1003       |               1003 |
| TXN-1004       |               1004 |
| TXN-1005       |               1005 |
| TXN-1006       |               1006 |
| TXN-1007       |               1007 |
| TXN-1008       |               1008 |
+----------------+--------------------+
8 rows in set (0.00 sec)

mysql> SELECT transaction_id, status_code, IF(status_code = '1', 'Active', 'Inactive') AS status FROM transaction_records;
+----------------+-------------+----------+
| transaction_id | status_code | status   |
+----------------+-------------+----------+
| TXN-1001       | 1           | Active   |
| TXN-1002       | 1           | Active   |
| TXN-1003       | 0           | Inactive |
| TXN-1004       | 1           | Active   |
| TXN-1005       | 0           | Inactive |
| TXN-1006       | 1           | Active   |
| TXN-1007       | 1           | Active   |
| TXN-1008       | 0           | Inactive |
+----------------+-------------+----------+
8 rows in set (0.00 sec)

mysql> SELECT transaction_id, customer_name, CAST(amount_str AS DECIMAL(10,2)) AS amount, IFNULL(discount_pct, 0) AS discount, CAST(amount_str AS DECIMAL(10,2)) - (CAST(amount_str AS DECIMAL(10,2)) * IFNULL(discount_pct, 0) / 100) AS net_amount FROM transaction_records;
+----------------+---------------+----------+----------+----------------+
| transaction_id | customer_name | amount   | discount | net_amount     |
+----------------+---------------+----------+----------+----------------+
| TXN-1001       | Rahul Sharma  | 15400.50 |     5.50 | 14553.47250000 |
| TXN-1002       | Priya Verma   |  8200.00 |     0.00 |  8200.00000000 |
| TXN-1003       | Amit Patel    | 12050.75 |    10.00 | 10845.67500000 |
| TXN-1004       | Neha Singh    |  4500.25 |     0.00 |  4500.25000000 |
| TXN-1005       | Rohit Jain    | 23000.00 |    12.50 | 20125.00000000 |
| TXN-1006       | Sneha Gupta   |   999.90 |     2.00 |   979.90200000 |
| TXN-1007       | Vikas Yadav   | 17500.80 |     7.25 | 16231.99200000 |
| TXN-1008       | Anjali Mehta  |  3100.00 |     0.00 |  3100.00000000 |
+----------------+---------------+----------+----------+----------------+
8 rows in set (0.00 sec)

mysql>