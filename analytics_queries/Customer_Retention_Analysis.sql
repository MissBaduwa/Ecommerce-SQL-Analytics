-- Cohort analysis: Customer retention by signup month
WITH customer_cohorts AS (
    SELECT
        customer_id,
        DATE_FORMAT(signup_date, '%Y-%m') AS signup_month
    FROM customers
),
monthly_orders AS (
    SELECT
        o.customer_id,
        DATE_FORMAT(o.order_date, '%Y-%m') AS order_month
    FROM orders o
    WHERE o.status = 'completed'
    GROUP BY o.customer_id, DATE_FORMAT(o.order_date, '%Y-%m')
)
SELECT
    cc.signup_month,
    mo.order_month,
    COUNT(DISTINCT mo.customer_id) AS active_customers
FROM customer_cohorts cc
LEFT JOIN monthly_orders mo ON cc.customer_id = mo.customer_id
    AND mo.order_month >= cc.signup_month
GROUP BY cc.signup_month, mo.order_month
ORDER BY cc.signup_month, mo.order_month;