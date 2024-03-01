CREATE TABLE EmployeeDetailTable
(
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(20),
LastName VARCHAR(20),
Salary MONEY,
JoiningDate DATE ,
Department VARCHAR(25),
Gender VARCHAR(10)
)

-- 1. Write a query to get all employee detail from "EmployeeDetail" table --

INSERT INTO EmployeeDetailTable VALUES
(1,'Vikas','Ahlawat',600000,'2/12/2013 11:16','IT','Male'),
(2,'nikita','Jain',530000,'2/14/2013 11:16','HR','FeMale'),
(3,'Ashish','Kumar',1000000,'2/14/2013 11:16','IT','Male'),
(4,'Nikhil','Sharma',480000,'2/15/2013 11:16','HR','Male'),
(5,'anish','Kadian',500000,'2/16/2013 11:16','Paroll','Male')

SELECT *FROM EmployeeDetailTable

-- 2) Write a query to get only "FirstName" column from "EmployeeDetail" table --

SELECT FirstName FROM EmployeeDetailTable 

-- 3) Write a query to get FirstName in upper case as "First Name". --

SELECT UPPER(FirstName) 
AS First_Name FROM EmployeeDetailTable

-- 4) Write a query to get FirstName in upper case as "Last Name". --

SELECT UPPER(LastName) 
AS Last_Name FROM EmployeeDetailTable

-- 5) Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name) --

SELECT UPPER(CONCAT(FirstName,' ',LastName))
AS Name FROM EmployeeDetailTable

-- 6) Select employee detail whose name is "Vikas --

SELECT*FROM EmployeeDetailTable
WHERE FirstName = 'Vikas'

-- 7) Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'. --

SELECT*FROM EmployeeDetailTable
WHERE FirstName like  'a%'

-- 8) Get all employee detail from EmployeeDetail table whose "LastName" start with latter 'a'.

SELECT*FROM EmployeeDetailTable
WHERE LastName like  'a%'

-- 9) Get all employee details from EmployeeDetail table whose "FirstName" end with 'h' --

SELECT*FROM EmployeeDetailTable
WHERE FirstName like  '%h'

-- 10. Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p' --

SELECT*FROM EmployeeDetailTable
WHERE FirstName LIKE 'a%'
OR
FirstName LIKE 'P%';

