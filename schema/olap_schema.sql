-- =========================================
-- OLAP Schema: Star Schema for Analytics
-- Optimized for queries and reporting
-- =========================================

CREATE TABLE dim_customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);

CREATE TABLE dim_products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2),
    cost NUMERIC(10,2)
);

CREATE TABLE dim_employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    role VARCHAR(50),
    hire_date DATE
);

CREATE TABLE dim_dates (
    date_id INT PRIMARY KEY,
    date DATE,
    year INT,
    month INT,
    day INT
);

CREATE TABLE fact_sales (
    fact_id INT PRIMARY KEY,
    order_id INT,
    customer_id INT,
    employee_id INT,
    product_id INT,
    date_id INT,
    quantity INT,
    revenue NUMERIC(10,2),
    profit NUMERIC(10,2),
    FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES dim_products(product_id),
    FOREIGN KEY (employee_id) REFERENCES dim_employees(employee_id),
    FOREIGN KEY (date_id) REFERENCES dim_dates(date_id)
);
