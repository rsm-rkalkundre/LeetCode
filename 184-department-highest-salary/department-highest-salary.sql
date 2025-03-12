# Write your MySQL query statement below
-- SELECT d.name AS, e.name, MAX(e.salary)
-- FROM Employee e
-- LEFT JOIN Department d
-- ON e.departmentId = d.id
-- GROUP BY d.name

-- SELECT e.departmentId, f.name, MAX(e.Salary)
-- FROM Employee e
-- INNER JOIN Employee f
-- ON e.departmentID = f.departmentID a
-- GROUP BY e.departmentId, f.name

-- SELECT D.name AS Department, B.name as Employee, A.Salary as Salary
-- FROM (SELECT departmentID, MAX(Salary) AS Salary
--         FROM Employee 
--         GROUP BY departmentID) AS A
-- INNER JOIN Employee B
-- ON A.departmentId = B.departmentId AND A.salary = B.salary
-- LEFT JOIN Department as D
-- ON A.departmentId = D.id

SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM Employee e
INNER JOIN Department d
ON e.departmentId = d.id
WHERE (departmentId, Salary) IN (SELECT departmentId, MAX(salary)
                                FROM Employee
                                GROUP BY departmentId)