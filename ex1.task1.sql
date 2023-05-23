⦁ List all the departments and the number of employees per each depar…

SELECT department_name, COUNT(*) AS num_employees
FROM employees
GROUP BY department_name;
