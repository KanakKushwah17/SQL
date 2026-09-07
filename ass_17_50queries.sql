
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| analysis           |
| batch18            |
| batch19            |
| batch8             |
| college_temp       |
| company_db         |
| dbms               |
| functions          |
| hospital           |
| information_schema |
| mysql              |
| new                |
| new1               |
| performance_schema |
| school_db          |
| shop_db            |
| student            |
+--------------------+
17 rows in set (0.00 sec)

mysql> use dbms;
Database changed
mysql> show tables;
+----------------+
| Tables_in_dbms |
+----------------+
| employees      |
| sales          |
+----------------+
2 rows in set (0.00 sec)

mysql> select * from sales;
+---------+---------------+--------+-------------+----------+----------+----------+----------+------------+----------------+-----------+---------------+
| sale_id | customer_name | city   | category    | product  | quantity | price    | discount | sale_date  | payment_method | status    | customer_type |
+---------+---------------+--------+-------------+----------+----------+----------+----------+------------+----------------+-----------+---------------+
|    NULL | Rahul         | Indore | Electronics | Laptop   |        2 | 60000.00 |  5000.00 | 2026-01-05 | card           | completed | premium       |
|    NULL | Priya         | Bhopal | Electronics | Mobile   |        3 | 25000.00 |  3000.00 | 2026-01-07 | upi            | completed | regular       |
|    NULL | Amit          | Indore | Clothing    | Jeans    |        5 |  2000.00 |   500.00 | 2026-01-10 | cash           | completed | new           |
|    NULL | Sneha         | Mumbai | Beauty      | Cream    |        8 |   800.00 |   400.00 | 2026-01-12 | upi            | completed | premium       |
|    NULL | Rohit         | Pune   | Electronics | Laptop   |        1 | 55000.00 |  4000.00 | 2026-01-15 | card           | completed | regular       |
|    NULL | Neha          | Delhi  | Clothing    | Kurti    |        6 |  1800.00 |   600.00 | 2026-01-17 | upi            | completed | premium       |
|    NULL | Karan         | Indore | Sports      | Bat      |        4 |  3500.00 |   700.00 | 2026-01-20 | cash           | completed | regular       |
|    NULL | Pooja         | Bhopal | Beauty      | Lipstick |       10 |   600.00 |   300.00 | 2026-01-22 | upi            | completed | new           |
|    NULL | Vikas         | Delhi  | Books       | SQL Book |        7 |   900.00 |   200.00 | 2026-01-25 | net banking    | completed | regular       |
|    NULL | Anjali        | Mumbai | Electronics | Watch    |        3 |  7000.00 |   800.00 | 2026-01-27 | card           | completed | premium       |
|    NULL | Saurabh       | Pune   | Grocery     | Rice     |       12 |   900.00 |   500.00 | 2026-02-01 | upi            | completed | regular       |
|    NULL | Riya          | Delhi  | Electronics | AC       |        2 | 45000.00 |  5000.00 | 2026-02-03 | card           | completed | premium       |
|    NULL | Manish        | Indore | Clothing    | Shirt    |        6 |  1500.00 |   300.00 | 2026-02-05 | upi            | completed | new           |
|    NULL | Komal         | Bhopal | Furniture   | Chair    |        3 |  8000.00 |  1000.00 | 2026-02-07 | cash           | completed | premium       |
|    NULL | Deepak        | Mumbai | Electronics | Speaker  |        5 |  3000.00 |   500.00 | 2026-02-12 | card           | cancelled | regular       |
+---------+---------------+--------+-------------+----------+----------+----------+----------+------------+----------------+-----------+---------------+
15 rows in set (0.00 sec)

mysql> select city,count(*) from sales where quantity>2 group by city order by count(*) desc;
+--------+----------+
| city   | count(*) |
+--------+----------+
| Bhopal |        3 |
| Indore |        3 |
| Mumbai |        3 |
| Delhi  |        2 |
| Pune   |        1 |
+--------+----------+
5 rows in set (0.00 sec)


