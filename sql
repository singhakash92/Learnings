database:  storage that's optimized for asking questions.
 When you write a SQL query, you're basically saying: 
 "Hey database, give me this data, from this table, where these conditions are true."

table

employee
 ------------------------------------------
|  id | name | salary | Dept | manager_id  |
 ------------------------------------------


1)DDL(Data definition Language): used to create, alter, drop DB objects(Schema, table, view, indexes)
CREATE, ALTER, DROP, TRUNCATE, RENAME
A)CREATE

i) -- Create database myappp only if it doesn't exist
CREATE DATABASE IF NOT EXISTS myapp;

ii)
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,           -- Primary key, auto-increments
    name VARCHAR(100) NOT NULL,                      -- Cannot be empty
    email VARCHAR(100) UNIQUE,                       -- Must be unique
    salary DECIMAL(10, 2) DEFAULT 50000,             -- Default value, DECIMAL(total no of digits, scale(after decimal only scale digits not more)) 
    department VARCHAR(50),
    hire_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,   -- Auto timestamp
    managers_id INT NOT NULL,  --first define the column then makeit FK
    FOREIGN KEY (managers_id) REFERENCES users(id) ON DELETE CASCADE  --references id in users table
);



3)DML(data manipulation Language) - INSERT, UPDATE, DELETE


i) INSERT
    -- Basic insert with all columns
    INSERT INTO users (id, name, email, age) 
    VALUES (1, 'Akash Singh', 'akash@example.com', 25);

    -- Insert without specifying column names (must provide all values in order)
    INSERT INTO users 
    VALUES (2, 'Priya Sharma', 'priya@example.com', 23);

    -- Insert with fewer columns (others get default or NULL)
    INSERT INTO users (id, name, email) 
    VALUES (3, 'Rajesh Kumar', 'rajesh@example.com');
    -- age will be NULL


ii)UPDATE
    UPDATE employees 
    SET salary = salary * 1.10
    WHERE department = 'Engineering';

    -- Update multiple columns
    UPDATE employees 
    SET status = 'inactive', email = NULL
    WHERE hire_date < '2020-01-01';



iii)DELETE
    DELETE FROM employees 
    WHERE status = 'inactive' AND hire_date < '2020-01-01';


Q)ORDER BY
INSERT INTO sales VALUES
ORDER BY A, B, C;
Sort by A → if tied, sort by B → if still tied, sort by C.
(1, 'North', 'Laptop', 50000),
(2, 'North', 'Mouse', 2000),
(3, 'North', 'Keyboard', 5000),
(4, 'South', 'Laptop', 45000),
(5, 'South', 'Mouse', 2500),
(6, 'East', 'Keyboard', 4000),
(7, 'East', 'Laptop', 55000);


1)  SELECT * FROM sales 
    ORDER BY region, amount DESC;

    a) First: Sorted by region alphabetically:
    East
    North
    South
    b) Within each region, sorted by amount DESC:

region | product  | amount
-------|----------|--------
East   | Laptop   | 55000  ← Highest amount in East
East   | Keyboard | 4000
North  | Laptop   | 50000  ← Highest amount in North
North  | Keyboard | 5000
North  | Mouse    | 2000
South  | Laptop   | 45000  ← Highest amount in South
South  | Mouse    | 2500

2)  SELECT * FROM sales 
    ORDER BY region ASC, product ASC, amount DESC;

    a) Region (A-Z)
    b) within each region sort by Product (A-Z)
    c) within each region-product group sort by Amount (highest first) 



Q) GROUP BY
COUNT(*) - Count rows in each group
INSERT INTO sales VALUES
(1, 'John', 'North', 50000),
(2, 'John', 'North', 2000),
(3, 'John', 'South', 5000),
(4, 'Sarah', 'North', 55000),
(5, 'Sarah', 'North', 48000),
(6, 'Sarah', 'East', 25000),
(7, 'Mike', 'South', 48000),
(8, 'Mike', 'South', 15000);

1)  SELECT customer, region, COUNT(*) as count, SUM(amount) as total
    FROM sales
    GROUP BY customer, region;

    a) Find all unique (customer, region) combinations
    John + North
    John + South
    Sarah + North
    Sarah + East
    Mike + South
    b) Apply aggregate functions to each group
    John + North  → COUNT=2, SUM=52000 (50000+2000)
    John + South  → COUNT=1, SUM=5000
    Sarah + North → COUNT=2, SUM=103000 (55000+48000)
    Sarah + East  → COUNT=1, SUM=25000
    Mike + South  → COUNT=2, SUM=63000 (48000+15000)


    customer | region | count | total
    ---------|--------|-------|--------
    John     | North  | 2     | 52000
    John     | South  | 1     | 5000
    Sarah    | North  | 2     | 103000
    Sarah    | East   | 1     | 25000
    Mike     | South  | 2     | 63000






