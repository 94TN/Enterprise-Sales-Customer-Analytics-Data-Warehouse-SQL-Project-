-- Rank employees by revenue generated
SELECT 
    e.employee_name,
    SUM(f.revenue) AS total_revenue,
    RANK() OVER (ORDER BY SUM(f.revenue) DESC) AS revenue_rank
FROM fact_sales f
JOIN dim_employees e ON f.employee_id = e.employee_id
GROUP BY e.employee_name;
