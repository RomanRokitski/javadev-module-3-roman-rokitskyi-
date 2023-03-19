SELECT name, salary
FROM worker
INNER JOIN (
  SELECT MAX(salary) AS max_salary
  FROM worker
) ON salary = max_salary;