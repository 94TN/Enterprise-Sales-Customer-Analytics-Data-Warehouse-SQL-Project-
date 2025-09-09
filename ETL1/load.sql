-- Load into OLAP star schema

INSERT INTO dim_customers SELECT DISTINCT * FROM customers;
INSERT INTO dim_products SELECT DISTINCT * FROM products;
INSERT INTO dim_employees SELECT DISTINCT * FROM employees;

-- Create dim_dates from order_date
INSERT INTO dim_dates (date_id, date, year, month, day)
SELECT DISTINCT
    EXTRACT(YEAR FROM order_date)*10000 + EXTRACT(MONTH FROM order_date)*100 + EXTRACT(DAY FROM order_date) AS date_id,
    order_date,
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date),
    EXTRACT(DAY FROM order_date)
FROM stg_sales;

-- Load fact table
INSERT INTO fact_sales (fact_id, order_id, customer_id, employee_id, product_id, date_id, quantity, revenue, profit)
SELECT
    order_item_id AS fact_id,
    order_id,
    customer_id,
    employee_id,
    product_id,
    EXTRACT(YEAR FROM order_date)*10000 + EXTRACT(MONTH FROM order_date)*100 + EXTRACT(DAY FROM order_date) AS date_id,
    quantity,
    revenue,
    profit
FROM stg_sales;
