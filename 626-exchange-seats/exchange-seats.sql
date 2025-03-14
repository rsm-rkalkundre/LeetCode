# Write your MySQL query statement below
with cte as(
select id, student,
    (CASE WHEN id%2 = 0 then id-1 
          WHEN id%2 = 1 AND id+1 NOT IN (select id from seat) then id
          Else id+1          
    end) as id_new
from seat)
select id_new as id, student
from cte
order by 1