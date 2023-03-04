USE sakila;
SHOW TABLES;

SELECT * FROM payment;

-- Menampilkan pembelian diatas $10
SELECT 
	customer_id,
    DAY(payment_date) AS tanggal_pembelian
FROM payment
WHERE amount > 10;

-- Mengelompokkan rata-rata pembayaran setiap hari
SELECT
	AVG(amount) AS rata_rata,
	DAYNAME(payment_date) AS hari
FROM payment
GROUP BY hari
ORDER BY rata_rata;

-- Mencari tahu jumlah pembelian dibulan agustus
SELECT
	SUM(amount)
FROM payment
WHERE MONTH(payment_date) = 8;

-- hasil penjualan rata-rata per bulan
SELECT
	AVG(amount) AS jumlah,
    MONTHNAME(payment_date) AS bulan
FROM payment
GROUP BY bulan;

-- nama hari setelah transaksi
SELECT
	customer_id,
	amount,
    DAYNAME(payment_date + 1) AS one_day_after
FROM payment
WHERE staff_id = 1 
	AND amount > 11;

-- rata-rata penjualan per tahun
SELECT
	AVG(amount),
    YEAR(payment_date) as tahun
FROM payment
GROUP BY tahun;