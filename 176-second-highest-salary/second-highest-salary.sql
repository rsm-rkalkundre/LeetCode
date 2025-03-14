SELECT MAX(salary) AS SecondHighestSalary
FROM (
    SELECT salary, dense_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employee
) t
WHERE rnk = 2;