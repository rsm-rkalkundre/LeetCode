# Write your MySQL query statement below
SELECT ROUND(SUM(tiv_2016), 2) as tiv_2016
FROM Insurance
WHERE tiv_2015 IN (Select tiv_2015 from Insurance GROUP BY 1 HAVING count(*)>1)
AND (lat, lon) IN (Select lat, lon from Insurance GROUP BY 1, 2 HAVING count(*)=1)