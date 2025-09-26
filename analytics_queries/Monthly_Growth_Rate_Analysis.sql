WITH monthly_sales AS (
    SELECT
        YEAR(order_date) AS year,
        MONTH(order_date) AS month,
        SUM(total_amount) AS monthly_revenue,
        LAG(SUM(total_amount)) OVER (ORDER BY YEAR(order_date), MONTH(order_date)) AS prev_month_revenue
    FROM orders
    WHERE status = 'completed'
    GROUP BY YEAR(order_date), MONTH(order_date)
)
SELECT
    year,
    month,
    monthly_revenue,
    prev_month_revenue,
    ROUND(((monthly_revenue - prev_month_revenue) / prev_month_revenue) * 100, 2) AS growth_rate_percent
FROM monthly_sales
ORDER BY year, month;