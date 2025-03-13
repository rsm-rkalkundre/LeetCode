# Write your MySQL query statement below
SELECT MAX(num) as num
FROM (SELECT num, (COUNT(num)OVER (PARTITION BY num)) AS cnt FROM MyNumbers) as tab
WHERE cnt = 1