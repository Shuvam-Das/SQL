CREATE TABLE EmployeeDetails(
EmpId INT PRIMARY KEY,
FullName VARCHAR(50),
ManagerId INT,
DateOfJoining DATE,
City CHAR (30)
)

INSERT INTO EmployeeDetails VALUES
(121, 'John Snow' , 321 , '2019-01-31' ,'Toronto'),
(321, 'Walter White' , 986 ,' 2020-01-30' ,'California'),
(421, 'Kuldeep Rana' , 876 ,' 2021-11-27' ,'New Delhi')


CREATE TABLE EmployeeSalary(
EmpId INT PRIMARY KEY,
Project VARCHAR(5),
Salary MONEY,
Variable INT
)

INSERT INTO EmployeeSalary VALUES
(121, 'P1' , 8000 , 500),
(321, 'P2' , 10000 ,1000),
(421, 'P1' , 12000 ,0)

