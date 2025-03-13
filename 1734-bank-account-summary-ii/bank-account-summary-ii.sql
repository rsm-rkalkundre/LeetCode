# Write your MySQL query statement below
SELECT u.name as name, SUM(t.amount) AS balance
FROM Transactions t
Left JOIN Users u
ON t.account = u.account
GROUP BY t.account
HAVING balance > 10000 