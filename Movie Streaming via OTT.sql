-- USING SAKILA DATABASE

use sakila;

-- Task-1 
-- Movie renatl companies usually maintain multiple physical copies of the most popular and trending movies.
-- Identify and display the film/movie ids and the existing number of copies for the following movies.
-- Brotherhood blanket
-- Soup Wisdom

select * from film;
select * from customer;
select * from rental;
select * from store;

select film_id, title, count(inventory.film_id) as No_of_Copies from film
join inventory using(film_id) where title ="Soup Wisdom" or  title ="Brotherhood blanket"
group by inventory.film_id;

--------------------------------------------------------------------------------------------------------------------------------------

-- Task-2 
-- Calculate and display the number of movies in each genre

select * from category;
select * from film_category;

select category.name as genre,
(select count(*) from film_category where category.category_id=film_category.category_id)as no_of_movies from category;

-----------------------------------------------------------------------------------------------------------------------------------------

-- Task-3
-- Display the first name and last name of top three actors whose movie have the highest replacement cost

select * from film_actor;
select * from actor;
select * from film;

select actor.first_name,actor.last_name,film.replacement_cost from actor join
film_actor on actor.actor_id=film_actor.actor_id join
film on film.film_id=film_actor.film_id 
order by film.replacement_cost desc limit 3;

------------------------------------------------------------------------------------------------------------------------------------------

-- Task-4
-- Movies can be based on actual incidents, political issues, mystery, fiction, etc
-- calculate and display total sales amount for each type of movie

select * from film_category;
select * from film;
select * from payment;
select * from category;
select * from inventory;

select category.name,sum(payment.amount) from category join
film_category on film_category.category_id=category.category_id join
inventory on inventory.film_id=film_category.film_id join
rental on inventory.inventory_id=rental.inventory_id join
payment on rental.rental_id=payment.rental_id 
group by category.name;

-------------------------------------------------------------------------------------------------------------------------------------------

-- Task-5
-- Display the top 10 genre of movies based on their revenues stored in decending order.
-- Save the resulta in CSV file and present the results visually using bar graph and pie chart

select category.name as genre, SUM(payment.amount) from category join
film_category ON category.category_id = film_category.category_id join
inventory ON film_category.film_id = inventory.film_id join
rental ON inventory.inventory_id = rental.inventory_id join
 payment ON rental.rental_id = payment.rental_id
group by category.name order by sum(payment.amount) desc limit 10;

-------------------------------------------------------------------------------------------------------------------------------------------
