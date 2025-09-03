-- ==========================================================
-- OLAP Schema: Star Schema (Data Warehouse)
-- Purpose: Optimized for analytics, reporting, and BI.
-- Converts OLTP data into fact + dimension tables.
-- ==========================================================

-- ===============================
-- Dimension: Customers
-- Stores customer attributes for segmentation and analysis.
-- ===============================
CREATE TABLE dim_customer (
    customer_id INT PRIMARY KEY,         -- Matches OLTP customers.customer_id
    name VARCHAR(100),
    city VARCHAR(100),
    signup_date DATE
);

-- ===============================
-- Dimension: Products
-- Product attributes (used for category- and margin-based analysis).
-- ===============================
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,          -- Matches OLTP products.product_id
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    cost DECIMAL(10,2)
);

-- ===============================
-- Dimension: Employees
-- Sales staff attributes.
-- ===============================
CREATE TABLE dim_employee (
    employee_id INT PRIMARY KEY,         -- Matches OLTP employees.employee_id
    name VARCHAR(100),
    role VARCHAR(50),
    hire_date DATE
);

-- ===============================
-- Dimension: Date
-- Calendar dimension for time-based analysis.
-- Pre-populated with all relevant dates.
-- ===============================
CREATE TABLE dim_date (
    date_key DATE PRIMARY KEY,           -- Unique date (YYYY-MM-DD)
    year INT,
    quarter INT,
    month INT,
    day INT,
    weekday VARCHAR(10)                  -- Monday, Tuesday, etc.
);

-- ===============================
-- Fact: Sales
-- Central transaction fact table.
-- Links to all dimensions for analytics.
-- ===============================
CREATE TABLE fact_sales (
    sales_id SERIAL PRIMARY KEY,         -- Surrogate key for warehouse fact
    order_id INT,                        -- Reference to OLTP order_id (for traceability)
    customer_id INT REFERENCES dim_customer(customer_id),
    product_id INT REFERENCES dim_product(product_id),
    employee_id INT REFERENCES dim_employee(employee_id),
    date_key DATE REFERENCES dim_date(date_key), -- Date of sale (foreign key to calendar)
    quantity INT,
    revenue DECIMAL(12,2),               -- Derived = unit_price * quantity
    cost DECIMAL(12,2),                  -- Derived from product cost * quantity
    profit DECIMAL(12,2)                 -- revenue - cost
);
