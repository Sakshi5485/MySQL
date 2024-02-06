-- SPRINT-2_Challenge

use hr;
----------------------------------------------------------------------------------------------------------------------------

-- TASK-1
-- count of all employees in organisation

describe employees;
select * from employees;
select count(*) as count_of_all_employees from employees;

-----------------------------------------------------------------------------------------------------------------------------

-- TASK-2
-- department_id wise count of employyees

select * from employees;
select department_id,count(employee_id) from employees group by department_id;

--------------------------------------------------------------------------------------------------------------------------------

-- TASK-3
-- find first_name, last_name and salaries of those employees whose salary is >6000

select * from employees;

select first_name,last_name,salary from employees where salary >6000;

---------------------------------------------------------------------------------------------------------------------------------

-- TASK-4
-- determine the count of employees who earning a salary greater thhan 20000

select * from employees;

select count(*) from employees where salary >20000;

------------------------------------------------------------------------------------------------------------------------------------

-- TASK-5
-- list the details of thosre employees who get a commission to deside the percentage of bonus they should receive

select * from employees;

select * from employees where commission_pct is not null;

-------------------------------------------------------------------------------------------------------------------------------------

-- TASK-6
-- extract the full name of emploees who receive commission

 select * from employees;

select concat(first_name,'_',last_name) from employees where commission_pct is not null;

-------------------------------------------------------------------------------------------------------------------------------------

-- TASK-7
-- fetch the following details of employees who gets commission

 select * from employees;

select employee_id, concat(first_name,'_',last_name),email,phone_number from employees where commission_pct is not null;

------------------------------------------------------------------------------------------------------------------------------------

-- TASK-8 
-- identify the top three department id thats have a highest total salary of employees

select * from employees;
select department_id, sum(salary) from employees group by department_id order by sum(salary) desc limit 3;

-------------------------------------------------------------------------------------------------------------------------------------

-- TASK-9
-- list the details of employees from the it department 

select department_id,department_name from departments where department_name='it';

select * from employees where department_id='60';       

-- department_id 60 stands for it department
-----------------------------------------------------------------------------------------------------------------------------------

-- TASK-10
-- find the count of all employees in it department and thheir average salary

select * from employees;

select count(*), avg(salary) from employees where department_id='60';

----------------------------------------------------------------------------------------------------------------------------------------

-- TASK-11
-- Identify the department id and the number of employees for departments in which employee salary range from 7000 to 10000

select * from employees;

select department_id, count(*) as Numberr_of_employees from employees where salary <=7000 and salary <=10000 group by department_id;

-----------------------------------------------------------------------------------------------------------------------------------------

