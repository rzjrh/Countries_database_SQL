
-- countries project 
-- Reza Akhlaqi		6-29-2019


-- first import and use the "world" database
show database;
use world;



-- What query would you run to get all the countries that speak Slovene?
select * from languages
where language = 'Slovene';


-- Your query should return the name of the country, language and language percentage.
-- Your query should arrange the result by language percentage in descending order.
--when both codes are match we use "join"
select countries.name, languages.language, languages.percentage from countries
join languages on countries.code= languages.country_code 
where language= 'slovene';



-- What query would you run to display the total number of cities for each country?
-- Your query should return the name of the country and the total number of cities.
-- Your query should arrange the result by the number of cities in descending order.

Select countries.id as Country_ID, countries.name as Country_Name, count(cities.id) as Number_of_Cities
from countries
join cities on countries.code = cities.country_code
group by countries.code
order by count(cities.id) desc



-- What query would you run to get all the cities in Mexico with a population of greater than 500,000? 
-- Your query should arrange the result by population in descending order
-- country_code must be same to make a join
SELECT countries.name as Country,
cities.name as Cities_GreaterThan_50000, 
cities.population 
from cities 
join countries on cities.country_id = countries.id
where countries.name = 'Mexico' and cities.population >50000
order by cities.population desc


-- What query would you run to get all languages in each country with a percentage greater than 89%?
-- Your query should arrange the result by percentage in descending order.
-- country_code must be same to make a join

select countries.id as ID, countries.name as Countries_GreaterThan89,
languages.percentage 
from countries 
join languages on countries.code = languages.country_code 
where languages.percentage > 89
order by languages.percentage desc




-- What query would you run to get all the countries with Surface Area below 501 and Population greater than 100,000?
select id, name, surface_area, population 
from countries 
WHERE surface_area < 501 and population > 100000




-- What query would you run to get countries with only Constitutional Monarchy with a capital greater than 200 
-- and a life expectancy greater than 75 years?

select id as Country_ID, name as Country, government_form, capital, life_expectancy
from countries 
where government_form = 'Constitutional Monarchy' and capital > 200 and life_expectancy > 75





-- What query would you run to get all the cities of Argentina inside the Buenos Aires district and have the population greater than 500, 000? 
-- The query should return the Country Name, City Name, District and Population

select countries.id, countries.name as Country, cities.name as City, cities.district, cities.population 
from cities 
join countries on cities.country_id = countries.id 
where countries.name = 'Argentina' and cities.district = 'Buenos Aires' and cities.population > 500000





-- What query would you run to summarize the number of countries in each region? 
-- The query should display the name of the region and the number of countries. 
-- Also, the query should arrange the result by the number of countries in descending order. 

select region as Region, count(id) as Number_of_Countries
from countries
group by region
order by  count(id) desc










