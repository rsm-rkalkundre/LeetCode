# Write your MySQL query statement below
SELECT id, (CASE WHEN p_id IS NULL then 'Root'
                WHEN id IN (Select p_id from tree) then 'Inner'
                Else 'Leaf'
                END) As type
from tree