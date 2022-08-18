--ASSESSMENT TEST 1
--#1 Return the customer IDs of customers who have spent at least $110 with teh staff member who has the ID of 2
select customer_id, sum(amount) from payment
where staff_id = 2 
group by customer_id
having sum(amount) > 110;
--the answer is 187 and 148

--#2 How many films begin with the letter J?
select count(*) from film
where title like 'J%';
-- the answer is 20

--#3 what customer has the highest customer ID number whose name starts with an 'E' has an address ID lower than 500?
select first_name, last_name from customer
where first_name like 'E%'
	  and address_id < 500 
order by customer_id desc
limit 1;
--the answer Eddie Tomlin



