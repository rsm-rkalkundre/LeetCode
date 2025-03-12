-- Write your PostgreSQL query statement below
SELECT employee_id
FROM Employees
WHERE employee_id NOT IN (select employee_id FROM Salaries)
UNION
SELECT employee_id
FROM Salaries
WHERE employee_id NOT IN (select employee_id FROM Employees)
order by 1