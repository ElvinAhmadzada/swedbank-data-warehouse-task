According to the Jobs table (provided in company_db.sql script) what could you tell about the employees table for the System Analyst position (SY_ANA)? 


1) We need to find these employees first. For this we will use this code:

SELECT *
FROM employees
WHERE job_id = 'SY_ANA';


2) Now information about employees:

All have department_id 60, all have COMMISSION_PCTs 0.