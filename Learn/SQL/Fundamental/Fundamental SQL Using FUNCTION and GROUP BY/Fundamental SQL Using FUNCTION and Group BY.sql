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
