# Write your MySQL query statement below
with cte as(select stock_name, operation, operation_day, price, (case when operation = 'Buy' then price*-1
else price end) as price_new
from stocks)
select stock_name, sum(price_new) as capital_gain_loss
from cte
group by stock_name
