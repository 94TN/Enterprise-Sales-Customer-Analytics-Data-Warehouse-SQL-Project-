-- Total revenue & profit
SELECT 
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit
FROM fact_sales;
