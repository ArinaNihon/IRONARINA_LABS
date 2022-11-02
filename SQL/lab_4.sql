#1 List all films whose length is longer than the average of all the films.
use sakila;
select title from film
	where length > (
	  select avg(length) from film
      );
#2 How many copies of the film Hunchback Impossible exist in the inventory system?
select count(title) from film as t 
inner join inventory using (film_id)
where title= 'Hunchback Impossible';

#3 Use subqueries to display all actors who appear in the film Alone Trip.

select first_name, last_name from actor
	where actor_id in (
		select actor_id from film_actor
         where film_id in (
            select film_id  from film
			where title='Alone Trip'));

#4 Sales have been lagging among young families, 
# and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
select title from film
 where film_id in(
    select film_id from film_category
    where category_id in(
       select category_id from category
		where name = 'Family'));
#5 Get name and email from customers from Canada using subqueries. Do the same with joins. 
#Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, 
# that will help you get the relevant information.
# subqueries
select first_name, last_name, email  from customer
where address_id in(
select address_id from address
where city_id in(
select city_id from city
where country_id in(
select country_id from country
where country='Canada')));
# joins
select first_name, last_name, email  from customer as cus
inner join address as a using (address_id)
inner join city as city using(city_id)
inner join country as c using(country_id)
where country='Canada';

#Optional 6 Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that
# has acted in the most number of films. First you will have to find the most prolific actor
# and then use that actor_id to find the different films that he/she starred.
select count(actor_id),actor_id as total from film_actor
group by actor_id
order by total desc
LIMIT 1;

select title from film
where film_id in(
select film_id from film_actor
where actor_id=(
select actor_id  from film_actor
group by actor_id
order by count(actor_id) desc
LIMIT 1));

#7 Films rented by most profitable customer. You can use the customer table and payment table to find
# the most profitable customer ie the customer that has made the largest sum of payments
select customer_id,amount from payment
group by customer_id
order by sum(amount) desc
Limit 1;

select title from film
where film_id in(
select film_id from inventory
where inventory_id in(
select inventory_id from rental
where customer_id =(
select customer_id from payment
group by customer_id
order by sum(amount) desc
Limit 1) ));