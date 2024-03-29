SELECT *FROM [dbo].[EMPLOYEE]

CREATE TABLE EMP
(
ID INT PRIMARY KEY,
NAMES VARCHAR(50),
SALARY MONEY,
DEPT_ID INT
)

CREATE TABLE DEPT
(
DEPT_ID INT,
DEPT_NAME VARCHAR(40)
)
--------------------------
SELECT *FROM EMP
SELECT *FROM DEPT

SELECT ID,NAMES,SALARY FROM EMP
JOIN
DEPT
ON EMP.DEPT_ID = DEPT.DEPT_ID
------------
SELECT ID,NAMES,SALARY,D.DEPT_NAME FROM EMP AS E
JOIN
DEPT AS D
ON E.DEPT_ID = D.DEPT_ID
-----------------------
CREATE VIEW VW_EMP_DEP
AS
SELECT ID,NAMES,SALARY,D.DEPT_NAME FROM EMP AS E
JOIN
DEPT AS D
ON E.DEPT_ID = D.DEPT_ID
----------------------------
CREATE VIEW VW_EMP ---2
AS
SELECT*FROM EMP
---------------------------
CREATE VIEW VW_DEP_DETAILS ---3
AS
SELECT*FROM DEPT
-------------------------------
CREATE VIEW EMP_VIEW
AS
SELECT *FROM EMP
----------------------------
CREATE VIEW DEPT_DETAILS
AS
SELECT *FROM DEPT
------------------------
SP_HELPTEXT VW_DEP_DETAILS
----------------------------
SELECT*FROM EMP
SELECT*FROM DEPT

ALTER TABLE EMP
ADD DEPT_NAME VARCHAR(100)
--------------------------------
CREATE VIEW VW_NON_CONFIDENTIAL_INFORMATION
AS
SELECT ID,NAMES,SALARY,D.DEPT_NAME FROM EMP AS E
JOIN
DEPT AS D
ON E.DEPT_ID = D.DEPT_ID
WHERE   D.DEPT_NAME ='HR'
-------------------------------
CREATE VIEW VW_NON_CONFIDENTIAL_INFORMATION1
AS
SELECT ID,NAMES,SALARY,D.DEPT_NAME FROM EMP AS E
JOIN
DEPT AS D
ON E.DEPT_ID = D.DEPT_ID
WHERE   D.DEPT_NAME IN ('HR','ADMIN')
----------------------------------------
SELECT *FROM VW_NON_CONFIDENTIAL_INFORMATION
-----------------------------------------
CREATE VIEW EMPLOYEE_VIEW
AS
SELECT ID,NAMES FROM EMP
----------------------------------
CREATE VIEW VW_CONFIDENTIAL_DATA
AS
SELECT NAMES,SALARY FROM EMP
WHERE SALARY>3500

SELECT*FROM VW_CONFIDENTIAL_DATA

------------------------------------
SELECT *FROM EMP
SELECT *FROM DEPT

SELECT D.DEPT_NAME ,COUNT(ID) AS TOTAL_EMPLOYEE FROM EMP AS E
JOIN
DEPT AS D
ON E.DEPT_ID = D.DEPT_ID
GROUP BY D.DEPT_NAME
------------------------------------------------------------------------
CREATE VIEW VW_AGGREGATED_DEPT_NAME
AS
SELECT D.DEPT_NAME ,COUNT(ID) AS TOTAL_EMPLOYEE FROM EMP AS E
JOIN
DEPT AS D
ON E.DEPT_ID = D.DEPT_ID
GROUP BY D.DEPT_NAME

SELECT *FROM VW_AGGREGATED_DEPT_NAME

--------------------------------------------
UPDATE VW_EMP_DEP 
SET NAMES ='CHARLIE'
WHERE ID = 1

SELECT *FROM VW_EMP_DEP
SELECT *FROM EMP
--------------------------------
INSERT INTO EMP VALUES (6,'RUCHIKA',10000,4)

DELETE FROM VW_EMP_DEP --(JOINS (EMP)--JOIN TABLE DOES NOT ALLOW TO DELETE )
WHERE ID =6

