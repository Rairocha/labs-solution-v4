USE sakila;
-- question1
SHOW TABLES;


-- question2
SELECT * from actor;
SELECT * from film;
SELECT * from customer;
/* Dont do an accidental cross join! SELECT * FROM actor,film,customer;*/

-- question3
SELECT title from film;
SELECT name AS language FROM language;
SELECT first_name FROM staff;

-- question 4 

SELECT DISTINCT release_year FROM film;

-- question 5
SELECT COUNT(*) FROM store;
SELECT COUNT(*) FROM staff;

SELECT COUNT(rental_id) FROM rental WHERE return_date is not null;
SELECT COUNT(DISTINCT film_id) FROM inventory;

SELECT COUNT(DISTINCT last_name	) FROM actor;

-- question 6
SELECT * FROM film ORDER BY length DESC LIMIT 10;

-- question 7
SELECT * FROM actor WHERE first_name="SCARLETT";

-- bonus
SELECT * FROM film WHERE title LIKE "%ARMAGEDDON%" and length>100;
SELECT * FROM film WHERE title REGEXP ".*ARMAGEDDON.*" and length>100;
SELECT COUNT(*) FROM film WHERE special_features LIKE "%Behind the Scenes%";
SELECT COUNT(*) FROM film WHERE special_features REGEXP ".*Behind the Scenes.*";