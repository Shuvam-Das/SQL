CREATE DATA BASE 
CREATE TABLE StudentTable
(
STUDENTID INT PRIMARY KEY,
NAME VARCHAR (20),
SURNAME VARCHAR(20),
BIRTHDATE DATE,
GENDER CHAR (10),
CLASS VARCHAR (10),
POINT DECIMAL(2,2)
)

ALTER TABLE STUDENTTABLE
ALTER COLUMN CLASS VARCHAR(10)

ALTER TABLE STUDENTTABLE
ALTER COLUMN POINT VARCHAR(10)

INSERT INTO StudentTable VALUES 
(1001 , 'SHUVAM' , 'DAS' , '1993-12-12' , 'MALE' , 'SEVEN' , '9.20') ,
(1002 , 'RITAM' , 'DAS' , '1997-11-23' , 'MALE' , 'FOUR','9.10'),
(1003 , 'ROHIT' , 'NAG' , '1995-10-20' , 'FEMALE' , 'TWO','8.70'),
(1004 , 'SHARIQ' , 'RAHAMAN' , '1992-09-15' , 'MALE' , 'SEVEN','5.60'),
(1005 , 'KRITI' , 'SANAN' , '1994-07-14' , 'FEMALE','EIGHT','8.22'),
(1006 , 'SUMANA' , 'GHOSH' , '1991-03-25' , 'FEMALE','THREE','9.25'),
(1007 , 'UPASANA' , 'SHARMA' , '1994-05-24' , 'FEMALE','TEN','9.27'),
(1008 , 'ONKAR' , 'BANERJEE' , '1990-06-17' , 'MALE','SIX','8.18'),
(1009 , 'RIMI' , 'NAYAK' , '1993-04-18' , 'FEMALE','SEVEN','9.21'),
(1010 , 'SNIGDHA' , 'ROY' , '1993-02-22' , 'FEMALE','FIVE','8.30'), 
(1011,'Shubham','Dhureja',   '1994-02-12','Male',   'SIX','8.7'),
(1012,'Akshat', 'Agrawal',   '1995-05-17','Male',   'SEVEN',6.5),
(1013,'Pooja',  'Khatri',    '1996-07-05','Female', 'EIGHT',6.9),
(1014,'lokesh', 'Sundrani',  '1993-03-13','Male',   'SIX',8.5),
(1015,'Ashish', 'Gupta',     '1993-09-16','Male',   'FIVE',9.3),
(1016,'Rohit',  'Manesar',   '1994-11-22','Male',   'SIX',8.2),
(1017,'Nimisha','Bhardwaj',  '1993-03-16','Female', 'THREE',5.8),
(1018,'Dilip',  'Ruthia',    '1994-06-06','Male',   'SEVEN',9.7),
(1019,'Akanksha','Diwan',    '1997-08-19','Female', 'Eight',6.3),
(1020,'Vijay',  'Salgaonkar','1996-01-25','Male',   'Six',7.2)

SELECT *FROM StudentTable


-- Example 2: List the name surname and class of the student in the student table --

SELECT NAME, SURNAME , CLASS FROM StudentTable

-- Example 3: List the gender Female (F) records in the student table --

SELECT * FROM StudentTable
WHERE GENDER = 'FEMALE'

-- Example 4 : List the names of each class in the way of being seen once in the student table --

SELECT DISTINCT CLASS FROM StudentTable

-- Example 5: List the students with Female gender and the class 10Math in the student table --

SELECT * FROM StudentTable
WHERE GENDER = 'FEMALE'
AND CLASS = 'TEN'

-- Example 6: List the names, surnames and classes of the students in the class 10Math or 10Sci in the student table -

SELECT NAME,SURNAME,CLASS FROM StudentTable
WHERE  CLASS = 'TEN'

-- Example 7: List the students name surname and school number in the student table --

SELECT NAME,SURNAME,STUDENTID FROM StudentTable

-- Example 8: List the students name and surname by combining them as name surname in the student table --

SELECT CONCAT (NAME ,' ' , SURNAME) AS FULL_NAME FROM StudentTable

-- Example 9: List the students with the names starting with “A” letter in the student table --

SELECT NAME FROM StudentTable
WHERE NAME LIKE 'A%'

-- Example 10: List the book names and pages count with number of pages between 50 and 200 in the book table --

