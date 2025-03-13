# Write your MySQL query statement below
-- WITH cte as(
-- SELECT account_id, income, 
--     (CASE WHEN income < 20000 THEN 'Low Salary'
--          WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
--          WHEN income > 50000 THEN 'High Salary'
--     END) AS category
-- FROM Accounts)
-- SELECT category, sum(1) as accounts_count
-- FROM cte
-- group by 1

SELECT 'Low Salary' AS category, count(account_id) as accounts_count
from accounts
where income < 20000
UNION
SELECT 'Average Salary' AS category, count(account_id) as accounts_count
from accounts
where income >= 20000 AND income <= 50000
UNION
SELECT 'High Salary' AS category, count(account_id) as accounts_count
from accounts
where income > 50000
