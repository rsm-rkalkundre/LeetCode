# Write your MySQL query statement below
WITH CTE AS
(select requester_id as id, count(accepter_id) as count
from RequestAccepted
group by 1
UNION ALL
select accepter_id as id, count(requester_id) as count
from RequestAccepted
group by 1)
select id, sum(count) as num
from cte
group by 1
order by 2 desc
limit 1