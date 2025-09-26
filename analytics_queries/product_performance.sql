-- Top Performing Products
SELECT
    p.name AS Product_Name,
    p.category AS Category,
    SUM(oi.quantity) AS Total_Units_Sold,
    SUM(oi.quantity * oi.unit_price) AS Total_Revenue,
    SUM(oi.quantity * (oi.unit_price - p.cost)) AS Total_Profit,
    ROUND(SUM(oi.quantity * (oi.unit_price - p.cost)) / SUM(oi.quantity), 2) AS Profit_Per_Unit
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'completed'
GROUP BY p.product_id, p.name, p.category
ORDER BY Total_Revenue DESC;