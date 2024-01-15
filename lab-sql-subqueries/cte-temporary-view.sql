-- Retrieve the client_id and the total_amount_spent of those
-- clients who spent more than the average of the total_amount spent by each client. 
-- You can use subqueries to accomplish this.
WITH grouped_customer_spending AS
(SELECT payment.customer_id,SUM(payment.amount) as total_amount
FROM payment 
GROUP BY customer_id),
average_amount AS
(SELECT
AVG(total_amount)
FROM grouped_customer_spending)

SELECT *
FROM grouped_customer_spending
WHERE  total_amount>(SELECT * FROM average_amount);

DROP TABLE IF EXISTS grouped_customer_spending_temporary_table;
CREATE TEMPORARY TABLE grouped_customer_spending_temporary_table AS
(SELECT payment.customer_id,SUM(payment.amount) as total_amount
FROM payment 
GROUP BY customer_id);
DROP TABLE IF EXISTS average_amount_temporary_table;
CREATE TEMPORARY TABLE IF NOT EXISTS average_amount_temporary_table AS
(SELECT
AVG(total_amount)
FROM grouped_customer_spending_temporary_table);

SELECT *
FROM grouped_customer_spending_temporary_table
WHERE  total_amount>(SELECT * FROM average_amount_temporary_table);


DROP VIEW IF EXISTS grouped_customer_spending_view;
CREATE VIEW grouped_customer_spending_view AS
(SELECT payment.customer_id,SUM(payment.amount) as total_amount
FROM payment 
GROUP BY customer_id);
DROP VIEW IF EXISTS average_amount_view;
CREATE VIEW average_amount_view AS
(SELECT
AVG(total_amount)
FROM grouped_customer_spending_view);

SELECT *
FROM grouped_customer_spending_view
WHERE  total_amount>(SELECT * FROM average_amount_view);



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
-- --------------------------------- --
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

-- CTE
WITH grouped AS
(SELECT 
    customer_id, SUM(amount) as spent
FROM
    payment
GROUP BY customer_id),
max_filter AS 
(SELECT 
    customer_id
FROM
    grouped
WHERE spent = (SELECT MAX(spent) FROM grouped))

SELECT 
title
FROM
rental
JOIN inventory ON inventory.inventory_id=rental.inventory_id
JOIN film ON inventory.film_id=film.film_id
WHERE customer_id = (SELECT * FROM max_filter);

-- Temporary Table
CREATE TEMPORARY TABLE IF NOT EXISTS grouped AS
(SELECT 
    customer_id, SUM(amount) as spent
FROM
    payment
GROUP BY customer_id);
CREATE TEMPORARY TABLE IF NOT EXISTS max_filter AS 
(SELECT 
    customer_id
FROM
    grouped
WHERE spent = (SELECT MAX(spent) FROM grouped));

SELECT 
title
FROM
rental
JOIN inventory ON inventory.inventory_id=rental.inventory_id
JOIN film ON inventory.film_id=film.film_id
WHERE customer_id = (SELECT * FROM max_filter);


-- View

CREATE view grouped_view AS
(SELECT 
    customer_id, SUM(amount) as spent
FROM
    payment
GROUP BY customer_id);
CREATE VIEW max_filter_view AS 
(SELECT 
    customer_id
FROM
    grouped_view
WHERE spent = (SELECT MAX(spent) FROM grouped_view));

SELECT 
title
FROM
rental
JOIN inventory ON inventory.inventory_id=rental.inventory_id
JOIN film ON inventory.film_id=film.film_id
WHERE customer_id = (SELECT * FROM max_filter_view);