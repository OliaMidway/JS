select count(distinct title) from film2.film_locations_in_san_francisco; 

-- Count of all films by release year
select `release year`, count(distinct title) as movie_cnt 
from film2.film_locations_in_san_francisco
group by `release year`; 

-- Count of all films by 'production company'
select `production company`, count(distinct title) movie_cnt
from film2.film_locations_in_san_francisco
group by `production company`; 

-- Count of all films directed by Woody Allen
select director, count(distinct title) movie_cnt
from film2.film_locations_in_san_francisco
where director like '%Woody Allen%'
group by director; 

-- How many movies have/don't have fun facts?
select case when `fun facts` = '' then 'no' else 'yes' end fun_fact, 
count(distinct title) movie_cnt
from film2.film_locations_in_san_francisco
group by case when `fun facts` = '' then 'no' else 'yes' end; 

-- In how many movies were Keanu Reeves and Robin Williams?
select count(distinct title) movie_cnt
from film2.film_locations_in_san_francisco
where `actor 1` in ('Keanu Reeves', 'Robin Williams')
or `actor 2` in ('Keanu Reeves', 'Robin Williams')
or `actor 3` in ('Keanu Reeves', 'Robin Williams');
