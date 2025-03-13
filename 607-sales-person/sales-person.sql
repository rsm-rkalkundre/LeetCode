# Write your MySQL query statement below
WITH red as(
SELECT s.name, 
                (CASE
                WHEN c.name = 'RED' THEN 1 
                ELSE 0 END) AS isred
FROM SalesPerson s
LEFT JOIN Orders o
ON o.sales_id = s.sales_id
LEFT JOIN Company c
ON o.com_id = c.com_id
)
SELECT name
FROM red
GROUP BY 1
HAVING MAX(isred) != 1