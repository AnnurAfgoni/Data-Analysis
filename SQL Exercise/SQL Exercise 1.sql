use sakila;
show tables;

select * from payment;
select * from film;
select * from language;
select * from actor;
select * from film_actor;

-- nomor 1
SELECT
	customer_id,
	rental_id,
	amount,
	payment_date
FROM payment
LIMIT 10;

-- nomor 2
SELECT
	title,
	release_year,
	rental_duration
FROM film
WHERE title LIKE "S%"
LIMIT 10;

-- nomor 3
SELECT
	rental_duration,
	COUNT(title) AS Banyak_Film,
	ROUND(AVG(length), 2) AS rerata_durasi_film
FROM film
GROUP BY rental_duration
ORDER BY rental_duration;

-- nomor 4
SELECT
	title,
	length,
	rating
FROM film
WHERE length > (
	SELECT AVG(length) FROM film
)
ORDER BY length DESC
LIMIT 25;

-- nomor 5
SELECT
	rating,
	MAX(replacement_cost),
	MIN(rental_rate),
	AVG(length)
FROM film
GROUP BY rating;

-- nomor 6
SELECT
	film.title,
	film.length,
	language.name
FROM film INNER JOIN language
ON film.language_id = language.language_id
WHERE film.title LIKE "%K";

SELECT
	f.title,
	f.length,
	l.name
FROM film f, language l
WHERE f.language_id = l.language_id AND f.title LIKE "%K";

--
select * from film;
select * from actor;
select * from film_actor;

-- nomor 7
SELECT
	film.title,
	actor.first_name,
	actor.last_name
FROM film JOIN film_actor
ON film.film_id = film_actor.film_id
JOIN actor
ON film_actor.actor_id = actor.actor_id
WHERE actor.actor_id = 14;

select * from city;
-- nomor 8
SELECT
	city,
	country_id
FROM city
WHERE city LIKE "%d%a"
ORDER BY city
LIMIT 15;

SELECT * FROM category;
SELECT * FROM film;
SELECT * FROM film_category;
-- nomor 9
SELECT
	category.name as genre,
	COUNT(title) as jumlah_film
FROM film JOIN film_category
ON film.film_id = film_category.film_id
JOIN category
ON category.category_id = film_category.category_id
GROUP BY genre
ORDER BY jumlah_film;

SELECT * FROM film;
-- nomor 10
SELECT
	title,
	description,
	length,
	rating
FROM film
WHERE title LIKE "%h" AND length > (
	SELECT AVG(length) FROM film
)
ORDER BY title;