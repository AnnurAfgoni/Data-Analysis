use sakila;
show tables;

select * from payment;
select * from film;
select * from language;

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
