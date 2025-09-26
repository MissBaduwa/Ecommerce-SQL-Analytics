-- Customer Lifetime Value Analysis
WITH CustomerMetrics AS (
    SELECT
        o.customer_id,
        COUNT(DISTINCT o.order_id) AS Total_Orders,
        SUM(oi.quantity * oi.unit_price) AS Total_Spent,
        MAX(o.order_date) AS Last_Order_Date,
        MIN(o.order_date) AS First_Order_Date
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.status = 'completed'
    GROUP BY o.customer_id
)
SELECT
    c.customer_id,
    c.name AS Customer_Name,
    c.country,
    cm.Total_Orders,
    cm.Total_Spent,
    ROUND(cm.Total_Spent / cm.Total_Orders, 2) AS Avg_Order_Value,
    DATEDIFF(cm.Last_Order_Date, cm.First_Order_Date) AS Customer_Tenure_Days,
    CASE
        WHEN cm.Total_Spent > 1000 THEN 'VIP'
        WHEN cm.Total_Spent > 500 THEN 'Premium'
        ELSE 'Standard'
    END AS Customer_Tier
FROM customers c
JOIN CustomerMetrics cm ON c.customer_id = cm.customer_id
ORDER BY cm.Total_Spent DESC;