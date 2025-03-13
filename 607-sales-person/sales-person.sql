# Write your MySQL query statement below
SELECT name
from salesperson
where sales_id NOT IN (
    select sales_id
    from orders o
    left join company c
    on o.com_id = c.com_id
    where c.name = 'RED'
)