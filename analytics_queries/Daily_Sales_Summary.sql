CREATE VIEW daily_sales_summary AS
SELECT
    DATE(order_date) AS Sale_Date,
    COUNT(DISTINCT order_id) AS Orders_Count,
    SUM(total_amount) AS Daily_Revenue,
    AVG(total_amount) AS Avg_Order_Value,
    COUNT(DISTINCT customer_id) AS Unique_Customers
FROM orders
WHERE status = 'completed'
GROUP BY DATE(order_date);

-- Test the view
SELECT * FROM daily_sales_summary ORDER BY Sale_Date;