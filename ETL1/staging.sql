-- Copy OLTP data into staging tables for cleaning

CREATE TABLE stg_orders AS SELECT * FROM orders;
CREATE TABLE stg_order_items AS SELECT * FROM order_items;
CREATE TABLE stg_customers AS SELECT * FROM customers;
CREATE TABLE stg_products AS SELECT * FROM products;
CREATE TABLE stg_employees AS SELECT * FROM employees;
