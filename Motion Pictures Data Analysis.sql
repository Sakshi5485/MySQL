USE SAKILA;

-----------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-1
-- The sakila rental store management wants to know the names of all actors in their movies collection 
-- display the first name,last name, actors id and details of all last updated columns

select * from actor;

select first_name, last_name, actor_id, last_update from actor;

-----------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-2
-- Many actors have adopted attractive screen names mostly at the behest of producers and directors 
-- the management wants to know the following

-- 1. Display the full name of all actors

select concat(first_name,'_',last_name) as FULLNAME from actor;

-- Display the first name of actors along with the count of repated first name

select first_name,count(first_name)as count_of_first_name from actor group by first_name;

-- Display the last name of actors along with the count of repeated last names

select last_name,count(last_name) from actor group by last_name;

----------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-3
-- Display the count of movies group by ratings.

select * from film;

select rating,count(title) as count_of_movies from film group by rating;

-------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-4
-- calculate and display the average rental rates based on the movie ratings

select rating,avg(rental_rate) from film group by rating;

-------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-5
-- A. display the movie title where the replacement cost is up to $9

select * from film;

select title,replacement_cost from film where replacement_cost <'9';

-- B. Display the movies title where the replacemant cost is between $15 and $20

select title,replacement_cost from film where replacement_cost between 15 and 20;

--  C. display the movies title with highest replacement cost and lowest rental cost

select title, replacement_cost,rental_rate 
from film where replacement_cost=(select max(replacement_cost)from film)
and rental_rate=(select min(rental_rate)from film);
---------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-6
-- The management needs to know the list of all movies along with the number of actors listed for each movies

select * from film;
select * from film_actor;

select title,count(actor_id) as No_of_actors from film join film_actor on film.film_id=film_actor.film_id group by title;

--------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-7
-- Display the movies title starting with the letter K and Q

select title from film where title like 'K%';
select title from film where title like 'Q%';

-------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-8
-- The movie 'AGENT TRUMAN' has been a greate success 
-- display the first name and last names of all actors who are part of this movie
select * from actor;
select * from film;
select * from film_actor;

select first_name,last_name from actor join 
film_actor on actor.actor_id=film_actor.actor_id
join film on film.film_id=film_actor.film_id where title = 'AGENT TRUMAN';

--------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-9
-- Sales has been down among the family audience with kids. the management wants to promote the movies that fall 
-- under the children category. identify & display the names of movies in the family category

select * from film_category;
select * from category;
select * from film;

select title from film 
join film_category on film.film_id=film_category.film_id
join category on film_category.category_id=category.category_id 
where name = 'family';

--------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-10 Wrong
-- Display the name of most frequently rented movies in decreasing order so that the management can maintain more copies of such movies

select * from film;
select * from inventory;
select * from rental;

select film.title, count(rental_id) as  rental_count from rental 
join inventory on rental.inventory_id=inventory.inventory_id
join film on film.film_id=inventory.film_id
group by film.title order by rental_count desc;

-- count of rental id
--------------------------------------------------------------------------------------------------------------------------------------------

-- TASK-11
-- Calculate and the display the number of movies categories where the average difference between the movies replacement
-- cost and and the rental rate is greater than $15

select * from film;
select * from category;
select * from film_category;

select COUNT(*) as category_count
from (select category.name, avg(film.replacement_cost) - avg(film.rental_rate) as avg_diff from film 
join film_category film_category on film.film_id = film_category.film_id
join category  on film_category.category_id = category.category_id
group by category.name  having avg(film.replacement_cost) - avg(film.rental_rate) > 15) as S;

 
----------------------------------------------------------------------------------------------------------------------------------------------
-- TASK-12

-- The management wants to indentify the all genres that consists of 60-70 movies the genre details are captured 
-- in the column category display the names of this categories /genres and the number of movies per category 
-- sorted by the number of movies 

select * from film;
select * from category;
select * from film_category;

select category.name,count(*) as num_of_movies from film
join film_category on film_category.film_id=film.film_id
join category on category.category_id=film_category.category_id group by category.name
having count(*) between 60 and 70 order by count(*) desc;

---------------------------------------------------------------------------------------------------------------------------------------