mysql> select city,count(*) from sales where status='completed' and quantity>2 group by city order by count(*) desc;
+--------+----------+
| city   | count(*) |
+--------+----------+
| Bhopal |        3 |
| Indore |        3 |
| Mumbai |        2 |
| Delhi  |        2 |
| Pune   |        1 |
+--------+----------+
5 rows in set (0.00 sec)


mysql> select category, sum(quantity) as count_quantity from sales where discount>300 group by category order by count_quantity desc ;
+-------------+----------------+
| category    | count_quantity |
+-------------+----------------+
| Electronics |             16 |
| Grocery     |             12 |
| Clothing    |             11 |
| Beauty      |              8 |
| Sports      |              4 |
| Furniture   |              3 |
+-------------+----------------+
6 rows in set (0.01 sec)



mysql> select city, sum(price* quantity) as Total_sales from sales where status='Completed' group by city order by total_sales desc;
+--------+-------------+
| city   | Total_sales |
+--------+-------------+
| Indore |   153000.00 |
| Delhi  |   107100.00 |
| Bhopal |   105000.00 |
| Pune   |    65800.00 |
| Mumbai |    27400.00 |
+--------+-------------+
5 rows in set (0.00 sec)

mysql> select category, avg(price) as Total_sales from sales where quantity>=3 group by category order by total_sales desc;
+-------------+--------------+
| category    | Total_sales  |
+-------------+--------------+
| Electronics | 11666.666667 |
| Furniture   |  8000.000000 |
| Sports      |  3500.000000 |
| Clothing    |  1766.666667 |
| Books       |   900.000000 |
| Grocery     |   900.000000 |
| Beauty      |   700.000000 |
+-------------+--------------+
7 rows in set (0.00 sec)

mysql> select customer_type, count(*) from sales where (quantity*price)>=5000 group by customer_type order by count(*) desc;
+---------------+----------+
| customer_type | count(*) |
+---------------+----------+
| premium       |        6 |
| regular       |        6 |
| new           |        3 |
+---------------+----------+
3 rows in set (0.00 sec)

mysql> select city,sum(discount) as total_discount from sales where payment_method='UPI' group by city order by total_discount desc;
+--------+----------------+
| city   | total_discount |
+--------+----------------+
| Bhopal |        3300.00 |
| Delhi  |         600.00 |
| Pune   |         500.00 |
| Mumbai |         400.00 |
| Indore |         300.00 |
+--------+----------------+
5 rows in set (0.00 sec)

mysql> select payment_method, sum(quantity) as total_quantity from sales where status='completed' group by payment_method order by total_quantity desc;
+----------------+----------------+
| payment_method | total_quantity |
+----------------+----------------+
| upi            |             45 |
| cash           |             12 |
| card           |              8 |
| net banking    |              7 |
+----------------+----------------+
4 rows in set (0.00 sec)

mysql> select category, avg(discount) as total_discount from sales where quantity>4  group by category order by total_discount desc;
+-------------+----------------+
| category    | total_discount |
+-------------+----------------+
| Grocery     |     500.000000 |
| Electronics |     500.000000 |
| Clothing    |     466.666667 |
| Beauty      |     350.000000 |
| Books       |     200.000000 |
+-------------+----------------+
5 rows in set (0.00 sec)

mysql> select city,  max(price) as max_price from sales where status='completed'  group by city order by max_price desc;
+--------+-----------+
| city   | max_price |
+--------+-----------+
| Indore |  60000.00 |
| Pune   |  55000.00 |
| Delhi  |  45000.00 |
| Bhopal |  25000.00 |
| Mumbai |   7000.00 |
+--------+-----------+
5 rows in set (0.00 sec)

mysql> select category,  min(price) as min_price from sales where discount>300  group by category order by min_price;
+-------------+-----------+
| category    | min_price |
+-------------+-----------+
| Beauty      |    800.00 |
| Grocery     |    900.00 |
| Clothing    |   1800.00 |
| Electronics |   3000.00 |
| Sports      |   3500.00 |
| Furniture   |   8000.00 |
+-------------+-----------+
6 rows in set (0.00 sec)

