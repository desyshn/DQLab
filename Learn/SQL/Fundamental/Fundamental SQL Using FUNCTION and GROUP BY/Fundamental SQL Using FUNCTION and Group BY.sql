USE dqlab;

-- Fungsi Skalar Matematika - ABS()
SELECT 
  studentid, 
  firstname, 
  lastname, 
  semester1, 
  semester2, 
  ABS(markgrowth) as MarkGrowth 
FROM
  students;				
  
-- Fungsi Skalar Matematika - CEILING()
SELECT 
  studentid, 
  firstname, 
  lastname, 
  CEILING(semester1) as Semester1, 
  CEILING(semester2) as Semester2, 
  MarkGrowth 
FROM students;

-- Fungsi Skalar Matematika - FLOOR()
SELECT 
  studentid, 
  firstname, 
  lastname, 
  FLOOR(semester1) as Semester1, 
  FLOOR(semester2) as Semester2,
  MarkGrowth 
FROM students;

-- Fungsi Skalar Matematika - ROUND()
SELECT 
  studentID, 
  firstname, 
  lastname, 
  ROUND(semester1,1) as Semester1, 
  ROUND(semester2,0) as Semester2, 
  MarkGrowth 
FROM students;

-- Fungsi Skalar Matematika - SQRT( )
SELECT 
  StudentID, 
  firstname, 
  lastname, 
  SQRT(semester1) as Semester1,
  Semester2, 
  MarkGrowth
FROM students;

-- Tugas Praktek
SELECT 
  StudentID, 
  FirstName, 
  LastName, 
  MOD(Semester1,2) as Semester1, 
  Semester2, 
  EXP(MarkGrowth) 
FROM Students;	

-- Fungsi Text - CONCAT( )
SELECT 
  studentid, 
  CONCAT(firstname, lastname) as Name, 
  Semester1, 
  Semester2, 
  markGrowth 
FROM students;

-- Fungsi Text - SUBSTRING_INDEX( )
SELECT 
  studentid, 
  SUBSTRING_INDEX(email,'@',1) as Name 
FROM students;

-- Fungsi Text - SUBSTR( )
SELECT 
  studentid, 
  SUBSTR(firstname,2,3) as Initial 
FROM students;	

-- Fungsi Text - LENGTH( )
SELECT 
  studentid, 
  firstname, 
  LENGTH(firstname) as Total_Char 
FROM students;		

-- Fungsi Text - REPLACE( )
SELECT 
  studentid, 
  email, 
  REPLACE(email,'yahoo', 'gmail') as New_Email 
FROM students;

-- Tugas Praktek (Fungsi Teks di SQL)
SELECT 
  studentid, 
  UPPER(firstname) as FirstName, 
  LOWER(lastname) as Lastname 
FROM students;

-- Fungsi Aggregate - SUM()
SELECT 
  SUM(semester1) AS Total_1, 
  SUM(Semester2) as Total_2 
FROM Students;	

-- Fungsi Aggregate - COUNT()
SELECT
  COUNT(firstname) AS Total_student 
FROM students;	

-- Fungsi Aggregate - AVG( )
SELECT 
  AVG(semester1) AS AVG_1, 
  AVG(semester2) AS AVG_2 
FROM students;	

-- Tugas Praktek 1 - Fungsi Aggregate dan Group By
SELECT 
  MIN(semester1) AS Min1, 
  MAX(semester1) AS Max1, 
  MIN(semester2) AS Min2, 
  MAX(Semester2) AS Max2 
FROM Students;

-- Group by Single Column
SELECT 
  province, 
  COUNT(DISTINCT order_id) AS total_order, 
  SUM(item_price) AS total_price 
FROM sales_retail_2019 
GROUP BY province;

-- Group by Multiple Column
SELECT 
  province, 
  brand, 
  COUNT(DISTINCT order_id) AS total_order, 
  SUM(item_price) AS total_price 
FROM sales_retail_2019 
GROUP BY province, brand;

-- Fungsi Aggregate dengan Grouping
SELECT 
  province, 
  COUNT(DISTINCR order_id) AS total_unique_order, 
  SUM(item_price) AS revenue 
FROM sales_retail_2019 
GROUP BY province;	

-- Tugas Praktek 2 - Fungsi Aggregate dan Group By
SELECT 
  MONTH(order_date) AS order_month, 
  SUM(item_price) AS total_price, 
CASE  
    WHEN 
      SUM(item_price) >= 30000000000 
    THEN 'Target Achieved'
    WHEN 
      SUM(item_price) <= 25000000000 
    THEN 'Less Performed'
    ELSE 'Follow Up'
END AS remark
FROM 
  sales_retail_2019
GROUP BY 
  MONTH(order_date);

-- Proyek Pekerjaan - Analisis Penjualan
-- 1. Total jumlah seluruh penjualan (total/revenue).
SELECT 
  SUM(total) AS total 
FROM 
  tr_penjualan;
-- 2. Total quantity seluruh produk yang terjual.
SELECT 
  SUM(qty) AS qty 
FROM 
  tr_penjualan;
-- 3. Total quantity dan total revenue untuk setiap kode produk.
SELECT 
  kode_produk, 
  SUM(qty) AS qty, 
  SUM(total) AS total 
FROM 
  tr_penjualan
GROUP BY 
  kode_produk;
-- 4. Rata - Rata total belanja per kode pelanggan.
SELECT 
 kode_pelanggan, 
 AVG(total) AS avg_total 
FROM 
 tr_penjualan
GROUP BY 
 kode_pelanggan;
/* 5. Selain itu,  jangan lupa untuk menambahkan kolom baru 
dengan nama ‘kategori’ yang mengkategorikan total/revenue ke dalam 
3 kategori: High: > 300K; Medium: 100K - 300K; Low: <100K. */
SELECT 
  kode_transaksi,
  kode_pelanggan,
  no_urut,
  kode_produk, 
  nama_produk, 
  qty, 
  total,
  CASE  
    WHEN total > 300000 THEN 'High'
    WHEN total < 100000 THEN 'Low'   
    ELSE 'Medium'  
  END AS kategori 
FROM 
 tr_penjualan;
