use COACHX_LIVE

CREATE TABLE EMP
(
ID INT PRIMARY KEY,

NAMES VARCHAR (255),

SALARY MONEY,

DEPT_ID INT
)

CREATE TABLE DEPT
(
DEPT_ID INT,

DEPT_NAME VARCHAR (255)
)

-------------------WE ENTERED DATA DIRECTLY------------------
SELECT * FROM EMP

SELECT * FROM DEPT

-------------------------------------------------------------

SELECT ID, NAMES,SALARY, DEPT_NAME FROM EMP JOIN DEPT ON EMP.DEPT_ID = DEPT.DEPT_ID

-----------------CREATE----------------------

CREATE VIEW VIEW_JOIN_DEPT_EMPT /*VIEW 1*/

AS

SELECT ID, NAMES,SALARY, DEPT_NAME FROM EMP JOIN DEPT ON EMP.DEPT_ID = DEPT.DEPT_ID

---------------------------------------------

CREATE VIEW VIEWW_EMP /*VIEW 2*/

AS

SELECT * FROM EMP
--------------------------------------------
CREATE VIEW VIEW_DEPT

AS

SELECT * FROM DEPT
-------------------
sp_helpnext vw_Emp_Dep ---3
--------------------
SELECT*FROM EMP
SELECT*FROM DEPT
CREATE VIEW VM_EMP_DEP
ALTER TABLE EMP
ADD DEPT_NAME VARCHAR(100)
WHERE 