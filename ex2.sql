What is the result of the following script and how would you fix it?

select *
from(
     SELECT a.fisrt_name,a.last_name,a.job_id
     FROM employees A
     WHERE A.slary >(Select avg(salary) from employees)) and a.slary < select (max(slary) from employees)
) b
where b.job_id=SY_ANA;

___________________________________________________________________________
true version:

SELECT *
FROM (
    SELECT a.first_name, a.last_name, a.job_id
    FROM employees a
    WHERE a.salary > (SELECT AVG(salary) FROM employees)
        AND a.salary < (SELECT MAX(salary) FROM employees)
) b
WHERE b.job_id = 'SY_ANA';