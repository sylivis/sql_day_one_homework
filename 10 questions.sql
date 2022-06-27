--1. How many actors are there with the last name ‘Wahlberg’? 
select count(last_name)
from actor a 
where last_name like 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99? 
select count(amount)
from payment p
where amount between 3.99 and 5.99;

--3. What film does the store have the most of? (search in inventory) 
select film_id, count(film_id) as in_stock
from inventory 
group by film_id 
order by in_stock desc
limit 1;

--4. How many customers have the last name ‘William’? 
select count(last_name)
from customer c  
where last_name like 'William';

--5. What store employee (get the id) sold the most rentals? 
select staff_id, count(staff_id) as num_sold
from payment p  
group by staff_id 
order by  num_sold desc
limit 1;

--6. How many different district names are there? 
select count(distinct  district)
from address a ;

--7. What film has the most actors in it? (use film_actor table and get film_id) 
select film_id, count(distinct actor_id) as num_actors
from film_actor fa 
group by film_id
order by num_actors desc
limit 1;

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table) 
select count(last_name)
from customer c 
where store_id = 1 and last_name like '%es'

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers  with ids between 380 and 430? (use group by and having > 250) 
select count(*)
from (
	select count(amount)
	from payment
	where customer_id between 380 and 430
	group by amount
	having count(*) > 250
	) as payments
	
--Within the film table, how many rating categories are there? And what rating has the most movies total?
--select count(distinct rating),  

select *
from (
	select count(distinct rating) as num_rating
	from film 
	) as x, 	
	(select rating as most_popular
	from film 
	group by rating
	order by count(rating) desc
	limit 1) as y 
	
 
