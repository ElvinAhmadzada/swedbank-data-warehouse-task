⦁	List the lowest and highest salary per city, the total number of employees per city, the number of employees earning the lowest salary, the number of employees earning the highest salary, the percentage of employees earning the highest salary per city and the percentage of employees earning the lowest salary per city. This information should be shown as 1 row per city containing all the information requested. 

SELECT 
    city, 
    COUNT(*) AS total_employees, 
    MIN(salary) AS lowest_salary, 
    MAX(salary) AS highest_salary, 
    SUM(CASE WHEN salary = MIN(salary) THEN 1 ELSE 0 END) AS num_lowest_salary, 
    SUM(CASE WHEN salary = MAX(salary) THEN 1 ELSE 0 END) AS num_highest_salary, 
    (SUM(CASE WHEN salary = MAX(salary) THEN 1 ELSE 0 END) / CAST(COUNT(*) AS FLOAT)) * 100 AS pct_highest_salary, 
    (SUM(CASE WHEN salary = MIN(salary) THEN 1 ELSE 0 END) / CAST(COUNT(*) AS FLOAT)) * 100 AS pct_lowest_salary 
FROM employees 
GROUP BY city;
v