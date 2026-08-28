# Advantages of DBMS

1. **Data Redundancy :** A DBMS minimize 
2. **Maintains Data Consistency :** When data is updated in one place then changes are reflected everywhere, which ensures consistency.
3. **Provides Data Security :** DBMS allow authentication, user roles and access permissions to protect sensitive data. ****
4. **Fast Data Retrieval :** Data can be searched and retrieved quickly using SQL queries and indexing.
5. **Supports Multi-user Access :** Multiple users can access and work on the same Database simultaneously without conflicts
6. **Ensures Data Integrity :** Constraints such as Primary Key, Foreign Key, Unique, Check Constraints help to maintain accurate and valid data. 
7. **Backup and Recovery :** DBMS provides mechanism to backup data and recover it in case of system failure.
8. **Data Sharing :** Authorized users and applications can easily share and access the same data.
9. **Data Independence :** Changes in the database structure have minimal impact on application programs.
10. **Better Data Management :** All data stored and managed in a centralized and organized manner. ****
11. **Improved Performance :** Techniques such as indexing and query optimization improve the performance of data retrieval.
12. **Scalability :** DBMS can efficiently handle growing volumes of data and increasing numbers of users.
13. **Reduce application development time**

# Types of Database

Databases can be classified into following categories.

## 1. Hierarchical Database Management System

- A hierarchical database stores data in a tree like structure where each parent record can have multiple child records.
- It follows One-To-Many relationship.
- **Example :** IBM (IMS)
- **Application :**
1. Windows Registry System.
2. File System Directory Structure.
3. Government Administrative Systems.

## 2. Network Database Management System

- A network database stores data in a graph like structure, where record can have multiple parent and child records.
- It supports Many-To-Many Relationship.
- **Example :** IDS (Integrated Data Store)
- **Application :**
1. Airline reservation Systems.
2. Telecommunication Networks.
3. Supply Chain Management.

## 3. Object Oriented Database Management System

- An Object Oriented Database stores data in the form of objects.
- Similar to Object Oriented Programming Language.
- Each Object contains data and methods.
- **Example :** ObjectDB, DB4O
- **Applications :**
1. CAD/CAM Softwares
2. Engineering Simulations 
3. Multimedia Applications

## 4. No-SQL Database Management System

- No-SQL Database is designed to store semi-structured and unstructured data.
- Unlike Relational Database, It does not require a fixed table structure.
- **Example :** MongoDB, Redis, Apache Cassandra, NEO4J
- **Applications :**
1. Social Media Platforms
2. Real-time chat applications 
3. Big Data Analytics 
4. Internet Of Things
5. Recommendation System

## 5. Distributed Database Management System

- A distributed database stores data across multiple physical servers located at different locations, while appear as a single logical database to user.
- **Example :** Google Spanner
- **Applications :**
1. Global Banking Systems
2. International E-Commerce Platforms

## 6. Cloud Database Management System

- A cloud database is a database hosted on cloud infrastructure and accessed over the internet.
- It provides automatic back-up, high availability
- **Example :** Azure SQL Database, Google Cloud SQL
- **Applications :**
1. Online Learning Platforms
2. Software as a Service Applications (SAAS)

## 7. Relational Database Management System

- A RDBMS is a type of Database Management System that stores data in the form of tables (Relations), consisting of rows and columns.
- It establish relationship between tables using Primary Keys and Foreign Keys to ensure Data Accuracy, consistency and integrity.

### Features Of RDBMS

1. It stores data in tables (rows and columns)
2. It supports relationship between table.
3. It reduce data redundancy.
4. It maintains data consistency.
5. It enforce data integrity using constraints.
6. It supports ACID transactions.
7. It supports multiple users simultaneously.
8. It offers back-up and recovery.

### Examples Of RDBMS

1. MySQL
2. PostGreSQL
3. Oracle Database
4. Microsoft SQL Server
5. IBMDB2
6. MariaDB

### Applications Of RDBMS

1. Banking 
2. E-commerce
3. Hospital
4. ERP Systems etc.

### D/B DBMS & RDBMS

|  | **DBMS** | **RDBMS** |
| --- | --- | --- |
|  **1.**  | DBMS is a general software used to manage database. | But RDBMS is an advanced type of DBMS that stores data in related tables. |
| **2.** | Every RDBMS is a DBMS | But every DBMS is not an RDBMS. |
| **3.** | In case of DBMS, Data may be stored in files. | But in RDBMS data is stored in tables. |

## Types of SQL Languages

# Structured Query Language (SQL)