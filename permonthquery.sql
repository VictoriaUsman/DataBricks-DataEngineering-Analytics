SELECT
  DATE_TRUNC('month', S.order_date) AS month,
  S.customer_id,
  C.first_name,
  C.last_name,
  COUNT(DISTINCT S.order_id) AS total_orders,
  SUM(S.revenue) AS total_revenue
FROM sales S
LEFT JOIN customers C
  ON S.customer_id = C.customer_id
WHERE S.order_date IS NOT NULL
GROUP BY
  DATE_TRUNC('month', S.order_date),
  S.customer_id,
  C.first_name,
  C.last_name
ORDER BY total_orders DESC;
