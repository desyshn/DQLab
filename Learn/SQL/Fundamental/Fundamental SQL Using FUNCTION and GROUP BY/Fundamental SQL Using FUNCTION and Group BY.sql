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