CREATE TABLE BOOKS
(
BOOKID INT PRIMARY KEY,
NAME VARCHAR (30),
PAGECOUNT INT,
POINT VARCHAR(10),
AUTHOR_ID INT,
TYPE_ID INT ,
AUTHOR_NAME VARCHAR(30),
AUTHOR_SURNAME VARCHAR(30),
TYPE_NAME VARCHAR(30)
)

DROP TABLE BOOKS
INSERT INTO BOOKS VALUES 

(01 , 'SHUVAM DAS' , 100 , '9.20' , 101 , 1001,'SANIYA','SEN','PHY') ,
(02 , 'RITAM DAS' , 100 , '9.10' , 105 , 1002,'SAKSHI','JHAT','CHEM'),
(03 , 'ROHIT NAG' , 110 ,'8.70' , 107, 1003,'SAYONI','KANNAR','MATH'),
(04 , 'SHARIQ RAHAMAN' , 111 , '5.60', 108 ,1004,'RINA','HALDER','ENG'),
(05 , 'KRITI SANAN' , 112 , '8.22' , 109, 1005,'SAHEB','SERNAL','HIS'),
(06 , 'SUMANA GHOSH' , 113 , '9.25' , 110 ,1006,'JOTSNA','PATEL','GEO'),
(07 , 'UPASANA SHARMA' , 114 , '9.27' ,111,1007,'PALLABI','BERA','BIO'),
(08 , 'ONKAR BANERJEE', 115 , '8.18' ,112,1008,'SAIKAT','PATRA','ENG'),
(09 , 'RIMI NAYAK' , 116 , '9.21' ,113,1009,'JON','LEON','ENG'),
(10 , 'SNIGDHA ROY' , 117 , '8.30' ,114,1010,'BONY','SHAU','HIN'), 
(11, 'Shubham Dhureja' , 118 , '8.7' ,115,1011,'BAPI','SEN','BENG'),
(12, 'Akshat Agrawal', 119 , '6.5' ,116,1012,'HARSA','SING','MATH'),
(13, 'Pooja Khatri' ,   120 , '6.9' ,117,1013,'BARSA','PATEL','BIO'),
(14, 'lokesh Sundrani' , 121 , '8.5' ,118,1014,'SRIJOYE','KUMER','CHEM'),
(15, 'Ashish Gupta' ,  122 , '9.3' ,119,1015,'GHEYN','TWARY','ENG'),
(16, 'Rohit Manesar' , 123 , '8.2' ,120,1016,'ANISH','LAHA','ENG'),
(17, 'Nimisha Bhardwaj' , 124 , '5.8' ,121,1017,'DADASHAEB','ALAGU','PHY'),
(18, 'Dilip Ruthia' ,   125 , '9.7' ,122,1018,'VINOD','KUMAR','MATH'),
(19, 'Akanksha Diwan' ,126 , '6.3' ,123,1019,'PRIYANKA','PAUL','MATH'),
(20, 'Vijay Salgaonkar' ,127 , '7.2' ,124,1020,'KOTHA','ROY','ENG')

SELECT *FROM BOOKS

-- Example 10: List the book ID and pages count with number of pages between 50 and 200 in the book table --

SELECT * FROM BOOKS
WHERE PAGECOUNT BETWEEN 50 AND 200

-- Example 11: List the students with names Emma Sophia and Robert in the student table--

SELECT *FROM StudentTable
WHERE NAME = 'Emma' or  NAME= 'Robert'

-- Example 12: List the students with names starting with A D and K in the student table --

SELECT *FROM StudentTable
WHERE NAME LIKE 'A%' OR NAME LIKE 'D%' OR NAME LIKE 'K%'

-- Example 13: List the names surnames classes and genders of males in 9Math or females in 9His in the student table --

SELECT *FROM BOOKS
SELECT * FROM StudentTable

SELECT S.NAME, S.SURNAME, S.CLASS,S.GENDER FROM StudentTable S
full outer JOIN BOOKS B ON S.STUDENTID = B.TYPE_ID
WHERE   S.GENDER in ('MALE','female') and  B.Type_name = 'math'

-- Example 14: List the males whose classes are 10Math or 10Bio --

SELECT S.*,B.*
FROM StudentTable S
full outer JOIN BOOKS B ON S.STUDENTID = B.TYPE_ID
WHERE B.Type_name IN('math','BIO') 
AND
S.GENDER = 'MALE'

-- Example 15: List the students with birth year 1995 in the student table --

SELECT *FROM StudentTable
WHERE YEAR (BIRTHDATE) = 1996
