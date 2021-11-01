USE dqlab;

-- PPengenalan Table - Customer
SELECT *FROM customer;

-- Pengenalan Table - Product
SELECT *FROM product;

-- Pengenalan Table - Subscription
SELECT *FROM subscription;

-- Pengenalan Table - Invoice
SELECT *FROM invoice;

-- Pengenalan Table - Payment
SELECT *FROM payment;

 -- Menampilkan detail konsumen
 SELECT b.name,
	      b.address,
        b.phone, 
        a.product_id, 
        a.subscription_date 
FROM subscription a 
JOIN customer b 
ON a.customer_id=b.id
WHERE b.id IN 
(
	SELECT 
    	customer_id 
        FROM Subscription 
    GROUP BY customer_id 
    HAVING COUNT(customer_id) > 1
) 
ORDER BY b.id ASC;

-- Penggunaan Fungsi MAX pada Having
SELECT product_id, 
	   MAX(total_price) as total 
FROM invoice 
GROUP BY product_id;

SELECT product_id, 
	   MAX(total_price) as total 
FROM invoice 
GROUP BY product_id 
HAVING MAX(total_price) > 1000000;

SELECT product_id, 
	   MAX(pinalty) AS total 
FROM invoice 
GROUP BY product_id 
HAVING MAX(pinalty) > 30000;

-- Penggunaan Fungsi MIN pada Having
SELECT product_id, 
	   MIN(total_price) AS total 
FROM invoice 
GROUP BY product_id;

SELECT product_id, 
	   MIN(total_price) AS total 
FROM invoice 
GROUP BY product_id 
HAVING MIN(total_price) < 500000;

SELECT product_id, 
	   MIN(pinalty) AS total 
FROM invoice 
GROUP BY product_id 
HAVING MIN(pinalty) < 50000;

-- Penggunaan Fungsi AVG di Having
SELECT product_id, 
	   AVG(total_price) AS total 
FROM invoice 
GROUP BY product_id;

SELECT product_id, 
	   AVG(total_price) AS total 
FROM invoice 
GROUP BY product_id 
HAVING AVG(total_price) > 100000;

SELECT product_id, 
	   AVG(pinalty) AS total 
FROM invoice 
GROUP BY product_id 
HAVING AVG(pinalty) > 30000;

-- Mini Quiz
-- Menampilkan product_id, rata-rata nilai pinalty dan jumlah customer_id yang di group by berdasarkan product_id yang memiliki jumlah customer_id diatas nilai 20
SELECT product_id, 
	   AVG(pinalty), 
	   COUNT(customer_id) as total 
FROM invoice 
GROUP BY product_id 
HAVING COUNT(customer_id) > 20;	

