-- ==========================================================
-- OLTP Schema: Operational Database (Normalized)
-- Purpose: This schema supports day-to-day transactions for an e-commerce business (customers, orders, products, employees).
-- ==========================================================

-- ===============================
-- Customers Table
-- Stores customer profile and signup details.
-- ===============================
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,      -- Unique customer identifier
    name VARCHAR(100) NOT NULL,          -- Full name of customer
    email VARCHAR(100) UNIQUE NOT NULL,  -- Unique email for login/communication
    city VARCHAR(100),                   -- Customer's city (for segmentation)
    signup_date DATE NOT NULL            -- Date customer joined platform
);

-- ===============================
-- Products Table
-- Catalog of items available for purchase.
-- ===============================
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,       -- Unique product identifier
    name VARCHAR(100) NOT NULL,          -- Product name
    category VARCHAR(50),                -- Product category (e.g., Electronics, Apparel)
    price DECIMAL(10,2) NOT NULL,        -- Selling price
    cost DECIMAL(10,2) NOT NULL          -- Internal cost for profit calculation
);

-- ===============================
-- Employees Table
-- Tracks sales representatives / staff who process orders.
-- ===============================
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,      -- Unique employee identifier
    name VARCHAR(100) NOT NULL,          -- Employee full name
    role VARCHAR(50),                    -- Job role (e.g., Sales Rep, Manager)
    hire_date DATE                       -- Hire date
);

-- ===============================
-- Orders Table
-- Each row = one customer order.
-- ===============================
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,         -- Unique order identifier
    customer_id INT NOT NULL REFERENCES customers(customer_id),
    employee_id INT REFERENCES employees(employee_id),
    order_date DATE NOT NULL,            -- Date order was placed
    status VARCHAR(20) DEFAULT 'Pending' -- Order status (Pending, Shipped, Completed, Canceled)
);

-- ===============================
-- Order Items Table
-- Each row = one product within an order.
-- Supports 1-to-many relationship (order → products).
-- ===============================
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,    -- Unique order item identifier
    order_id INT NOT NULL REFERENCES orders(order_id),
    product_id INT NOT NULL REFERENCES products(product_id),
    quantity INT NOT NULL CHECK (quantity > 0), -- Quantity purchased
    unit_price DECIMAL(10,2) NOT NULL           -- Price per unit (captured at purchase time)
);
