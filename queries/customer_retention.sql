-- One-time vs repeat customers
WITH purchase_counts AS (
    SELECT customer_id, COUNT(DISTINCT order_id) AS orders_made
    FROM fact_sales
    GROUP BY customer_id
)
SELECT 
    CASE WHEN orders_made = 1 THEN 'One-time' ELSE 'Repeat' END AS customer_type,
    COUNT(*) AS customer_count
FROM purchase_counts
GROUP BY customer_type;
