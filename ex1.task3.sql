⦁	Display the number of employees per city having not less than 34 employees

SELECT city, COUNT(*) AS num_employees
FROM employees
GROUP BY city
HAVING COUNT(*) >= 34;