mysql> select city, count(*) as completed_sales from sales where status='Completed'  group by city having count(*)>2 order by completed_sales desc;
+--------+-----------------+
| city   | completed_sales |
+--------+-----------------+
| Indore |               4 |
| Bhopal |               3 |
| Delhi  |               3 |
+--------+-----------------+
3 rows in set (0.00 sec)


mysql> select category, sum(quantity) as total_quantity from sales  group by category having sum(quantity)>10 order by total_quantity desc;
+-------------+----------------+
| category    | total_quantity |
+-------------+----------------+
| Beauty      |             18 |
| Clothing    |             17 |
| Electronics |             16 |
| Grocery     |             12 |
+-------------+----------------+
4 rows in set (0.00 sec)

mysql> select city, sum(quantity*price) as total_sales from sales where group by city having sum(quantity*price)>50000 order by total_sales desc;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'group by city having sum(quantity*price)>50000 order by total_sales desc' at line 1
mysql> select city, sum(quantity*price) as total_sales from sales group by city having sum(quantity*price)>50000 order by total_sales desc;
+--------+-------------+
| city   | total_sales |
+--------+-------------+
| Indore |   153000.00 |
| Delhi  |   107100.00 |
| Bhopal |   105000.00 |
| Pune   |    65800.00 |
+--------+-------------+
4 rows in set (0.00 sec)

mysql> select customer_type, avg(price) as product_price from sales group by customer_type having avg(price)>10000 order by product_price desc;
+---------------+---------------+
| customer_type | product_price |
+---------------+---------------+
| premium       |  20433.333333 |
| regular       |  14716.666667 |
+---------------+---------------+
2 rows in set (0.00 sec)

mysql> select category, avg(discount) as avg_discount from sales group by category having avg(discount)>400 order by avg_discount desc;
+-------------+--------------+
| category    | avg_discount |
+-------------+--------------+
| Electronics |  3050.000000 |
| Furniture   |  1000.000000 |
| Sports      |   700.000000 |
| Grocery     |   500.000000 |
| Clothing    |   466.666667 |
+-------------+--------------+
5 rows in set (0.00 sec)

mysql> select payment_method, count(*) as transaction_completed from sales where status='completed' group by payment_method having count(*)>2 order by transaction_completed desc;
+----------------+-----------------------+
| payment_method | transaction_completed |
+----------------+-----------------------+
| upi            |                     6 |
| card           |                     4 |
| cash           |                     3 |
+----------------+-----------------------+
3 rows in set (0.00 sec)

mysql> select city, max(price) as total_price from sales where price>20000 group by city order by total_price desc;
+--------+-------------+
| city   | total_price |
+--------+-------------+
| Indore |    60000.00 |
| Pune   |    55000.00 |
| Delhi  |    45000.00 |
| Bhopal |    25000.00 |
+--------+-------------+
4 rows in set (0.00 sec)

mysql> select category, min(price) as total_price from sales where price<2000 group by category order by total_price;
+----------+-------------+
| category | total_price |
+----------+-------------+
| Beauty   |      600.00 |
| Books    |      900.00 |
| Grocery  |      900.00 |
| Clothing |     1500.00 |
+----------+-------------+
4 rows in set (0.00 sec)

mysql> select customer_type, sum(dsicount) as total_discount from sales group by customer_type having sum(discount)>2000 order by total_discount desc;
ERROR 1054 (42S22): Unknown column 'dsicount' in 'field list'
mysql> select customer_type, sum(discount) as total_discount from sales group by customer_type having sum(discount)>2000 order by total_discount desc;
+---------------+----------------+
| customer_type | total_discount |
+---------------+----------------+
| premium       |       12800.00 |
| regular       |        8900.00 |
+---------------+----------------+
2 rows in set (0.00 sec)

mysql> select city, avg(quantity) as per_qua from sales group by city having avg(quantity)>4 order by per_qua desc;
+--------+---------+
| city   | per_qua |
+--------+---------+
| Pune   |  6.5000 |
| Bhopal |  5.3333 |
| Mumbai |  5.3333 |
| Delhi  |  5.0000 |
| Indore |  4.2500 |
+--------+---------+
5 rows in set (0.00 sec)

