WITH cte AS (
    SELECT * 
    FROM trips t
    WHERE client_id NOT IN (SELECT users_id FROM users WHERE banned = 'Yes' AND role = 'client')
    AND driver_id NOT IN (SELECT users_id FROM users WHERE banned = 'Yes' AND role = 'driver')
    and request_at between "2013-10-01" and "2013-10-03"
),
num AS (
    SELECT id AS num_id 
    FROM cte 
    WHERE status LIKE 'cancelled%'
)

SELECT cte.request_at AS Day, 
       ROUND(COUNT(num.num_id) * 1.0 / COUNT(*), 2) AS "Cancellation Rate"
FROM cte
LEFT JOIN num ON cte.id = num.num_id
GROUP BY cte.request_at
order by cte.request_at