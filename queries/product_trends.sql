-- Top 5 products by revenue
SELECT 
    p.product_name,
    SUM(f.revenue) AS total_revenue
FROM fact_sales f
JOIN dim_products p ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;