mysql> select city, sum(quantity*price) as total_sales from sales where status='completed' and payment_method='UPI' and quantity>2   group by city having sum(quantity*price)>10000 order by total_sales desc;
+--------+-------------+
| city   | total_sales |
+--------+-------------+
| Bhopal |    81000.00 |
| Delhi  |    10800.00 |
| Pune   |    10800.00 |
+--------+-------------+
3 rows in set (0.00 sec)

mysql> select category, sum(quantity) as total_quantity from sales where discount>300 group by category having sum(quantity)>5 order by total_quantity;
+-------------+----------------+
| category    | total_quantity |
+-------------+----------------+
| Beauty      |              8 |
| Clothing    |             11 |
| Grocery     |             12 |
| Electronics |             16 |
+-------------+----------------+
4 rows in set (0.00 sec)

mysql> select category, sum(quantity) as total_quantity from sales where status='completed' and discount>300 group by category having sum(quantity)>5 order by total_quantity;
+-------------+----------------+
| category    | total_quantity |
+-------------+----------------+
| Beauty      |              8 |
| Electronics |             11 |
| Clothing    |             11 |
| Grocery     |             12 |
+-------------+----------------+
4 rows in set (0.00 sec)

mysql> select customer_type, avg(price) as avg_price from sales where quantity>=2 group by customer_type having avg(price)>10000;
+---------------+--------------+
| customer_type | avg_price    |
+---------------+--------------+
| premium       | 20433.333333 |
+---------------+--------------+
1 row in set (0.00 sec)

mysql> select city, sum(discount) as per_qua from sales where quantity>3 and method_type='UPI' group by city having sum(discount)>500;
ERROR 1054 (42S22): Unknown column 'method_type' in 'where clause'
mysql> select city, sum(discount) as per_qua from sales where quantity>3 and payment_method ='UPI' group by city having sum(discount)>500;
+-------+---------+
| city  | per_qua |
+-------+---------+
| Delhi |  600.00 |
+-------+---------+
1 row in set (0.00 sec)

mysql> select category, sum(price) as total_quantity from sales where status='completed' and payment_method ='UPI' group by category having sum(price)>10000;
+-------------+----------------+
| category    | total_quantity |
+-------------+----------------+
| Electronics |       25000.00 |
+-------------+----------------+
1 row in set (0.00 sec)

mysql> select category, sum(price*quantity) as total_quantity from sales where status='completed' and payment_method ='UPI' group by category having sum(price*quantity)>10000;
+-------------+----------------+
| category    | total_quantity |
+-------------+----------------+
| Electronics |       75000.00 |
| Beauty      |       12400.00 |
| Clothing    |       19800.00 |
| Grocery     |       10800.00 |
+-------------+----------------+
4 rows in set (0.00 sec)

mysql> select category, sum(price*quantity) as total_quantity from sales where status='completed' and payment_method in ('UPI','Card') group by category having sum(price*quantity)>10000 order by total_quantity desc;
+-------------+----------------+
| category    | total_quantity |
+-------------+----------------+
| Electronics |      361000.00 |
| Clothing    |       19800.00 |
| Beauty      |       12400.00 |
| Grocery     |       10800.00 |
+-------------+----------------+
4 rows in set (0.00 sec)

mysql> select city, count(*) as count_trans from sales where status ='completed' and sale_date>='2026-01-01' and sale_date<'2026-02-01' group by city having count(*)>=2 order by transaction_count desc;
ERROR 1054 (42S22): Unknown column 'transaction_count' in 'order clause'
mysql> select city, count(*) as count_trans from sales where status ='completed' and sale_date>='2026-01-01' and sale_date<'2026-02-01' group by city having count(*)>=2 order by count_trans desc;
+--------+-------------+
| city   | count_trans |
+--------+-------------+
| Indore |           3 |
| Bhopal |           2 |
| Mumbai |           2 |
| Delhi  |           2 |
+--------+-------------+
4 rows in set (0.00 sec)

