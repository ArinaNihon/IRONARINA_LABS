# Query 1 Which actor has appeared in the most films?
use  sakila;
select count(actor_id),first_name,last_name from actor as a
inner join film_actor as f using (actor_id)   
group by actor_id
order by count(actor_id) desc
LIMIT 1;
# Query 2 Most active customer (the customer that has rented the most number of films)?
select count(customer_id),first_name,last_name from customer as c
inner join rental as r using(customer_id)
group by customer_id
order by count(customer_id) desc
LIMIT 1;
# Query 3 List number of films per category.
select category_id,name, count(film_id) from category as c
inner join film_category as f using(category_id)
group by category_id 
order by name asc;
# Query 4 Display the first and last names, as well as the address, of each staff member.

select first_name, last_name,address from staff as s
inner join address as a using(address_id)
where s.address_id=a.address_id;

# Query 5 get films titles where the film language is either English or italian, and whose titles starts with letter "M" , sorted by title descending.
select title,name from film
inner join language as n using(language_id)
where title like 'M%' and name in('English') or name in ('Italian')
order by title asc;

# Query 6 Display the total amount rung up by each staff member in August of 2005.
select payment_date from payment;
select first_name,last_name,sum(amount)  from staff as s 
inner join payment as a using (staff_id)
where payment_date>'2005-08-00 00:00:00' and payment_date<'2005-08-31 00:00:00'
group by first_name;

# Query 7 List each film and the number of actors who are listed for that film.
select title, count(film_id) from film as f
inner join film_actor as af using (film_id)
inner join actor as a using(actor_id)
group by title
order by title asc;

# Query 8 Using the tables payment and customer and the JOIN command,
# list the total paid by each customer. List the customers alphabetically by last name.
select first_name, last_name, sum(amount) from customer as c
inner join payment as af using (customer_id)
group by last_name
order by last_name asc;

# Query 9 Write sql statement to check if you can find any actor who never particiapted in any film.
select first_name, last_name,title from actor
left join film_actor using (actor_id)
right join film using (film_id)
where title is null;

# Query 10 get the addresses that has NO customers, and ends with the letter "e"
select address from address
left join customer using (address_id)
where customer_id is null and address like ‘%e’;

