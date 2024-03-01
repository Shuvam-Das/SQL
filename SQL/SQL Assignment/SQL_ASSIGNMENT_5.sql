/*Task 1:-1.Create University Database give any University name you want*/
CREATE DATABASE NSEC

--2. Under this University Create four tables and each table should have following three Column named as:-
-- Create College_Table--
CREATE TABLE College_Table 
(
College_ID INT PRIMARY KEY,
College_Name VARCHAR(50),
College_Area VARCHAR(50)
);

-- Create Department_Table --
CREATE TABLE Department_Table 
(
Dept_ID INT PRIMARY KEY,
Dept_Name VARCHAR(50),
Dept_Facility VARCHAR(50)
);

-- Create Professor_Table --
CREATE TABLE Professor_Table
(
Professor_ID INT PRIMARY KEY,
Professor_Name VARCHAR(50),
Professor_Subject VARCHAR(50)
);
-- Create Student_Table
CREATE TABLE Student_Table
(
Student_ID INT PRIMARY KEY,
Student_Name VARCHAR(50),
Student_Stream VARCHAR(50)
);

--3. Apply foreign key on Department key from College_table--
ALTER TABLE College_Table
ADD CONSTRAINT FK_Dept_Id
FOREIGN KEY(College_Id)
REFERENCES Department_table (Dept_Id)

--4. Apply foreign Key on Student_Table from Professor_Table--
ALTER TABLE Professor_Table
ADD CONSTRAINT FK_Professor_Student_Id
FOREIGN KEY(Professor_Id)
REFERENCES Student_table (Student_Id)

--5. Insert atleast 10 Records in each table--
-- Insert  records into College_Table
INSERT INTO College_Table VALUES
(1, 'ABC College', 'North Campus'),
(2, 'DEF College', 'South Campus'),
(3, 'GHI College', 'East Campus'),
(4, 'JKL College', 'West Campus'),
(5, 'MNO College', 'Central Campus'),
(6, 'PQR College', 'Downtown Area'),
(7, 'STW College', 'Suburban Area'),
(8, 'VXY College', 'Urban Area'),
(9, 'ZAB College', 'Rural Area'),
(10,'CDE College', 'Hillside Area');

-- Insert records into Department_Table
INSERT INTO Department_Table VALUES
(1, 'Computer Science', 'Computer Labs'),
(2, 'Electrical Engineering', 'Engineering Labs'),
(3, 'Physics', 'Research Facilities'),
(4, 'Mathematics', 'Math Labs'),
(5, 'Chemistry', 'Chemistry Labs'),
(6, 'Biology', 'Biology Labs'),
(7, 'History', 'Library'),
(8, 'English', 'Language Lab'),
(9, 'Economics', 'Economic Research Center'),
(10, 'Psychology', 'Psychology Lab');

-- Insert records into Professor_Table
INSERT INTO Professor_Table VALUES
(1, 'Dr. Rajesh Sharma', 'Computer Science'),
(2, 'Prof. Meera Gupta', 'Electrical Engineering'),
(3, 'Dr. Anil Kumar', 'Physics'),
(4, 'Prof. Priya Singh', 'Mathematics'),
(5, 'Dr. Alok Verma', 'Chemistry'),
(6, 'Prof. Nisha Patel', 'Biology'),
(7, 'Dr. Ramesh Desai', 'History'),
(8, 'Prof. Sunita Reddy', 'English'),
(9, 'Dr. Sanjay Kapoor', 'Economics'),
(10, 'Prof. Divya Joshi', 'Psychology');

-- Insert records into Student_Table
INSERT INTO Student_Table VALUES
(1, 'Amit Patel', 'Computer Science'),
(2, 'Priya Sharma', 'Electrical Engineering'),
(3, 'Rahul Verma', 'Physics'),
(4, 'Sneha Singh', 'Mathematics'),
(5, 'Neha Reddy', 'Chemistry'),
(6, 'Ravi Kumar', 'Biology'),
(7, 'Pooja Gupta', 'History'),
(8, 'Rajesh Mehta', 'English'),
(9, 'Anita Kapoor', 'Economics'),
(10, 'Aarti Joshi', 'Psychology');

--Task 2:- 1. Give the information of College_ID and College_name from College_Table--
SELECT *FROM College_Table
SELECT College_ID,College_Name from College_Table

--2.	Show  Top 5 rows from Student table.--
SELECT TOP 5 * FROM Student_Table

--3.	What is the name of  professor  whose ID  is 5.--
SELECT Professor_Name FROM Professor_Table
WHERE Professor_ID ='5'

--4.	Convert the name of the Professor into Upper case.---
SELECT UPPER(Professor_Name) AS UPPER_PROFESSOR_NAME FROM Professor_Table

--5.	Show me the names of those students whose name is start with a.--
SELECT * FROM Student_Table
WHERE Student_Name like'A%'

--6.	Give the name of those colleges whose end with a.--
SELECT * FROM College_Table
WHERE College_Name like '%A'

--7.	 Add one Salary Column in Professor_Table--
ALTER TABLE Professor_Table
ADD  Salary MONEY

--8.	Add one Contact Column in Student_table--
ALTER TABLE Student_Table
ADD contact INT

--9.	Find the total Salary of Professor --
SELECT SUM(Salary) AS Total_Prof_Salary FROM Professor_Table

--10.	Change datatype of any one column of any one Table.--
ALTER TABLE professor_table
ALTER COLUMN salary INT

--Task 3:-1. Show first 5 records from Students table and Professor table Combine.--
SELECT TOP 5 Student_ID, Student_Name, Student_Stream
FROM Student_Table
UNION ALL
SELECT TOP 5 Professor_ID, Professor_Name, Professor_Subject
FROM Professor_Table;

--2.	Apply Inner join on all 4 tables together.---
SELECT * FROM College_Table c
INNER JOIN Department_Table d ON c.College_ID = d.Dept_ID
INNER JOIN Professor_Table p ON d.Dept_ID = p.Professor_ID
INNER JOIN Student_Table s ON p.Professor_ID = s.Student_ID;

--3. Show Some null values from Department table and Professor table.--
SELECT 'Department' AS Table_Name, Dept_ID, Dept_Name, Dept_Facility
FROM Department_Table
WHERE Dept_ID IS NULL OR Dept_Name IS NULL OR Dept_Facility IS NULL
UNION ALL
SELECT 'Professor_Table' AS Table_Name, Professor_ID, Professor_Name, Professor_Subject
FROM Professor_Table
WHERE Professor_ID IS NULL OR Professor_Name IS NULL OR Professor_Subject IS NULL;

--4. Create a View from College Table  and give those records whose college name starts with C.--
CREATE VIEW College_Starts_with_C AS
SELECT *FROM College_Table
WHERE College_Name like 'c%'

--5.Create Stored Procedure of Professor table whatever customer ID will
------be given by user it should show whole records of it.--
CREATE PROCEDURE getprofiddetails @inputprofessorid INT
AS
BEGIN
SELECT *FROM Professor_Table
WHERE Professor_ID=@inputprofessorid 
END

EXEC getprofiddetails @inputprofessorid = 5

--6. Rename the College_Table to College_Tables_Data .--
EXEC sp_rename 'college_table', 'college_table_data' 






