# Write your MySQL query statement below
-- (SELECT employee_id, department_id
-- FROM Employee
-- GROUP BY 1
-- HAVING COUNT(department_id) = 1)
-- UNION
-- SELECT employee_id, department_id 
-- FROM (SELECT employee_id, department_id, primary_flag
-- FROM Employee
-- GROUP BY 1
-- HAVING COUNT(department_id) > 1) as tab
-- WHERE primary_flag = 'Y'

WITH CTE AS(
SELECT employee_id, department_id, (COUNT(department_id) OVER (PARTITION BY employee_id)) AS cnt, primary_flag
FROM Employee)
SELECT employee_id, department_id
FROM CTE
WHERE cnt = 1 OR (cnt > 1 AND primary_flag = 'Y')