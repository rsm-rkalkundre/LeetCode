# Write your MySQL query statement below
with cte as
(select *, id - row_number() over () as id_diff
from stadium
where people > 99)
select id, visit_date, people
from cte
where id_diff IN (select id_diff from cte group by id_diff having count(*) > 2)