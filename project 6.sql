SELECT * 
FROM online_sales.`online sales data`;

CREATE TABLE orders (
    order_id INT,                  -- Transaction ID
    order_date DATE,               -- Date
    amount DECIMAL(10,2),          -- Total Revenue
    product_name VARCHAR(255),     -- Product Name (optional)
    region VARCHAR(100),           -- Region (optional)
    payment_method VARCHAR(100)    -- Payment Method (optional)
);
INSERT INTO orders (order_id, order_date, amount, product_name, region, payment_method)
VALUES 
(10001, '2024-01-01', 1999.98, 'iPhone 14 Pro', 'North America', 'Credit Card'),
(10002, '2024-01-02', 499.99, 'Dyson V11 Vacuum', 'Europe', 'PayPal'),
(10003, '2024-01-03', 209.97, 'Levi''s 501 Jeans', 'Asia', 'Debit Card');



SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM
    orders
GROUP BY
    order_year, order_month
ORDER BY
    order_year, order_month;

SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(amount) AS total_revenue
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2024
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

SELECT
    order_date,
    SUM(amount) AS daily_revenue,
    COUNT(DISTINCT order_id) AS daily_orders
FROM  orders
GROUP BY order_date
ORDER BY order_date
;
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(amount) AS revenue
FROM
    orders
WHERE
    product_name = 'iPhone 14 Pro'
GROUP BY month
ORDER BY month;

SELECT 
    MIN(order_date) AS earliest_date,
    MAX(order_date) AS latest_date
FROM 
    orders;

