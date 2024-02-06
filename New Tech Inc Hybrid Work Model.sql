-- SPRINT-3 Challenge

use hr;

--------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-1
-- The company wants to promote hybride work culture and reduse the operation cost and occupancy
-- of its offices across different cities

select * from employees;
select * from locations;
select * from departments;

select count(employees.employee_id),locations.city from employees join departments on employees.department_id=departments.department_id
join locations on departments.location_id=locations.location_id group by city order by count(employees.employee_id) desc limit 5;
 
----------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-2
-- List thhe first name, last name, countries, cities, departments and salaries
-- of the employees from top 5 cities 

select * from countries;

create view cont_employee_id as
select count(employees.employee_id),locations.city from employees join departments on employees.department_id=departments.department_id
join locations on departments.location_id=locations.location_id group by city order by count(employees.employee_id) desc limit 5;

select * from cont_employee_id;
select * from employees;
select * from locations;

select employees.first_name,employees.last_name,countries.country_name,cont_employee_id.city,departments.department_name,employees.salary
from employees join departments on employees.department_id=departments.department_id 
join locations on departments.location_id=locations.location_id 
join countries on locations.country_id=countries.country_id
join cont_employee_id on locations.city=cont_employee_id.city;

-------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-3
-- List thhe cities in which the number of employees is less then 10

select * from employees;
select * from locations;
select * from departments;

select count(employees.employee_id) as number_of_employees,locations.city 
from employees join departments on employees.department_id=departments.department_id
join locations on departments.location_id=locations.location_id group by city having number_of_employees<10;

---------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-4
-- find the average experience (in years) of employees of each city identified in task-3

create view employee_details_view as 
select count(employees.employee_id) as number_of_employees,locations.city 
from employees join departments on employees.department_id=departments.department_id
join locations on departments.location_id=locations.location_id group by city having number_of_employees<10;

select * from employees;
select * from employee_details_view;

select avg(datediff(current_date,hire_date)/365) as experience, employee_details_view.city from employees
join departments on employees.department_id=departments.department_id
join locations on locations.location_id=departments.location_id
join employee_details_view on locations.city=employee_details_view.city group by city ;

--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-5 
-- The company wants to communicate work from home policy to those employees who are from the cities identified in task-1 and 
-- have also completed 10 years in the organisation

select * from cont_employee_id;
select * from employees;
select * from locations;
select * from departments;

select first_name,last_name,email,phone_number,(datediff(current_date,hire_date)/365)as experience, cont_employee_id.city from employees
join departments on employees.department_id=employees.department_id
join locations on departments.location_id=locations.location_id
join cont_employee_id on locations.city=cont_employee_id.city
having experience >10;

-------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-6
-- List the ids of managers of the employees identified in task 5

create view employee_details as
select first_name,last_name,email,phone_number,(datediff(current_date,hire_date)/365)as experience, cont_employee_id.city from employees
join departments on employees.department_id=employees.department_id
join locations on departments.location_id=locations.location_id
join cont_employee_id on locations.city=cont_employee_id.city
having experience >10;

select * from employee_details;
select * from employees;

select employee_details.first_name, employee_details.last_name, employee_details.email,employee_details.phone_number, employees.manager_id 
from employee_details join employees on employee_details.first_name=employees.first_name;

---------------------------------------------------------------------------------------------------------------------------------------------


