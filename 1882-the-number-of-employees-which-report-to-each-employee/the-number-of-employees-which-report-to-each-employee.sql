# Write your MySQL query statement below
SELECT e1.employee_id, e1.name, COUNT(e2.name) as reports_count, ROUND(AVG(e2.age), 0) as average_age
FROM Employees e1
LEFT JOIN Employees e2
ON e1.employee_id = e2.reports_to
WHERE e2.employee_id IS NOT NULL
GROUP BY 1, 2
ORDER BY 1