mysql> select category, avg(price*quantity) as total_sale from sales where quantity>=3 and status='completed' group by category having avg(price*quantity)>5000;
+-------------+--------------+
| category    | total_sale   |
+-------------+--------------+
| Electronics | 48000.000000 |
| Clothing    |  9933.333333 |
| Beauty      |  6200.000000 |
| Sports      | 14000.000000 |
| Books       |  6300.000000 |
| Grocery     | 10800.000000 |
| Furniture   | 24000.000000 |
+-------------+--------------+
7 rows in set (0.00 sec)

mysql> select customer_type, max(price) as max_price from sales where payment_method ='card' and status='completed' group by customer_type having max(price)>20000;
+---------------+-----------+
| customer_type | max_price |
+---------------+-----------+
| premium       |  60000.00 |
| regular       |  55000.00 |
+---------------+-----------+
2 rows in set (0.00 sec)

mysql> select city, sum(quantity) as sum_quantity from sales where category in('electronics' ,'clothing') and status ='completed' group by city having sum(quantity)>5;
+--------+--------------+
| city   | sum_quantity |
+--------+--------------+
| Indore |           13 |
| Delhi  |            8 |
+--------+--------------+
2 rows in set (0.00 sec)

mysql> select payment_method,sum(price*quantity) from sales where status='completed' and discount>400 group by payment_method having sum(price*quantity)>20000;
+----------------+---------------------+
| payment_method | sum(price*quantity) |
+----------------+---------------------+
| card           |           286000.00 |
| upi            |            96600.00 |
| cash           |            48000.00 |
+----------------+---------------------+
3 rows in set (0.00 sec)

mysql> select city, count(*) as transaction_count, sum(quantity*price) as total_sales from sales where status='completed' group by city having count(*)>2 and sum(quantity*price)>50000 order by total_sales desc;
+--------+-------------------+-------------+
| city   | transaction_count | total_sales |
+--------+-------------------+-------------+
| Indore |                 4 |   153000.00 |
| Delhi  |                 3 |   107100.00 |
| Bhopal |                 3 |   105000.00 |
+--------+-------------------+-------------+
3 rows in set (0.00 sec)

mysql> select category, sum(quantity) as total_quantity, avg(price) as avg_price from sales group by city having sum(quantity)>8 and avg(price)>2000 order by total_quantity desc;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'dbms.sales.category' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> select category, sum(quantity) as total_quantity, avg(price) as avg_price from sales group by category having sum(quantity)>8 and avg(price)>2000 order by total_quantity desc;
+-------------+----------------+--------------+
| category    | total_quantity | avg_price    |
+-------------+----------------+--------------+
| Electronics |             16 | 32500.000000 |
+-------------+----------------+--------------+
1 row in set (0.00 sec)

mysql> SELECT customer_type,
    ->        COUNT(*) AS transaction_count,
    ->        SUM(discount) AS total_discount
    -> FROM sales
    -> GROUP BY customer_type
    -> HAVING COUNT(*) > 2
    ->    AND SUM(discount) > 2000
    -> ORDER BY total_discount DESC;
+---------------+-------------------+----------------+
| customer_type | transaction_count | total_discount |
+---------------+-------------------+----------------+
| premium       |                 6 |       12800.00 |
| regular       |                 6 |        8900.00 |
+---------------+-------------------+----------------+
2 rows in set (0.00 sec)

mysql> SELECT customer_type,
    ->        COUNT(*) AS transaction_count,
    ->        SUM(discount) AS total_discount
    -> FROM sales
    -> GROUP BY customer_type
    -> HAVING COUNT(*) > 2
    ->    AND SUM(discount) > 2000
    -> ORDER BY total_discount DESC;
+---------------+-------------------+----------------+
| customer_type | transaction_count | total_discount |
+---------------+-------------------+----------------+
| premium       |                 6 |       12800.00 |
| regular       |                 6 |        8900.00 |
+---------------+-------------------+----------------+
2 rows in set (0.00 sec)

mysql> SELECT city,
    ->        AVG(quantity) AS average_quantity,
    ->        MAX(price) AS maximum_price
    -> FROM sales
    -> GROUP BY city
    -> HAVING AVG(quantity) > 3
    ->    AND MAX(price) > 20000
    -> ORDER BY average_quantity DESC;
