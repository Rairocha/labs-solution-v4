-- Determine the number of copies of the film "Hunchback Impossible" 
-- that exist in the inventory system.

SELECT 
COUNT(*) AS `Copies Hunchback Impossible`
FROM inventory
JOIN film ON film.film_id=inventory.film_id
WHERE title = 'Hunchback Impossible';

SELECT 
COUNT(*) AS `Copies Hunchback Impossible`
FROM inventory
JOIN
(SELECT 
title,
film_id
FROM
film
WHERE  title = 'Hunchback Impossible') as film_filtered ON film_filtered.film_id=inventory.film_id;
-- List all films whose length is longer than the
-- average length of all the films in the Sakila database.
SELECT AVG(length) FROM film;
SELECT 
*
FROM film
WHERE length> (SELECT AVG(length) FROM film);

-- Use a subquery to display all actors who appear in the film "Alone Trip"
SELECT film_id FROM film WHERE title='Alone Trip';

SELECT 
Concat(first_name,' ',last_name) AS actors
FROM actor
JOIN film_actor ON film_actor.actor_id=actor.actor_id
WHERE film_id = (SELECT film_id FROM film WHERE title='Alone Trip')
;

SELECT actor.first_name, actor.last_name
FROM actor
WHERE actor.actor_id
IN (SELECT film_actor.actor_id
    FROM film_actor
    JOIN film ON film_actor.film_id = film.film_id
    WHERE film.title = 'Alone Trip');

SELECT 
Concat(first_name,' ',last_name) AS actors
FROM actor
JOIN film_actor ON film_actor.actor_id=actor.actor_id
JOIN film ON film_actor.film_id=film.film_id
WHERE title='Alone Trip';

-- Sales have been lagging among young families, and you want to target family movies for a promotion. 
-- Identify all movies categorized as family films.

SELECT * FROM category;
SELECT title 
FROM film JOIN film_category ON film.film_id=film_category.film_id
WHERE category_id = (SELECT category_id FROM category WHERE name='Family');

SELECT film.title 
FROM film JOIN film_category ON film.film_id=film_category.film_id
JOIN category ON category.category_id=film_category.category_id
WHERE category.name='Family';

-- Retrieve the name and email of customers from Canada using both subqueries and joins. To use joins,
-- you will need to identify the relevant tables and their primary and foreign keys.
SELECT * FROM country WHERE country='Canada';
SELECT * FROM city WHERE country_id=(SELECT country_id FROM country WHERE country='Canada');
SELECT * FROM address WHERE city_id IN (SELECT city_id FROM city WHERE country_id=(SELECT country_id FROM country WHERE country='Canada'));
SELECT 
    CONCAT(first_name, ' ', last_name) AS name, email
FROM
    customer
WHERE
    address_id IN (SELECT 
            address_id
        FROM
            address
        WHERE
            city_id IN (SELECT 
                    city_id
                FROM
                    city
                WHERE
                    country_id = (SELECT 
                            country_id
                        FROM
                            country
                        WHERE
                            country = 'Canada')));
				
SELECT 
    CONCAT(first_name, ' ', last_name) AS name, email
FROM
    customer
JOIN address ON address.address_id=customer.address_id
JOIN city ON city.city_id=address.city_id
JOIN country ON country.country_id=city.country_id
WHERE country.country='Canada';
-- Determine which films were starred by the most prolific actor in the Sakila database.
-- A prolific actor is defined as the actor who has acted in the most number of films.
-- First, you will need to find the most prolific actor and then use that actor_id to
-- find the different films that he or she starred in.
SELECT actor.actor_id,COUNT(film_actor.film_id)
FROM actor 
JOIN film_actor ON actor.actor_id=film_actor.actor_id
GROUP BY actor_id
ORDER BY COUNT(film_actor.film_id) DESC
LIMIT 1
;


SELECT actor.actor_id
FROM actor 
JOIN film_actor ON actor.actor_id=film_actor.actor_id
GROUP BY actor_id
HAVING COUNT(film_actor.film_id) =(SELECT 
MAX(movies_count)
FROM
(SELECT actor.actor_id,COUNT(film_actor.film_id)AS movies_count
FROM actor 
JOIN film_actor ON actor.actor_id=film_actor.actor_id
GROUP BY actor_id)as grouped_movie);


SELECT title
FROM actor
JOIN film_actor ON actor.actor_id=film_actor.actor_id
JOIN film ON film.film_id=film_actor.film_id
WHERE actor.actor_id=(SELECT actor.actor_id
FROM actor 
JOIN film_actor ON actor.actor_id=film_actor.actor_id
GROUP BY actor_id
HAVING COUNT(film_actor.film_id) =(SELECT 
MAX(movies_count)
FROM
(SELECT actor.actor_id,COUNT(film_actor.film_id)AS movies_count
FROM actor 
JOIN film_actor ON actor.actor_id=film_actor.actor_id
GROUP BY actor_id)as grouped_movie));

SELECT title
FROM actor
JOIN film_actor ON actor.actor_id=film_actor.actor_id
JOIN film ON film.film_id=film_actor.film_id
WHERE actor.actor_id=(SELECT actor.actor_id
FROM actor 
JOIN film_actor ON actor.actor_id=film_actor.actor_id
GROUP BY actor_id
ORDER BY COUNT(film_actor.film_id) DESC
LIMIT 1);

-- Find the films rented by the most profitable customer in the Sakila database.
-- You can use the customer and payment tables to find the most profitable customer, 
-- i.e., the customer who has made the largest sum of payments.

SELECT 
    customer_id, SUM(amount)
FROM
    payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 1;


SELECT 
    customer_id
FROM
    payment
GROUP BY customer_id
HAVING SUM(amount) = 
(SELECT 
MAX(spent)
FROM
(SELECT 
    customer_id, SUM(amount) as spent
FROM
    payment
GROUP BY customer_id) as grouped);

SELECT 
title
FROM
rental
JOIN inventory ON inventory.inventory_id=rental.inventory_id
JOIN film ON inventory.film_id=film.film_id
WHERE customer_id = (SELECT 
    customer_id
FROM
    payment
GROUP BY customer_id
HAVING SUM(amount) = 
(SELECT 
MAX(spent)
FROM
(SELECT 
    customer_id, SUM(amount) as spent
FROM
    payment
GROUP BY customer_id) as grouped));

SELECT 
title,payment.amount
FROM
rental
JOIN inventory ON inventory.inventory_id=rental.inventory_id
JOIN film ON inventory.film_id=film.film_id
JOIN payment ON rental.rental_id=payment.rental_id
WHERE rental.customer_id = (SELECT 
    customer_id
FROM
    payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 1);
-- Retrieve the client_id and the total_amount_spent of those
-- clients who spent more than the average of the total_amount spent by each client. 
-- You can use subqueries to accomplish this.
SELECT payment.customer_id,SUM(payment.amount) as total_amount
FROM payment 
GROUP BY customer_id
HAVING SUM(payment.amount)>(
SELECT
AVG(total_amount)
FROM
(SELECT payment.customer_id,SUM(payment.amount) as total_amount
FROM payment 
GROUP BY customer_id) as grouped)
;