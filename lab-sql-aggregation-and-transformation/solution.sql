USE sakila;
-- question1

SELECT
MAX(length) AS max_length,
ROUND(AVG(length)) AS avg_length,
MIN(length) AS min_length
FROM
film;

SELECT
FLOOR(AVG(length)/60) AS avg_hour,
FLOOR(AVG(length)%60) AS avg_minute,
CONCAT(FLOOR(AVG(length)/60),'h ',FLOOR(AVG(length)%60),'min') AS avg_time,
SEC_TO_TIME(AVG(length)*60) AS avg_time
FROM 
film;

-- question2
SELECT 
MAX(return_date)- MIN(rental_date),
 datediff(MAX(return_date),MIN(rental_date)) 
 FROM rental;
 
 SELECT 
 *,
 DAYNAME(rental_date),
 monthname(rental_date),
 MONTH(rental_date),
 WEEKDAY(rental_date),
 date_format(rental_date,'%M'),
 date_format(rental_date,'%W'),
 CASE 
	WHEN  WEEKDAY(rental_date)<5 then 'Workday'
    WHEN WEEKDAY(rental_date)>=5 then 'Weekend'
ELSE 
	'Not a weekday at all'
END AS day_type,
IF(WEEKDAY(rental_date)<5,'Workday','Weekend') AS day_type

 FROM rental
;
/* Verifying the answer
SELECT
DISTINCT
 DAYNAME(rental_date),
 CASE 
	WHEN  WEEKDAY(rental_date)<5 then 'Workday'
    WHEN WEEKDAY(rental_date)>=5 then 'Weekend'
ELSE 
	'Not a weekday at all'
END AS workdays
 FROM rental;*/
 
 -- question3
 SELECT 
 title,
 IFNULL(rental_duration,'Not available') ,
 CASE WHEN rental_duration is null then 'Not available' ELSE rental_duration END ,
 IF(rental_duration is null,'Not available',rental_duration)
 FROM film;
 
 /*Do the update if I want to change the database
 UPDATE film SET rental_duration='Not available' WHERE rental_duration is null;*/
 
 -- question4 Bonus
 SELECT 
 CONCAT(first_name,' ',last_name),
 LEFT(email,3),
 SUBSTRING(email,1,3)
 FROM customer;
 
 -- Challenge 2
 -- question 1 
SELECT Count(*) FROM film;
SELECT DISTINCT rating FROM film;
SELECT Count(*)  FROM film WHERE rating='PG';
SELECT Count(*)  FROM film WHERE rating='G';
 SELECT rating,Count(*)  FROM film GROUP BY rating ORDER BY Count(*) DESC;
 
 -- question 2
 SELECT ROUND(AVG(length)) FROM film;
SELECT rating, ROUND(AVG(length)) FROM film GROUP BY rating  ORDER BY ROUND(AVG(length)) DESC;



SELECT 
    rating, 
    ROUND(AVG(length))
FROM
    film
GROUP BY rating
HAVING FLOOR(AVG(length)/60)>=2
ORDER BY ROUND(AVG(length)) DESC;

-- question 3
SELECT last_name FROM actor;
SELECT COUNT(*) FROM actor WHERE last_name = 'AKROYD';

SELECT 
last_name
FROM actor 
group by last_name
HAVING COUNT(*) = 1;