+--------+------------------+---------------+
| city   | average_quantity | maximum_price |
+--------+------------------+---------------+
| Pune   |           6.5000 |      55000.00 |
| Bhopal |           5.3333 |      25000.00 |
| Delhi  |           5.0000 |      45000.00 |
| Indore |           4.2500 |      60000.00 |
+--------+------------------+---------------+
4 rows in set (0.00 sec)

mysql> SELECT category,
    ->        COUNT(*) AS transaction_count,
    ->        SUM(quantity * price) AS total_sales
    -> FROM sales
    -> WHERE status = 'Completed'
    -> GROUP BY category
    -> HAVING COUNT(*) > 2
    ->    AND SUM(quantity * price) > 20000
    -> ORDER BY total_sales DESC;
+-------------+-------------------+-------------+
| category    | transaction_count | total_sales |
+-------------+-------------------+-------------+
| Electronics |                 5 |   361000.00 |
| Clothing    |                 3 |    29800.00 |
+-------------+-------------------+-------------+
2 rows in set (0.00 sec)

mysql> SELECT payment_method,
    ->        COUNT(*) AS transaction_count,
    ->        AVG(price) AS average_price
    -> FROM sales
    -> WHERE status = 'Completed'
    -> GROUP BY payment_method
    -> HAVING COUNT(*) > 2
    ->    AND AVG(price) > 10000
    -> ORDER BY average_price DESC;
+----------------+-------------------+---------------+
| payment_method | transaction_count | average_price |
+----------------+-------------------+---------------+
| card           |                 4 |  41750.000000 |
+----------------+-------------------+---------------+
1 row in set (0.00 sec)

mysql> SELECT city,
    ->        SUM(quantity) AS total_quantity,
    ->        AVG(discount) AS average_discount
    -> FROM sales
    -> GROUP BY city
    -> HAVING SUM(quantity) > 8
    ->    AND AVG(discount) > 300
    -> ORDER BY total_quantity DESC;
+--------+----------------+------------------+
| city   | total_quantity | average_discount |
+--------+----------------+------------------+
| Indore |             17 |      1625.000000 |
| Bhopal |             16 |      1433.333333 |
| Mumbai |             16 |       566.666667 |
| Delhi  |             15 |      1933.333333 |
| Pune   |             13 |      2250.000000 |
+--------+----------------+------------------+
5 rows in set (0.00 sec)

mysql> SELECT customer_type,
    ->        AVG(price) AS average_price,
    ->        SUM(quantity) AS total_quantity
    -> FROM sales
    -> GROUP BY customer_type
    -> HAVING AVG(price) > 5000
    ->    AND SUM(quantity) > 8
    -> ORDER BY total_quantity DESC;
+---------------+---------------+----------------+
| customer_type | average_price | total_quantity |
+---------------+---------------+----------------+
| regular       |  14716.666667 |             32 |
| premium       |  20433.333333 |             24 |
+---------------+---------------+----------------+
2 rows in set (0.00 sec)

mysql> SELECT category,
    ->        MIN(price) AS minimum_price,
    ->        MAX(price) AS maximum_price
    -> FROM sales
    -> GROUP BY category
    -> HAVING MIN(price) < 2000
    ->    AND MAX(price) > 20000
    -> ORDER BY maximum_price DESC;
Empty set (0.00 sec)

mysql> SELECT city,
    ->        SUM(discount) AS total_discount,
    ->        SUM(quantity * price) AS total_sales
    -> FROM sales
    -> GROUP BY city
    -> HAVING SUM(discount) > 1000
    ->    AND SUM(quantity * price) > 30000
    -> ORDER BY total_sales DESC;
