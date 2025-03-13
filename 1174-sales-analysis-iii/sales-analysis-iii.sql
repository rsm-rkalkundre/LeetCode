-- Write your PostgreSQL query statement below
SELECT s.product_id, p.product_name
FROM Sales s
LEFT JOIN Product p
ON s.product_id = p.product_id
GROUP BY s.product_id, p.product_name
HAVING MAX(sale_date) < DATE('2019-04-01') AND MIN(sale_date) > DATE('2018-12-31')