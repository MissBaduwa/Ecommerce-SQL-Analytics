CREATE VIEW customer_behavior AS
SELECT
    c.customer_id,
    c.name,
    c.country,
    c.signup_date,
    COUNT(DISTINCT o.order_id) AS Total_Orders,
    SUM(oi.quantity * oi.unit_price) AS Lifetime_Value,
    DATEDIFF(MAX(o.order_date), c.signup_date) AS Days_As_Customer,
    CASE 
        WHEN COUNT(DISTINCT o.order_id) > 1 THEN 'Repeat'
        ELSE 'One-time'
    END AS Customer_Type
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id AND o.status = 'completed'
LEFT JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.name, c.country, c.signup_date;

-- Test the view
SELECT * FROM customer_behavior ORDER BY Lifetime_Value DESC;