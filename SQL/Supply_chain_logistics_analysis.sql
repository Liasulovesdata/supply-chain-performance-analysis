# BUSINESS QUESTION 1
-- How has the company's late-delivery rate changed over time?
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    ROUND(
        SUM(
            CASE
                WHEN s.delivery_status = 'Late delivery' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(DISTINCT o.order_id),
        2
    ) AS late_delivery_rate
FROM orders AS o
JOIN shipping AS s
    ON o.order_id = s.order_id
GROUP BY month
ORDER BY month;

# BUSINESS QUESTION 2
-- How does delivery performance vary across shipping modes?
SELECT
    s.shipping_mode,
    ROUND(AVG(s.actual_shipping_date), 2) AS average_delivery_days,
    ROUND(
        SUM(
            CASE
                WHEN s.delivery_status = 'Late delivery' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS late_delivery_rate
FROM shipping AS s
GROUP BY s.shipping_mode
ORDER BY late_delivery_rate DESC;


# BUSINESS QUESTION 3
-- Which markets have the highest late-delivery rates?
SELECT
    o.market,
    ROUND(
        SUM(
            CASE
                WHEN s.delivery_status = 'Late delivery' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(DISTINCT o.order_id),
        2
    ) AS late_delivery_rate
FROM orders AS o
JOIN shipping AS s
    ON o.order_id = s.order_id
GROUP BY o.market
ORDER BY late_delivery_rate DESC;


# BUSINESS QUESTION 4
-- How does actual delivery time compare with scheduled delivery time across shipping modes and markets?
SELECT
    s.shipping_mode,
    o.market,
    ROUND(AVG(s.actual_shipping_date), 2) AS actual_delivery_days,
    ROUND(AVG(s.scheduled_shipping_date), 2) AS scheduled_delivery_days,
    ROUND(
        AVG(s.actual_shipping_date)
        - AVG(s.scheduled_shipping_date),
        2
    ) AS average_delivery_difference
FROM shipping AS s
JOIN orders AS o
    ON s.order_id = o.order_id
GROUP BY
    s.shipping_mode,
    o.market
ORDER BY
    average_delivery_difference DESC;
    

# BUSINESS QUESTION 5
-- How do late deliveries vary across markets and regions?
SELECT
    o.market,
    o.order_region,
    ROUND(
        SUM(
            CASE
                WHEN s.delivery_status = 'Late delivery' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(DISTINCT o.order_id),
        2
    ) AS late_delivery_rate
FROM orders AS o
JOIN shipping AS s
    ON o.order_id = s.order_id
GROUP BY
    o.market,
    o.order_regionS
ORDER BY
    late_delivery_rate DESC;
