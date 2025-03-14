# Write your MySQL query statement below
-- SELECT customer_id 
-- from customer
-- where (Select count(distinct product_key) from product) IN 
-- (SELECT cnt from (select customer_id, count(product_key) as cnt from customer group by customer_id) as tb)

select customer_id
from customer 
group by customer_id 
HAVING count(distinct product_key) = (Select count(distinct product_key) from product) 
AND SUM(product_key NOT IN (select product_key from product)) = 0
