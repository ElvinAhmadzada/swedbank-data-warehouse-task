

SELECT department_name, COUNT(*) AS num_employees
FROM employees
GROUP BY department_name;
