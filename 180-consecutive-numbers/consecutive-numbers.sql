-- Write your PostgreSQL query statement below
with cte as(
select id, num, lead(num) over (order by id) as next_num, lag(num) over (order by id) as prev_num
from logs)
select distinct num as ConsecutiveNums
from cte
where num = prev_num and prev_num = next_num