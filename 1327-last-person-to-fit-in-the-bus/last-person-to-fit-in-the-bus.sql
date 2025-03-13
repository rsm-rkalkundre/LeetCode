# Write your MySQL query statement below
WITH CTE as(
select person_name, turn, sum(weight) over (order by turn) as total_sum
from queue) 
SELECT person_name from CTE
where total_sum <=1000
order by turn desc
limit 1