+--------+----------------+-------------+
| city   | total_discount | total_sales |
+--------+----------------+-------------+
| Indore |        6500.00 |   153000.00 |
| Delhi  |        5800.00 |   107100.00 |
| Bhopal |        4300.00 |   105000.00 |
| Pune   |        4500.00 |    65800.00 |
| Mumbai |        1700.00 |    42400.00 |
+--------+----------------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT city,
    ->        COUNT(*) AS transaction_count,
    ->        SUM(quantity * price) AS total_sales
    -> FROM sales
    -> WHERE status = 'Completed'
    ->   AND quantity > 1
    -> GROUP BY city
    -> HAVING COUNT(*) > 1
    -> ORDER BY total_sales DESC
    -> LIMIT 3;
+--------+-------------------+-------------+
| city   | transaction_count | total_sales |
+--------+-------------------+-------------+
| Indore |                 4 |   153000.00 |
| Delhi  |                 3 |   107100.00 |
| Bhopal |                 3 |   105000.00 |
+--------+-------------------+-------------+
3 rows in set (0.00 sec)

mysql> SELECT city,
    ->        COUNT(*) AS transaction_count,
    ->        SUM(quantity * price) AS total_sales
    -> FROM sales
    -> WHERE status = 'Completed'
    ->   AND quantity > 1
    -> GROUP BY city
    -> HAVING COUNT(*) > 1
    -> ORDER BY total_sales DESC
    -> LIMIT 3;
+--------+-------------------+-------------+
| city   | transaction_count | total_sales |
+--------+-------------------+-------------+
| Indore |                 4 |   153000.00 |
| Delhi  |                 3 |   107100.00 |
| Bhopal |                 3 |   105000.00 |
+--------+-------------------+-------------+
3 rows in set (0.00 sec)

mysql> SELECT category,
    ->        SUM(quantity) AS total_quantity
    -> FROM sales
    -> WHERE discount > 300
    -> GROUP BY category
    -> HAVING SUM(quantity) > 5
    -> ORDER BY total_quantity DESC
    -> LIMIT 3;
+-------------+----------------+
| category    | total_quantity |
+-------------+----------------+
| Electronics |             16 |
| Grocery     |             12 |
| Clothing    |             11 |
+-------------+----------------+
3 rows in set (0.00 sec)

mysql> SELECT customer_type,
    ->        AVG(quantity * price) AS average_sales_amount,
    ->        COUNT(*) AS transaction_count
    -> FROM sales
    -> WHERE status = 'Completed'
    -> GROUP BY customer_type
    -> HAVING COUNT(*) > 1
    -> ORDER BY average_sales_amount DESC
    -> LIMIT 3;
+---------------+----------------------+-------------------+
| customer_type | average_sales_amount | transaction_count |
+---------------+----------------------+-------------------+
| premium       |         45366.666667 |                 6 |
| regular       |         32220.000000 |                 5 |
| new           |          8333.333333 |                 3 |
+---------------+----------------------+-------------------+
3 rows in set (0.00 sec)

mysql> SELECT city,
    ->        SUM(discount) AS total_discount
    -> FROM sales
    -> WHERE payment_method = 'UPI'
    ->   AND status = 'Completed'
    -> GROUP BY city
    -> HAVING SUM(discount) > 500
    -> ORDER BY total_discount DESC
    -> LIMIT 3;
+--------+----------------+
| city   | total_discount |
+--------+----------------+
| Bhopal |        3300.00 |
| Delhi  |         600.00 |
+--------+----------------+
2 rows in set (0.00 sec)

mysql> SELECT city,
    ->        SUM(discount) AS total_discount
    -> FROM sales
    -> WHERE payment_method = 'UPI'
    ->   AND status = 'Completed'
    -> GROUP BY city
    -> HAVING SUM(discount) > 500
    -> ORDER BY total_discount DESC
    -> LIMIT 3;
+--------+----------------+
| city   | total_discount |
+--------+----------------+
| Bhopal |        3300.00 |
| Delhi  |         600.00 |
+--------+----------------+
2 rows in set (0.00 sec)

mysql> SELECT category,
    ->        SUM(quantity * price) AS total_sales,
    ->        AVG(price) AS average_price
    -> FROM sales
    -> WHERE quantity > 2
    -> GROUP BY category
    -> HAVING AVG(price) > 1000
    ->    AND SUM(quantity * price) > 10000
    -> ORDER BY total_sales DESC
    -> LIMIT 3;
