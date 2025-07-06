SELECT DATE_TRUNC(order_created_at, DAY) AS reporting_date,

    COUNT(DISTINCT order_id) AS total_orders,
    AVG(total_distinct_items) AS average_total_distinct_items,
    SUM(sum_feedback_score) / SUM(total_feedbacks) AS average_feedback_score,
    AVG(total_order_amount) AS average_total_order_amount
FROM {{ ref('int_sales_database__order') }} AS orders



GROUP BY reporting_date
