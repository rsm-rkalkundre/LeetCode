# Write your MySQL query statement below
Select e.name as Employee
FROM Employee e
LEFT JOIN Employee f
ON e.managerID = f.id
WHERE e.salary > f.salary