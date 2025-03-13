# Write your MySQL query statement below
SELECT p.product_name, SUM(o.unit) as unit
FROM Orders o
LEFT JOIN products p
ON o.product_id = p.product_id
WHERE MONTH(order_date) = 2 AND YEAR(order_date) = 2020
GROUP BY p.product_name
HAVING unit >= 100