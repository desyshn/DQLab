USE dqlab;

-- Memahami table
SELECT *
FROM orders_1 
LIMIT 5;

SELECT *
FROM orders_2 
LIMIT 5;

SELECT *
FROM customer 
LIMIT 5;

-- Total Penjualan dan Revenue pada Quarter-1 (Jan, Feb, Mar) dan Quarter-2 (Apr,Mei,Jun)
SELECT 
  SUM(quantity) AS total_penjualan, 
  SUM(quantity * priceEach) AS revenue
FROM orders_1
WHERE status = "Shipped";

SELECT 
  SUM(quantity) AS total_penjualan, 
  SUM(quantity * priceEach) AS revenue
FROM orders_2
WHERE status = "Shipped";

-- Menghitung persentasi keseluruhan penjualan
SELECT 
  quarter, 
  SUM(quantity) AS total_penjualan, 
  SUM(quantity*priceEach) AS revenue
FROM (
  SELECT 
    orderNumber, 
    status, 
    quantity, 
    priceEach, 
    1 AS quarter
  FROM orders_1 
  UNION
  SELECT 
    orderNumber, 
    status, 
    quantity, 
    priceEach, 
    2 AS quarter
  FROM orders_2
  ) AS tabel_a
WHERE status = "Shipped"
GROUP BY quarter

-- Apakah jumlah customers xyz.com semakin bertambah?
SELECT 
  quarter, 
  COUNT(DISTINCT customerID) AS total_customers
FROM (
  SELECT 
    customerID, 
    createDate, 
    QUARTER(createDate) AS quarter
  FROM customer
  WHERE createDate BETWEEN '2004-01-01' AND '2004-06-30'
  ) as tabel_b
GROUP BY quarter

-- Seberapa banyak customers tersebut yang sudah melakukan transaksi?
SELECT 
  quarter, 
  COUNT(DISTINCT customerID) AS total_customers
FROM(
	SELECT 
    customerID, 
    createDate, 
    QUARTER(createDate) AS quarter
	FROM customer
	WHERE createDate BETWEEN '2004-01-01' AND '2004-06-30'
  ) AS tabel_b
WHERE customerID IN (
	SELECT DISTINCT customerID
	FROM orders_1
	UNION
	SELECT DISTINCT customerID
	FROM orders_2
  )
GROUP BY quarter;

-- Category produk apa saja yang paling banyak di-order oleh customers di Quarter-2?
SELECT 
  SUBSTRING(productCode,1,3) AS categoryid, 
  COUNT(DISTINCT orderNumber) AS total_order, 
  SUM(quantity) AS total_penjualan 
FROM orders_2
WHERE status = "Shipped"
GROUP BY categoryid
ORDER BY total_order DESC

-- Seberapa banyak customers yang tetap aktif bertransaksi setelah transaksi pertamanya?
SELECT 
  1 AS quarter, 
  (COUNT(DISTINCT customerID)/ (SELECT COUNT(DISTINCT customerID) FROM orders_1) *100) AS q2
FROM orders_1
WHERE customerID IN(
  SELECT DISTINCT customerID
  FROM orders_2
  WHERE status = "Shipped"	
)
