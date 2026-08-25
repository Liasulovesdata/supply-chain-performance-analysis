# BUSINESS QUESTION 1
-- Which TOP 10 products have the highest quantity sold?
SELECT 
product_name,
SUM(order_item_quantity) AS highest_quantity_sold
FROM product AS p
JOIN order_item AS oi
	ON p.product_id = oi.product_id
    GROUP BY product_name
    ORDER BY SUM(order_item_quantity) DESC
    LIMIT 10;
    
# BUSINESS QUESTION 2
-- Which products generate the highest sales revenue?
SELECT 
product_name,
SUM(sales) AS highest_sales_revenue
FROM product AS p
JOIN order_item AS oi
	ON p.product_id = oi.product_id
    GROUP BY product_name
    ORDER BY SUM(sales) DESC
    ;
    
# BUSINESS QUESTION 3
-- Which products generate the highest profit, and are the highest-selling products also the most profitable?
SELECT
product_name,
SUM(sales) AS total_sales,
SUM(o.order_profit_per_order) AS total_profit,
ROUND(
SUM(o.order_profit_per_order) / SUM(sales) * 100,2) AS profit_margin
FROM product AS p
JOIN order_item AS oi
	ON p.product_id = oi.product_id
JOIN orders AS o
	ON o.order_id = oi.order_id
    GROUP BY product_name
    ORDER BY SUM(order_profit_per_order) DESC
    LIMIT 10;

# BUSINESS QUESTION 4
-- For each product category, which product generates the highest sales & profit revenue?
SELECT
category_name,
product_name,
SUM(sales) AS total_sales,
SUM(o.order_profit_per_order) AS total_profit
FROM product AS p
JOIN order_item AS oi
	ON p.product_id = oi.product_id
JOIN orders AS o
	ON o.order_id = oi.order_id
    GROUP BY category_name, product_name
    ORDER BY SUM(sales) DESC
    LIMIT 10;
    

# BUSINESS QUESTION 5
-- MONTHLY PROFIT BY CATEGORY
-- How does profit vary across product categories over time?
SELECT 
category_name,
SUM(order_profit_per_order) AS total_profit,
YEAR(order_date) AS year,
MONTH(order_date) AS month
FROM product AS p
JOIN order_item AS oi
	ON p.product_id = oi.product_id
JOIN orders AS o
	ON o.order_id = oi.order_id
GROUP BY category_name, year, month
ORDER BY 
year,
month,
total_profit DESC;

