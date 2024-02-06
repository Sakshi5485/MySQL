-- SPINT-3_Practice

use hr;

-- TASK-1
-- list th id, first_name and last_namee of tee employs working in it departmeent

select * from departments;
select * from employees;

select departments.department_id,departments.department_name,employees.first_name,employees.last_name
from departments inner join employees
on departments.department_id=employees.department_id where department_name = 'it';

-----------------------------------------------------------------------------------------------------------------------------------------

-- TASK-2
-- extract the minimum and maximum salaries for each department

select * from employees;
select * from departments;

select min(salary), max(salary), department_name from employees
 inner join departments 
 using (department_id)
 group by department_name;

-------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-3
-- Identify the top 10 cities that have the highest number of employees

select * from employees;
select * from departments;
select * from locations;

select count(employees.employee_id),locations.city from employees join departments on employees.department_id=departments.department_id
join locations on departments.location_id=locations.location_id group by city order by count(employee_id) desc limit 10;

----------------------------------------------------------------------------------------------------------------------------------------

-- TASK-4
-- List te employee_id, first name, and last name of te all employees whos last working day in the organisation was 1999-12-31

select * from employees;
select * from job_history;

select employees.employee_id, employees.first_name, employees.last_name, job_history.end_date from employees 
inner join job_history
on employees.employee_id=job_history.employee_id
 where end_date = '1999-12-31'group by employee_id;

--------------------------------------------------------------------------------------------------------------------------------------

-- TASK-5 
-- Extract the employee_id, first name, department name and total experience of all those employees 
-- who have completed at least 25 years in the organisation

select * from employees;
select * from departments;

select employees.employee_id,employees.first_name,employees.last_name,departments.department_name 
from employees inner join departments
on  employees.employee_id=departments.department_id where current_date-hire_date >=25;

--------------------------------------------------------------------------------------------------------------------------------------


