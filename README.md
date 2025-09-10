This project simulates building a sales and customer analytics data warehouse for a mid-sized e-commerce company.

It demonstrates expertise in:
  Database Design (OLTP + OLAP)
  ETL Pipelines with SQL (staging → transformation → star schema)
  Advanced SQL Analytics (revenue, customer retention, RFM, employee performance)
  Performance Tuning (indexing, query optimization)
  Data Storytelling — turning raw data into business insights

Project Structure
schema/        → CREATE TABLE scripts (OLTP + OLAP)
etl/           → ETL SQL scripts (staging, transform, load)
queries/       → Analytics queries (revenue, customers, products, employees)
diagrams/      → ERD diagrams (OLTP + OLAP star schema)
README.md      → Project overview & documentation

Architecture
  OLTP (Transactional System)
  Stores raw business transactions: customers, products, employees, orders, order_items
  Optimized for fast inserts & updates
  OLAP (Data Warehouse Star Schema)
  fact_sales (measures: revenue, profit, quantity)
  dim_customers, dim_products, dim_employees, dim_dates
  Optimized for analytics queries

Star Schema:

ETL Pipeline
The ETL is implemented in pure SQL:
  Staging (staging.sql) → copy OLTP tables into staging layer.
  Transform (transform.sql) → clean/normalize data, create derived fields.
  Load (load.sql) → insert into star schema (fact_sales + dim_*).

Insights You Can Generate:
  Top Products → Best sellers and highest-margin items
  Customer Insights → Who are the top spenders? Repeat vs one-time buyers?
  Employee Performance → Ranking sales reps by revenue and profit generated
  Time Trends → Monthly growth, seasonal demand, YoY comparisons

Next Steps:
  Add indexes and compare query plans (performance tuning)
  Create a simple dashboard in Tableau/Power BI (optional)
  Scale to cloud warehouse (Snowflake, BigQuery, Redshift)

This project is designed to showcase senior-level SQL skills in:
  Schema design (OLTP vs OLAP)
  ETL thinking
  Business-driven analytics
  Documentation & data storytelling

