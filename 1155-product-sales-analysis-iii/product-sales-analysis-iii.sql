# Write your MySQL query statement below
-- select s.product_id, min(year) as first_year, quantity, price
-- from sales s
-- left join product p
-- on p.product_id = s.product_id
-- group by 1

select product_id, year as first_year, quantity, price
from sales
where (product_id, year) IN (select product_id, min(year) from sales group by product_id)