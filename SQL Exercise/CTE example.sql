USE sakila;
SHOW TABLES;

SELECT * FROM film;
-- Gunakan database sakila
-- Tampilkan kolom film id dan rental duration, dimana rental duration nilainya harus lebih besar atau sama dengan rata-rata rental duration keseluruhan
-- Tampilkan 5 data berdasarkan rental duration secara descending, gunakan CTE
WITH rental_avg AS (
	SELECT
		AVG(rental_duration) AS average
	FROM film
)
SELECT
	film_id,
	rental_duration
FROM film
WHERE rental_duration >= (SELECT average FROM rental_avg)
ORDER BY rental_duration DESC
LIMIT 5;