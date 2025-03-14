-- Write your PostgreSQL query statement below
with cte as(
select visited_on, sum(amount) as total_amount
from customer
group by visited_on)
select visited_on, 
    round(sum(total_amount) over (order by visited_on rows between 6 preceding and current row), 2) as amount,
    round(avg(total_amount) over (order by visited_on rows between 6 preceding and current row), 2) as average_amount
from cte
order by visited_on
offset 6