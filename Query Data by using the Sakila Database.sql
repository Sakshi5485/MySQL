-- SPRINT-2_Practice

use sakila;

-- TASK-1 
-- Extract inactive customers

select * from customer where active = 0;

-------------------------------------------------------------------------------------------------------

-- TASK-2 
-- Identify first_name, last_name and email of inactive customers

select first_name,last_name,email from customer where active = 0;

--------------------------------------------------------------------------------------------------------

-- TASK -3
-- Identify the store_id having highest number of inactive customers
select * from customer;

select store_id, count(*) from customer where active = 0 group by store_id limit 1;

---------------------------------------------------------------------------------------------------------

-- TASK-4
-- Identify the names of movies that are rated as PG-13

select * from film;

select title from film where rating = 'PG-13';

------------------------------------------------------------------------------------------------------------

-- TASK-5
-- Identify the top three novies with PG-13 rating that have the longest running time

select * from film;

select title,length from film where rating = 'PG-13' order by length desc limit 3;

--------------------------------------------------------------------------------------------------------------

-- TASK-6
-- Find te most popular PG13 movies based on rental duration 

select * from film where rating = 'PG-13' order by rental_duration asc;

-----------------------------------------------------------------------------------------------------------------

-- TASK-7
-- Avg rental cost of movies

select * from film;

select avg(rental_rate) as average_rental_cost from film;

-------------------------------------------------------------------------------------------------------------------

-- TASK -8
-- Find the total replacement cost of all movies

select * from film;

select sum(replacement_cost) as total_replacement_cost from film;

------------------------------------------------------------------------------------------------------------------------

-- TASK-9
-- Identify the number of films from the following category
-- Animation
-- Children

select * from film_category;
select * from category;

select category_id,name from category where name = 'animation' or name = 'children';

select count(category_id) as count_of_animation from film_category where category_id = '2';
select count(category_id) as children from film_category where category_id = '3';

---------------------------------------------------------------------------------------------------------------------------

