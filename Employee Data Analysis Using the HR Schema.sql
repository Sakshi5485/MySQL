-- SPRINT-4 Practice

use hr;

------------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-1
-- Display the employee_id, first name, last name and department of all employee using subquery

select * from employees;
select * from departments;

select employee_id,first_name,last_name,
(select department_name from departments where departments.department_id=employees.department_id) as department_name from employees;

-------------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-2
-- Display the first_name,last_name, and salaries of employees whos salaries are greater than the average salary of all employees.
-- group by the department_id.

select * from employees;

select avg(salary) from employees;


select first_name, last_name, salary from employees where salary >(select avg(salary) from employees); 

----------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-3
-- Display the first_name, last_name of those employees of the sales departments who have a salary less
-- than the avg salary of all employees of the sales departments 

select * from departments;
select * from employees;

select first_name, last_name from employees where
department_id = (select department_id from departments where department_name = 'Sales') and salary < 
(select avg(salary) from employees where department_id = (select department_id from departments where department_name = 'Sales'));

------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-4
-- Display the first name last name and salaries of the employees who have a salary higher than salary of all IT programmers 
-- display the details of employees in asending order using subquery


select * from employees;
select * from jobs;

select first_name, last_name, salary from employees
where salary > (select max(salary) from employees where job_id = 'IT_PROG') order by salary asc;

-------------------------------------------------------------------------------------------------------------------------------------

-- TASK-5
-- Display the record of all employees with the minimum salary in the employees table, group by the job_ib
-- ans arrange in the ascending order of salary

select * from employees;

select job_id, min(salary) as min_salary from employees group by job_id order by min_salary asc;

--------------------------------------------------------------------------------------------------------------------------------------

-- TASK-6
-- Display the first_name last_name and department ids of the employees whose salary is greater than 60%
-- of the sum of salaries of all employees of their respective departments.

select * from employees;

select first_name, last_name, department_id from employees 
where salary>0.6*(select sum(salary) from employees as S where S.department_id=employees.department_id); 

----------------------------------------------------------------------------------------------------------------------------------

-- TASK-7 
-- Display the first_name and last_name of all those employees who have their manager based out of UK, using subquery

select * from employees;
select * from countries;
select * from regions;
select * from locations;

select first_name, last_name from employees where manager_id
in(select manager_id from departments where location_id in (select location_id from locations where country_id = "UK"));


-------------------------------------------------------------------------------------------------------------------------------------

-- TASK-8
-- Display the first_name last_name and salaries of the top 5 highest paid employees and export the output as csv file
-- use data export techique

select first_name, last_name, salary from employees order by salary desc limit 5;

-- CSV File exporting is pending 
