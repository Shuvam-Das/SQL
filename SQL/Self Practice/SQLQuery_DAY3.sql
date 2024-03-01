CREATE TABLE STUDENT
(
STD_ID INT,
SNAME VARCHAR(50),
SMAILID VARCHAR(50),
COURSE_ID INT
)

CREATE TABLE COURSE
(
COURSE_ID INT,
COURSE_NAME VARCHAR(100),
COURSE_FEE DECIMAL(7,2)
)

SELECT*FROM STUDENT
SELECT*FROM COURSE
--------------------------------------------------------------
INSERT INTO STUDENT VALUES(101,'ADMS','admas@gmail.com',10)
INSERT INTO STUDENT VALUES(102,'CHARLIE','charlie@gmail.com',20)
INSERT INTO STUDENT VALUES(103,'JAMES','james@hotmail.com',30)
--------------------------------------------------------------
INSERT INTO COURSE VALUES(10,'SQL SERVER',1500),
(20,'SAP',2000),(40,'PYTHON',4500),(55,'TABLEAU',55000)

--INNER JOIN--
SELECT *FROM STUDENT ---LEFT TABLE
INNER JOIN ---INNER JOIN(DEFAULT),RETURN RECORD THAT HAVE MATCHING VALUE
COURSE /*RIGHT TABLE*/
ON
STUDENT.COURSE_ID=COURSE.COURSE_ID -- COMMON COLUME
---------------------------------------------------------------
SELECT *FROM STUDENT AS STD ---LEFT TABLE
INNER JOIN ---INNER JOIN(DEFAULT),RETURN RECORD THAT HAVE MATCHING VALUE
COURSE AS CRE
ON
STD.COURSE_ID=CRE.COURSE_ID -- COMMON COLUME
---------------------------------------------------------------
------LEFT JOIN-----
---------------------------
SELECT *FROM STUDENT AS STD ---LEFT TABLE
LEFT JOIN ---INNER JOIN(DEFAULT),RETURN RECORD THAT HAVE MATCHING VALUE
COURSE AS CRE
ON
STD.COURSE_ID=CRE.COURSE_ID -- COMMON COLUME
------------------------------------------------------------------
---------RIGHT JOIN--------
-------------------------------------------------------------------
SELECT *FROM STUDENT AS STD ---LEFT TABLE
RIGHT JOIN ---INNER JOIN(DEFAULT),RETURN RECORD THAT HAVE MATCHING VALUE
COURSE AS CRE
ON
STD.COURSE_ID=CRE.COURSE_ID -- COMMON COLUME
-----------------------------------------------------------
------FULL OUTER JOIN-----
---------------------------
SELECT *FROM STUDENT AS STD ---LEFT TABLE
FULL OUTER JOIN ---INNER JOIN(DEFAULT),RETURN RECORD THAT HAVE MATCHING VALUE
COURSE AS CRE
ON
STD.COURSE_ID=CRE.COURSE_ID -- COMMON COLUME
-------------------------------------------------------------
--------CROSS JOIN------
-------------------------------------------------------------
SELECT*FROM STUDENT
CROSS JOIN
COURSE
-------------------------------------------------------------
SELECT*FROM STUDENT AS S
NATURAL JOIN
COURSE AS C
----------------------------
----SELF JOIN--
-----------------------------
SELECT S1.SNAME,S2.STD_ID FROM STUDENT S1 ,STUDENT S2
--WHERE S1.COURSE_ID <> S2.COURSE_ID
WHERE S1.COURSE_ID = S2.COURSE_ID
ORDER BY S1.SNAME DESC
---------------------------------------

