
-- USING HR DATABASE

use world;

------------------------------------------------------------------------------------------------------------------------------------------
-- Task-1
-- Display all rows from the country table and calculate the number of rows in this table

select count(*)as NO_OF_ROWS from country;

-- Display the country names and the population of countries with the codes("USA","GBR","ARE")

select * from country;
select Name,Population,Code from country where Code in ("USA","GBR","ARE");

-------------------------------------------------------------------------------------------------------------------------------------------

-- Task-2
-- Display the continent names and the sum of population of all countries in the continents in descending order

select * from country;

select Continent,sum(Population) from country group by Continent order by sum(population)desc;

--------------------------------------------------------------------------------------------------------------------------------------------

-- Task-3
-- Display the name of those countries of all European continent where the language spoken is French

select * from country;
select * from countrylanguage;

select country.Name,country.continent,countrylanguage.Language from country 
join countrylanguage on country.Code=countrylanguage.CountryCode
where continent="Europe" having countrylanguage.Language="French";

--------------------------------------------------------------------------------------------------------------------------------------

-- Task-4
-- Display the name of the country with the highest population from each continent in the database

select * from country;

select Name,Continent,Population from Country where Population in(select max(Population) from country group by Continent);

----------------------------------------------------------------------------------------------------------------------------------------
