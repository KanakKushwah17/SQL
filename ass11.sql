EMPLOYEE PAYROLL AND JOB MANAGEMENT SYSTEM

A company wants to maintain employee information in MySQL. You have been asked to design an employee table that strictly enforces the company's data rules using NOT NULL, UNIQUE and CHECK constraints.

1. CREATE THE EMPLOYEE TABLE

Create a table named employee with the following columns.

emp_id
INT
Employee ID, Primary Key, Auto Increment

emp_name
VARCHAR(50)
Mandatory

email
VARCHAR(100)
Mandatory and must be unique

phone
VARCHAR(15)
Mandatory and must be unique

department
VARCHAR(30)
Mandatory

designation
VARCHAR(30)
Mandatory

age
INT
Mandatory, employee must be between 21 and 60

salary
DECIMAL(10,2)
Mandatory, salary must be greater than 15000

experience
INT
Mandatory, experience must be between 0 and 35 years

joining_year
INT
Mandatory

status
VARCHAR(20)
Mandatory, only Active, Inactive or On Leave

bonus
DECIMAL(10,2)
Mandatory, cannot be negative


2. APPLY THE CONSTRAINTS

NOT NULL CONSTRAINTS

The following columns cannot contain NULL.

emp_name
email
phone
department
designation
age
salary
experience
joining_year
status
bonus


UNIQUE CONSTRAINTS

The following values must be unique across employees.

email
phone

Two employees cannot have the same email or phone number.


CHECK CONSTRAINTS ON INDIVIDUAL COLUMNS

1. Age must be between 21 and 60.

2. Salary must be greater than 15000.

3. Experience must be between 0 and 35 years.

4. Bonus must be greater than or equal to 0.

5. Status can only be Active, Inactive or On Leave.


3. COMBINATION CHECK CONSTRAINTS

Rule 1: Experience and Age

An employee cannot have more experience than realistically possible based on age.

Create a CHECK constraint such that:

experience must be less than or equal to age minus 21.

Example:

Age 25 and Experience 4 is valid.

Age 25 and Experience 10 is invalid.


Rule 2: Salary and Experience

Employees with more experience must have an appropriate minimum salary.

If experience is greater than or equal to 10, salary must be greater than or equal to 50000.

Example:

Experience 12 and Salary 60000 is valid.

Experience 12 and Salary 35000 is invalid.


Rule 3: Department and Designation

The company allows only certain designation combinations.

IT
Developer
Tester
Team Lead

HR
HR Executive
HR Manager

Finance
Accountant
Finance Manager

Sales
Sales Executive
Sales Manager

Examples:

IT and Developer is valid.

IT and HR Manager is invalid.

HR and Developer is invalid.

Finance and Accountant is valid.

Implement this using a CHECK constraint involving both department and designation.


Rule 4: Status and Bonus

Business rules:

Active employees can receive bonus.

Inactive employees must have bonus equal to 0.

On Leave employees can have a bonus, but it cannot exceed 20 percent of salary.

Examples:

Active with salary 50000 and bonus 10000 is valid.

Inactive with salary 50000 and bonus 5000 is invalid.

Inactive with salary 50000 and bonus 0 is valid.

On Leave with salary 50000 and bonus 10000 is valid.

On Leave with salary 50000 and bonus 15000 is invalid.


Rule 5: Joining Year and Experience

Assume the current year is 2026.

The employee's experience cannot be greater than the number of years since joining.

Example:

Joining year 2020 and Experience 6 is valid.

Joining year 2020 and Experience 10 is invalid.

Joining year cannot be greater than 2026.


4. INSERT VALID RECORDS

Insert at least 10 valid employees satisfying all constraints simultaneously.

Your records should cover:

Multiple departments
Multiple designations
Different experience levels
Different salary ranges
All three statuses
Different bonus values


5. CONSTRAINT TESTING

After inserting valid records, deliberately execute at least 12 invalid INSERT statements.

NOT NULL TESTING

Try inserting NULL into emp_name.

Try inserting NULL into email.

Try inserting NULL into salary.


UNIQUE TESTING

Try inserting a duplicate email.

Try inserting a duplicate phone number.


INDIVIDUAL CHECK TESTING

Try age equal to 18.

Try salary equal to 10000.

Try experience equal to -2.

Try bonus equal to -500.

Try status equal to Retired.


COMBINATION CHECK TESTING

Test age 25 and experience 10.

Test experience 12 and salary 35000.

Test department IT and designation HR Manager.

Test status Inactive and bonus 5000.

Test status On Leave, salary 50000 and bonus 15000.

Test joining year 2020 and experience 10.

Test joining year 2027.


































 Create table Employee(emp_id int primary key auto_increment,emp_name varchar(50) Not null,email varchar(100) not null unique,phone varchar(15) Not null unique,department varchar(30) not null, designation varchar(30) not null, age int not null check(age between 21 and 60), salary decimal(10,2) not null check(salary>15000), experience int not null check(experience between 0 and 35) , joining_year int not null, status varchar(20) not null check (status in('Active','Inactive','On leave')), bonus decimal (10,2) not null check (bonus>=0),check(experience <=age-21), check(experience>=10 and salary>=50000), check(department='IT' and designation in ('developer','Tester','Team Lead'))