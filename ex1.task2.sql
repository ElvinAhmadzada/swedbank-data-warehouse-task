⦁	List the employees with the lowest salary per each department

SELECT department_name, employee_id, first_name, last_name, salary
FROM employees
WHERE (department_name, salary) IN (
    SELECT department_name, MIN(salary)
    FROM employees
    GROUP BY department_name
);