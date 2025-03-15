# Write your MySQL query statement below
with cte as
(select *, dense_rank() over (partition by departmentId order by salary desc) as rnk
from employee)
select d.name as department, e.name as Employee, e.salary
from cte e
left join department d
on e.departmentId = d.id
where rnk <=3