DELIMITER //

CREATE PROCEDURE GenerateMonthlySalesReport(IN report_year INT, IN report_month INT)
BEGIN
    -- Monthly Summary
    SELECT
        CONCAT(report_year, '-', LPAD(report_month, 2, '0')) AS Period,
        COUNT(DISTINCT order_id) AS Total_Orders,
        SUM(total_amount) AS Total_Revenue,
        AVG(total_amount) AS Avg_Order_Value,
        COUNT(DISTINCT customer_id) AS Unique_Customers
    FROM orders
    WHERE status = 'completed'
    AND YEAR(order_date) = report_year
    AND MONTH(order_date) = report_month;
    
    -- Top 3 Products for the month
    SELECT
        p.name AS Product_Name,
        p.category,
        SUM(oi.quantity) AS Units_Sold,
        SUM(oi.quantity * oi.unit_price) AS Revenue
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    JOIN orders o ON oi.order_id = o.order_id
    WHERE o.status = 'completed'
    AND YEAR(o.order_date) = report_year
    AND MONTH(o.order_date) = report_month
    GROUP BY p.product_id, p.name, p.category
    ORDER BY Revenue DESC
    LIMIT 3;
    
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetCustomerActivity(IN customer_id_param INT)
BEGIN
    -- Customer basic info and summary
    SELECT
        c.name,
        c.email,
        c.country,
        COUNT(DISTINCT o.order_id) AS Total_Orders,
        SUM(oi.quantity * oi.unit_price) AS Total_Spent,
        MIN(o.order_date) AS First_Order,
        MAX(o.order_date) AS Last_Order
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id AND o.status = 'completed'
    LEFT JOIN order_items oi ON o.order_id = oi.order_id
    WHERE c.customer_id = customer_id_param
    GROUP BY c.customer_id, c.name, c.email, c.country;
    
    -- Customer's order history
    SELECT
        o.order_id,
        o.order_date,
        o.total_amount,
        GROUP_CONCAT(p.name SEPARATOR ', ') AS Products
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE o.customer_id = customer_id_param
    AND o.status = 'completed'
    GROUP BY o.order_id, o.order_date, o.total_amount
    ORDER BY o.order_date DESC;
    
END //

DELIMITER ;

-- Test monthly report for March 2023
CALL GenerateMonthlySalesReport(2023, 3);

-- Test customer activity for customer ID 1
CALL GetCustomerActivity(4);