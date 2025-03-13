# Write your MySQL query statement below
SELECT sell_date, COUNT(DISTINCT product) as num_sold, GROUP_CONCAT(DISTINCT Product ORDER BY product SEPARATOR ',') as Products
FROM Activities
GROUP BY sell_date