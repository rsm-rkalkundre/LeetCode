CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      select MAX(salary) as getNthHighestSalary
      from (select salary, dense_rank() over (order by salary desc) as rnk
            from employee) as t
      where rnk = N
  );
END