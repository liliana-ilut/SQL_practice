select last_name, first_name from actor;
select first_name, last_name, email from customer;
select * from film;
select distinct rating from film;
select count (amount) from payment;
select count (distinct amount) from payment;
--where clause
select * from customer
where first_name = 'Jared';

select count (*) from film
where 
	rental_rate > 4
	and replacement_cost >= 19.99
	and rating = 'R';
	
select count (*) from film
where 
	rating != 'R'
	or rating = 'PG-13';
	
--challenge where clause
--#1
select first_name, last_name, email from customer
where 
	first_name like 'Nancy'
	and last_name like 'Thomas';
	
--#2
select description from film
where title like 'Outlaw Hanky';

--#3
select phone from address
where address = '259 Ipoh Drive';


---Order by
select store_id, first_name, last_name from customer
order by store_id desc, first_name asc;

--LIMIT
select * from payment
where amount != 0
order by payment_date desc
limit 5;

--challenge for order by and limit
-- #1
select customer_id from payment
where amount != 0.00
order by payment_date asc
limit 10;

-- #2
select title, film.length from film
order by film.length asc
limit 5;

--#3

select count (title) from film
where film.length <= 50;

--- between
select * from payment
where payment_date between '2007-02-01' and '2007-02-15';

--IN
select distinct (amount) from payment
order by amount;

select count (*) from payment
where amount not in (0.99, 1.98, 1.99);

select * from customer
where first_name not in ('John', 'Jake', 'Julie');

--Like and ilike
select * from customer
where first_name ilike 'j%' and last_name ilike 's%';

select * from customer
where first_name like 'A%' and last_name not like 'B%'
order by last_name;

--challenge
--#1 how many payment transactions were greater than 5?
select count (*) from payment
where amount > 5.00;

--#2 how many actors have a first name that starts with a letter P?
select count (first_name) from actor
where first_name ilike 'p%';

--#3 how many unique districts are our customers from?
select distinct (count (district)) from address;

--#4 retrive the list of names for those distinct districts from the previous question
select distinct(district) from address;

--#5 how many films have a rating of R and a replacement cost between 5 and 15?
select count (*) from film
where rating ='R'
and replacement_cost between 5.00 and 15.00;

--#6 how many films have the word Truman somewhere in the title?
select count (*) from film
where title like '%Truman%';

--AGREGATE FUNCTIONS
select count (*) from film; --1000
select min(replacement_cost) from film; --9.99
select max(replacement_cost) from film; --29.99
select min(replacement_cost), max(replacement_cost), round(avg(replacement_cost),2) from film;--19.98 avg
select sum(replacement_cost) from film; --19984.00

--GROUP BY
select customer_id , sum(amount) from payment
group by customer_id
order by sum(amount) desc;

select customer_id, staff_id, sum(amount) from payment
group by staff_id, customer_id
order by staff_id, customer_id;

select date(payment_date), sum(amount) from payment -- removed the hours, and minutes
group by date(payment_date)
order by sum(amount) desc;

--challenges group by
--#1 
select staff_id, count(amount) from payment
group by staff_id;
-- staff_id #1 gets the bonus since it has more payments

--#2
select rating, round(avg(replacement_cost),2) from film
group by rating
order by round(avg(replacement_cost),2);

--#3
select customer_id, sum(amount) from payment
group by customer_id
order by sum(amount) desc
limit 5;


---HAVING CLAUSE
select customer_id, sum(amount) from payment
-- where customer_id not in (184,87,477)
group by customer_id
having sum(amount) > 100;

select store_id, count(customer_id) from customer
group by store_id
having count(customer_id) > 300;

--Challenges with having clause
--#1
select customer_id, count(amount) from payment
group by customer_id
having count(amount) >= 40;

--#2
select customer_id, staff_id, sum(amount) from payment
where staff_id = 2
group by customer_id, staff_id
having sum(amount) > 100;

--- WHERE IS ALWAYS BEFORE GROUP BY
--- HAVING IS ALWAYS AFTER GROUP BY

--JOINS
--AS STATEMENT
select amount as rental_price
from payment;

--You can only use the alias in the select statment, not in the where clause 
select count(amount) as num_transactions
from payment;

select customer_id, sum(amount) as total_spent
from payment
group by customer_id
having sum(amount) > 100;
-- having total_spent > 100; --this is wrong, will give an error, since the total_spent is just an alias

--***************************
--JOINS
--INNER JOINS -- takes the records from the inside that are the same
--JOIN is equal to INNER JOIN

select payment_id, payment.customer_id, first_name 
from payment
inner join customer
on payment.customer_id = customer.customer_id;

--FULL OUTER JOINS
select * from payment;
select * from customer
full outer join payment
on customer.customer_id = payment.customer_id
where customer.customer_id is null
or payment.payment_id is null;
--check your work-- check the count of rows for each table
select count (distinct customer_id) from payment;

--LEFT OUTER JOINS
--order matters--it matters which is the left table
select * from film;
select * from inventory;

select film.film_id, title, inventory_id, store_id
from film
left join inventory
on inventory.film_id= film.film_id
where inventory.film_id is null;

--RIGHT OUTER JOINS
--similar to the left join, just switching things around
--UNION
-- join challenges
--#1 what is the email address of the customer from California
select * from customer;
select * from address;

select email from customer
join address
on customer.address_id = address.address_id
where district like 'California';
--there are 9 results

--#2
select * from actor
where first_name like 'Nick'
and last_name like 'Wahlberg';


select title, first_name, last_name from film
join film_actor
	on film.film_id = film_actor.film_id
join actor
	on actor.actor_id = film_actor.actor_id
where film_actor.actor_id = 2;	





















