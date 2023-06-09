⦁	List the 2 jobs with the maximum number of employees and the respective minimum and maximum salary per job.

SELECT job_id, COUNT(*) AS num_employees, MIN(salary) AS min_salary, MAX(salary) AS max_salary
FROM employees
GROUP BY job_id
ORDER BY num_employees DESC
LIMIT 2;