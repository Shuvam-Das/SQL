USE COACHX_LIVE
SELECT *FROM [DBO].[EMPLOYEE]

CREATE TABLE EMP_123
(
NAME CHAR(100),
GENDER CHAR(5),
SALARY MONEY
)

ALTER TABLE EMP_123
ALTER COLUMN GENDER CHAR(7)

SELECT *FROM EMP_123

SELECT NAME,SALARY,GENDER,
COUNT (GENDER) OVER (PARTITION BY GENDER ) AS GENDER_COUNT,
AVG(SALARY) OVER (PARTITION BY GENDER) AS AVG_SAL,
MIN(SALARY) OVER (PARTITION BY GENDER) AS MIN_SAL,
MAX(SALARY) OVER (PARTITION BY GENDER) AS MAX_SAL
FROM EMP_123

SELECT NAME,SALARY,GENDER,COUNT(*) AS GENDER_TOTAL_NO,AVG(SALARY),MIN(SALARY),MAX(SALARY)
FROM EMP_123
GROUP BY GENDER,NAME,SALARY

--------------------------------------------------------------
SELECT *FROM EMP_123
---
SELECT NAME, GENDER,SALARY, 
LEAD(SALARY) OVER (ORDER BY SALARY) AS LEAD
FROM EMP_123

SELECT NAME, GENDER,SALARY, 
LEAD(SALARY,2) OVER (ORDER BY SALARY) AS LEAD
FROM EMP_123

SELECT NAME, GENDER,SALARY, 
LEAD(SALARY,2,-1) OVER (ORDER BY SALARY) AS LEAD
FROM EMP_123
-----------------------------------

SELECT NAME, GENDER,SALARY, 
LEAD(SALARY,2,10) OVER (ORDER BY SALARY) AS LEAD,
LEAD(SALARY,2,-1) OVER (ORDER BY SALARY) AS LAG
FROM EMP_123
------------------------------------
SELECT NAME, GENDER,SALARY, 
LEAD(SALARY,2,10) OVER (PARTITION BY GENDER ORDER BY SALARY) AS LEAD,
LEAD(SALARY,1,-1) OVER (PARTITION BY GENDER ORDER BY SALARY) AS LAG
FROM EMP_123
-----------------
