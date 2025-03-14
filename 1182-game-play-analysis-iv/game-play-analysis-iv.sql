# Write your MySQL query statement below
with num as(
select player_id
from Activity
where (player_id, date_sub(event_date, interval 1 day)) IN (select player_id, min(event_date) as first_login
from Activity
group by 1)),

den as(
    select count(distinct player_id) as denom
    from Activity
)

select coalesce(round((count(player_id)/ denom), 2), 0) as fraction
from num, den