+-------------+-------------+---------------+
| category    | total_sales | average_price |
+-------------+-------------+---------------+
| Electronics |   111000.00 |  11666.666667 |
| Clothing    |    29800.00 |   1766.666667 |
| Furniture   |    24000.00 |   8000.000000 |
+-------------+-------------+---------------+
3 rows in set (0.00 sec)

mysql> SELECT city,
    ->        AVG(quantity * price) AS average_order_value,
    ->        SUM(quantity) AS total_quantity,
    ->        COUNT(*) AS transaction_count
    -> FROM sales
    -> WHERE status = 'Completed'
    -> GROUP BY city
    -> HAVING SUM(quantity) > 5
    ->    AND COUNT(*) > 1
    -> ORDER BY average_order_value DESC
    -> LIMIT 3;
+--------+---------------------+----------------+-------------------+
| city   | average_order_value | total_quantity | transaction_count |
+--------+---------------------+----------------+-------------------+
| Indore |        38250.000000 |             17 |                 4 |
| Delhi  |        35700.000000 |             15 |                 3 |
| Bhopal |        35000.000000 |             16 |                 3 |
+--------+---------------------+----------------+-------------------+
3 rows in set (0.00 sec)

mysql> SELECT city,
    ->        SUM(quantity * price) AS total_sales,
    ->        COUNT(*) AS transaction_count
    -> FROM sales
    -> WHERE status = 'Completed'
    -> GROUP BY city
    -> HAVING COUNT(*) >= 2
    -> ORDER BY total_sales DESC
    -> LIMIT 1 OFFSET 1;
+-------+-------------+-------------------+
| city  | total_sales | transaction_count |
+-------+-------------+-------------------+
| Delhi |   107100.00 |                 3 |
+-------+-------------+-------------------+
1 row in set (0.00 sec)

mysql> SELECT category,
    ->        SUM(quantity) AS total_quantity,
    ->        SUM(discount) AS total_discount
    -> FROM sales
    -> WHERE quantity > 2
    -> GROUP BY category
    -> HAVING SUM(discount) > 500
    -> ORDER BY total_quantity DESC
    -> LIMIT 1 OFFSET 2;
+-------------+----------------+----------------+
| category    | total_quantity | total_discount |
+-------------+----------------+----------------+
| Electronics |             11 |        4300.00 |
+-------------+----------------+----------------+
1 row in set (0.00 sec)

mysql> SELECT customer_type,
    ->        SUM(quantity * price) AS total_sales,
    ->        AVG(price) AS average_price
    -> FROM sales
    -> WHERE status = 'Completed'
    -> GROUP BY customer_type
    -> HAVING AVG(price) > 5000
    -> ORDER BY total_sales DESC
    -> LIMIT 2 OFFSET 1;
+---------------+-------------+---------------+
| customer_type | total_sales | average_price |
+---------------+-------------+---------------+
| regular       |   161100.00 |  17060.000000 |
+---------------+-------------+---------------+
1 row in set (0.00 sec)

mysql> SELECT city,
    ->        COUNT(*) AS transaction_count,
    ->        SUM(quantity) AS total_quantity,
    ->        SUM(quantity * price) AS total_sales
    -> FROM sales
    -> WHERE status = 'Completed'
    ->   AND payment_method IN ('UPI', 'Card')
    ->   AND quantity > 1
    -> GROUP BY city
    -> HAVING COUNT(*) > 1
    ->    AND SUM(quantity) > 5
    ->    AND SUM(quantity * price) > 20000
    -> ORDER BY total_sales DESC
    -> LIMIT 3;
+--------+-------------------+----------------+-------------+
| city   | transaction_count | total_quantity | total_sales |
+--------+-------------------+----------------+-------------+
| Indore |                 2 |              8 |   129000.00 |
| Delhi  |                 2 |              8 |   100800.00 |
| Bhopal |                 2 |             13 |    81000.00 |
+--------+-------------------+----------------+-------------+
3 rows in set (0.00 sec)

mysql>