-- Monthly Sales Trend
SELECT
    YEAR(order_date) AS Year,
    MONTH(order_date) AS Month,
    COUNT(DISTINCT order_id) AS Total_Orders,
    SUM(total_amount) AS Total_Revenue,
    AVG(total_amount) AS Average_Order_Value,
    COUNT(DISTINCT customer_id) AS Unique_Customers
FROM orders
WHERE status = 'completed'
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY Year, Month;