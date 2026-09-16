



 Create table Employee(emp_id int primary key auto_increment,emp_name varchar(50) Not null,email varchar(100) not null unique,phone varchar(15) Not null unique,department varchar(30) not null, designation varchar(30) not null, age int not null check(age between 21 and 60), salary decimal(10,2) not null check(salary>15000), experience int not null check(experience between 0 and 35) , joining_year int not null, status varchar(20) not null check (status in('Active','Inactive','On leave')), bonus decimal (10,2) not null check (bonus>=0),check(experience <=age-21), check(experience>=10 and salary>=50000), check(department='IT' and designation in ('developer','Tester','Team Lead'))