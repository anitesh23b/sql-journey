-- ================================================
-- Day 03 - Real Project Queries
-- Project: Guruji Kirpa Steel Trading
-- Topics: CSV Import, GROUP BY, JOIN, EXTRACT
-- ================================================

-- 1. Sabse zyada bikri kis product ki?
SELECT 
    product_name,
    COUNT(*) AS total_orders,
    SUM(quantity_kg) AS total_kg_sold,
    ROUND(SUM(total_amount), 2) AS total_revenue
FROM sales
GROUP BY product_name
ORDER BY total_revenue DESC;

-- 2. Top 10 customers by purchase value
SELECT 
    s.customer_name,
    c.city,
    c.customer_type,
    ROUND(SUM(s.total_amount), 2) AS total_purchase
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY s.customer_name, c.city, c.customer_type
ORDER BY total_purchase DESC
LIMIT 10;

-- 3. 2023 vs 2024 revenue comparison
SELECT 
    EXTRACT(YEAR FROM sale_date) AS year,
    COUNT(*) AS total_orders,
    ROUND(SUM(quantity_kg), 0) AS total_kg_sold,
    ROUND(SUM(total_amount), 2) AS total_revenue
FROM sales
GROUP BY EXTRACT(YEAR FROM sale_date)
ORDER BY year;
