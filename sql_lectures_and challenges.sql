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























