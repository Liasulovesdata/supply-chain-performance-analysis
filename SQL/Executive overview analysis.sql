-- EXECUTIVE OVERVIEW
# BUSINESS QUESTION 1
-- What are the company's total sales revenue, total profit, total orders, and average order value?
-- TOTAL SALES REVENUE
SELECT 
SUM(sales) AS total_sales_revenue
FROM order_item;
-- TOTAL PROFIT
SELECT
SUM(order_profit_per_order) AS total_profit
FROM orders;
-- TOTAL ORDERS
SELECT 
COUNT(DISTINCT order_id) AS total_orders
FROM orders;
-- AVERAGE ORDER VALUE
SELECT 
ROUND(
SUM(sales) / COUNT(DISTINCT order_id),2) AS average_order_value
FROM order_item;


# BUSINESS QUESTION 2
-- How has monthly sales revenue changed over time, and which months experienced the largest increases or declines MoM?
WITH monthly_sales AS (
SELECT 
DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
SUM(oi.sales) AS monthly_sales
FROM orders AS o
JOIN order_item AS oi
	ON o.order_id = oi.order_id
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
    ),
monthly_growth AS (
SELECT 
sales_month,
monthly_sales,
LAG(monthly_sales) OVER (ORDER BY sales_month) AS previous_month_sales
FROM monthly_sales
)
SELECT 
sales_month,
ROUND(monthly_sales,2) AS monthly_sales,
ROUND(previous_month_sales,2) AS previous_month_sales,
ROUND(
(monthly_sales-previous_month_sales)/NULLIF(previous_month_sales,0)*100,2) AS mom_growth_percentage
FROM monthly_growth
ORDER BY sales_month;


# BUSINESS QUESTION 3
-- . Year-over-Year Sales Growth
-- How has sales revenue changed with the previous year (YoY)

WITH yearly_sales AS (
SELECT 
YEAR(o.order_date) AS sales_year,
SUM(oi.sales) AS yearly_sales
FROM orders AS o
JOIN order_item AS oi
	ON o.order_id = oi.order_id
    GROUP BY YEAR(o.order_date)
    ),
YOY_analysis AS (
SELECT
sales_year,
yearly_sales,
LAG(yearly_sales) OVER(ORDER BY sales_year) AS previous_year_sales
FROM yearly_sales
)
SELECT 
sales_year,
ROUND(yearly_sales,2) AS yearly_sales,
ROUND(previous_year_sales,2) AS previous_year_sales,
ROUND(
(yearly_sales-previous_year_sales)/NULLIF(previous_year_sales,0) *100,2) AS yoy_growth_percentage
FROM YOY_analysis
ORDER BY yearly_sales DESC;


# BUSINESS QUESTION 4
-- . Monthly Profit & Sales Trend
-- How has monthly profit & sales changed over time

    
WITH monthly_profit_performance AS (
SELECT 
DATE_FORMAT(order_date, '%Y-%m') AS months,
SUM(order_profit_per_order) AS total_profit
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
),
monthly_sales_performance AS (
SELECT 
DATE_FORMAT(order_date, '%Y-%m') AS months,
SUM(sales) AS total_sales
FROM orders o 
JOIN order_item oi
	ON o.order_id = oi.order_id
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT 
s.months,
ROUND(total_sales,2) AS total_sales, 
ROUND(total_profit,2) AS total_profit
FROM monthly_profit_performance AS p
JOIN monthly_sales_performance AS s
	ON p.months = s.months
    ORDER BY s.months;
    

    
# BUSINESS QUESTION 5
-- Market Growth & Decline
-- Which markets generate the highest and lowest total sales and profit?
WITH market_sales_performance AS (
    SELECT
        o.market,
        SUM(oi.sales) AS total_sales
    FROM orders o
    JOIN order_item oi
        ON o.order_id = oi.order_id
    GROUP BY o.market
),

market_profit_performance AS (
    SELECT
        market,
        SUM(order_profit_per_order) AS total_profit
    FROM orders
    GROUP BY market
)

SELECT
    s.market,
    ROUND(s.total_sales, 2) AS total_sales,
    ROUND(p.total_profit, 2) AS total_profit
FROM market_sales_performance s
JOIN market_profit_performance p
    ON s.market = p.market
ORDER BY total_sales ASC;


# BUSINESS QUESTION 6
-- COUNTRY PERFORMANCE
-- Which country generate the highest and lowest total sales and profit?
WITH country_sales_performance AS (
    SELECT
        o.order_country,
        SUM(oi.sales) AS total_sales
    FROM orders o
    JOIN order_item oi
        ON o.order_id = oi.order_id
    GROUP BY o.order_country
),

country_profit_performance AS (
    SELECT
        order_country,
        SUM(order_profit_per_order) AS total_profit
    FROM orders
    GROUP BY order_country
)

SELECT
    s.order_country AS country,
    ROUND(s.total_sales, 2) AS total_sales,
    ROUND(p.total_profit, 2) AS total_profit
FROM country_sales_performance s
JOIN country_profit_performance p
    ON s.order_country = p.order_country
ORDER BY total_sales ASC;
