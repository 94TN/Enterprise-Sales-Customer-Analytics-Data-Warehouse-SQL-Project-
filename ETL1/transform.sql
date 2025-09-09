-- Calculate revenue & profit for each order item

CREATE TABLE stg_sales AS
SELECT 
    oi.order_item_id,
    o.order_id,
    o.customer_id,
    o.employee_id,
    oi.product_id,
    o.order_date,
    oi.quantity,
    (oi.quantity * p.price) AS revenue,
    (oi.quantity * (p.price - p.cost)) AS profit
FROM stg_order_items oi
JOIN stg_orders o ON oi.order_id = o.order_id
JOIN stg_products p ON oi.product_id = p.product_id;
