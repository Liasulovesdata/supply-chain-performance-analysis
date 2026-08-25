# BUSINESS QUESTION 1
-- AOV performance overtime
-- How has average order value changed over time
SELECT 
DATE_FORMAT(order_date, '%Y-%m') AS months,
ROUND(
SUM(sales) / COUNT(DISTINCT oi.order_id),2) AS average_order_value
FROM order_item AS oi
JOIN orders AS o
	ON oi.order_id = o.order_id
GROUP BY months;

# BUSINESS QUESTION 2
-- Customer segment by sales 
-- Which customer segments generate the highest sales.
SELECT 
customer_segment,
SUM(sales) AS highest_sales
FROM order_item AS oi
JOIN orders AS o
	ON oi.order_id = o.order_id
JOIN customers AS c
	ON o.customer_id = c.customer_id
    GROUP BY customer_segment
    ORDER BY SUM(sales) DESC;

# BUSINESS QUESTION 3
-- 
-- Who are the top 10 customers by lifetime sales and profit?
SELECT
    c.customer_id,
    customer_name,
    ROUND(SUM(sales), 2) AS lifetime_sales,
    ROUND(SUM(order_profit_per_order), 2) AS lifetime_profit
FROM orders AS o
JOIN order_item AS oi
    ON o.order_id = oi.order_id
JOIN customers AS c
		ON c.customer_id = o.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY lifetime_sales DESC
LIMIT 10;
    
    
# BUSINESS QUESTION 4
-- How many customers are repeat customers, and how much sales do they generate?

WITH customer_orders AS (
    SELECT
        o.customer_id,
        COUNT(DISTINCT o.order_id) AS total_orders,
        SUM(oi.sales) AS total_sales
    FROM orders AS o
    JOIN order_item AS oi
        ON o.order_id = oi.order_id
    GROUP BY o.customer_id
)

SELECT
    COUNT(*) AS repeat_customers,
    ROUND(SUM(total_sales), 2) AS repeat_customer_sales
FROM customer_orders
WHERE total_orders > 1;
