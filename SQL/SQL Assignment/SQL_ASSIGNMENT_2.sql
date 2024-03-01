-- Create   Database Name as Order_Stores_Data --
create database Order_Stores_Data
USE Order_Stores_Data

/*Create two Table names as Orders_Table and Stores_Table

Insert All records present here in the Orders_table and Stores_Table */

CREATE TABLE ORDERS_TABLE(
Order_Date DATE,
Region VARCHAR(50),
Rep VARCHAR(50),
Order_Item VARCHAR(100),
Units INT,
Unit_Cost MONEY,
Total_Price MONEY,
Order_Id INT PRIMARY KEY
)

SELECT * FROM ORDERS_TABLE

INSERT INTO ORDERS_TABLE VALUES
('2021-01-06','East','Aruna','Pencil',	95,1.99,189.05,1),
('2021-01-23','Central','Kivell','Eraser',50,19.99,999.50,2),
('2021-02-09','Central','Ganesh','',36,4.99,179.64,3),
('2021-02-26','Central','Payal','',27,19.99,539.73,4),
('2021-03-15','West','Sorvino','',56,2.99,167.44,5),
('2021-04-01','East','Hitesh','Pencil',60,4.99,299.4,6),
('2021-04-18','Central','Akshita','',75,1.99,149.25,7),
('2021-05-05','Central','Ruchika','Books',90,4.99,449.1,8),
('2021-05-22','West','Surbhi' ,'',32,1.99,63.68,9),
('2021-06-08','East','Jones','Suitcase',60,8.99,539.4,10)

CREATE TABLE STORES_TABLE
(
Store_Id INT PRIMARY KEY,
StoreType CHAR(5),
Assortment VARCHAR(100),
CompetitionDistance INT,
Month VARCHAR(20),
Year VARCHAR(4),
PromoInterval VARCHAR(20)
)

SELECT *FROM STORES_TABLE

INSERT INTO STORES_TABLE VALUES
(1,'c',39,1270,9,2008,'Jan'),
(2,'a',26,570,11,2007,'Feb'),
(3,'a',37,14130,12,2006,'Mar'),
(4,'c',47,620,9,2009,''),
(5,'a',24,29910,4,2015,'May'),
(6,'a',29,310,12,2013,'June'),
(7,'a',37,24000,4,2013,''),
(8,'a',24,7520,10,2014,'Aug'),
(9,'a',24,2030,8,2000,''),
(10,'a',16,3160,9,2009,'Oct')

----------------------------------------------------------------
-- Make Order_Id  Column as Primary Key--

ALTER TABLE STORES_TABLE
COLUMN STORE_ID INT PRIMARY KEY;

ALTER TABLE STORES_TABLE ADD CONSTRAINT PK_STORES_TABLE PRIMARY KEY (STORE_ID);
ALTER TABLE STORES_TABLE ADD CONSTRAINT PK_STORES_TABLE PRIMARY KEY (STORE_ID);

-- Add one Column Name  as Store_Names and insert the records given above in Stores table --

ALTER TABLE STORES_TABLE
ADD STORE_NAMES VARCHAR(50)

SELECT*FROM STORES_TABLE

UPDATE STORES_TABLE
SET STORE_NAMES=
CASE
WHEN Store_Id=1 THEN 'Car'
WHEN Store_Id=2 THEN 'Bikes'
WHEN Store_Id=3 THEN 'Hardware'
WHEN Store_Id=4 THEN 'Electrics'
WHEN Store_Id=5 THEN 'Fibers'
WHEN Store_Id=6 THEN 'Elastics'
WHEN Store_Id=7 THEN 'Books'
WHEN Store_Id=8 THEN 'Shoes'
WHEN Store_Id=9 THEN 'Clothes'
WHEN Store_Id=10 THEN 'Scraps'
END

UPDATE STORES_TABLE SET STORE_NAMES = 'CAR' WHERE STORE_NAMES = 'CITY';

SELECT*FROM STORES_TABLE

-- Make Stored_Id as a Foreign Key with reference too Orders_Table --

ALTER TABLE ORDERS_TABLE
ADD CONSTRAINT FK_ORDER_STORE_1
FOREIGN KEY (ORDER_ID) REFERENCES STORES_TABLE(STORE_ID)

-- Update the missing  records in the Order_item Column in Order_table missing records are given in this sheet --
UPDATE STORES_TABLE
SET PromoInterval=
CASE
WHEN Store_Id=1 THEN 'JAN'
WHEN Store_Id=2 THEN 'FEB'
WHEN Store_Id=3 THEN 'MAR'
WHEN Store_Id=4 THEN 'APR'
WHEN Store_Id=5 THEN 'MAY'
WHEN Store_Id=6 THEN 'JUNE'
WHEN Store_Id=7 THEN 'JULY'
WHEN Store_Id=8 THEN 'AUG'
WHEN Store_Id=9 THEN 'SEPT'
WHEN Store_Id=10 THEN 'OCT'
END

SELECT*FROM STORES_TABLE
SELECT*FROM ORDERS_TABLE

UPDATE ORDERS_TABLE
SET ORDER_ITEM = 'Compass'
WHERE Order_Id = 3

UPDATE ORDERS_TABLE SET ORDER_ITEM = CASE Order_Id
WHEN 3 THEN 'Compass'
WHEN 4 THEN 'Torch'
WHEN 5 THEN 'Phone'
WHEN 7 THEN 'Laptop'
WHEN 9 THEN 'Box'
END
WHERE Order_Id IN (3,4,5,7,9);

UPDATE ORDERS_TABLE SET ORDER_ITEM = CASE Order_Id
WHEN 1 THEN 'Pencil'
WHEN 2 THEN 'Eraser'
WHEN 6 THEN 'Pencil'
WHEN 8 THEN 'Books'
WHEN 10 THEN 'Suitcase'
END
WHERE Order_Id IN (1,2,6,8,10);

-- Rename the column name  of Order_Item to Item_name  and Rep Column as Customers_name in Orders_Table. --
EXEC sp_rename 'Orders_Table.Order_Item', 'Item_Name', 'COLUMN';
EXEC sp_rename 'Orders_Table.Rep', 'Customers_Name', 'COLUMN';

-- Sort the Unit Cost of Orders_table in Descding order and Total column in Ascending order--

SELECT *FROM Orders_table
ORDER BY Unit_Cost DESC

SELECT *FROM Orders_table
ORDER BY TOTAL_PRICE ASC

-- Convert Customers_name to Cus_Name  and find how many  Cus_Name in each region --

SELECT Region, COUNT(CUSTOMERS_NAME) AS CUS_NAME FROM ORDERS_TABLE GROUP BY region;

-- Find the sum of Total_Price Column and Unit Cost  in Orders_Table --

SELECT SUM(TOTAL_PRICE) AS SUM_OF_TOTAL_PRICE , SUM(UNIT_COST) AS TOTAL_UNIT_COST FROM Orders_table;

-- Show me OrderDate  , Unit Cost  , StoreType and Year in One table and names that table as Order_Stores_Table --

CREATE VIEW Order_Stores_Table1 
AS
SELECT *FROM 
Order_Stores_Data.[dbo].ORDERS_TABLE AS T1
INNER JOIN Order_Stores_Data.[dbo].STORES_TABLE AS T2
ON T1.Order_Id=T2.Store_Id

SELECT * FROM Order_Stores_Table1 

CREATE VIEW Order_Stores_Table2 
AS 
SELECT Order_Stores_Table1.Order_Id,Order_Stores_Table1.Unit_Cost,Order_Stores_Table1.StoreType,Order_Stores_Table1.Year
FROM Order_Stores_Table1 

SELECT * FROM Order_Stores_Table2

-- Give me Order_Item  and Region whose Order_Id is 4 , 5, 6 ,9 --

CREATE VIEW Order_Item_Region
AS
SELECT Order_Stores_Table1.Item_Name, Order_Stores_Table1.Region , Order_Stores_Table1.Order_Id
FROM Order_Stores_Table1
WHERE ORDER_ID in (4,5,6,9)

SELECT *FROM Order_Item_Region

-- Show me year  whose ComptetitionDistance is 29910  , 310 , 3160 --

CREATE VIEW year_ComptetitionDistance
AS
SELECT Order_Stores_Table1.Year, Order_Stores_Table1.CompetitionDistance
FROM Order_Stores_Table1
WHERE CompetitionDistance in ( 29910 , 310 , 3160)

SELECT *FROM year_ComptetitionDistance

-- Give me that Item_name whose  Total_Price is greater than 200 and less than 400 --

CREATE VIEW year_ITEM_NAME_TOTAL_PRICE
AS
SELECT Order_Stores_Table1 .Item_Name, Order_Stores_Table1.Total_Price
FROM Order_Stores_Table1
WHERE CompetitionDistance in ( 29910 , 310 , 3160)

SELECT *FROM year_ITEM_NAME_TOTAL_PRICE

-- Rename the CompetitionDistance as CD and find the total CD in Stores_Table. --
EXEC sp_rename 'Order_Stores_Table1.COMPETITIONDISTANCE', 'CD', 'COLUMN';
SELECT * FROM Order_Stores_Table1 

-- What is the Total Count of Stores_Type and CD columns --

SELECT * FROM Order_Stores_Table1 

SELECT COUNT (StoreType) AS TOTAL_COUNT_STORES_TYPE , SUM (CD) AS TOTAL_COUNT_CD
FROM Order_Stores_Table1 ;

-- Apply the Cross Join in  Orders_Table and Stores_Table. --

CREATE VIEW CROSS_JOINING_ORDER_TABLE_STORE_TABLE
AS
SELECT * FROM 
Order_Stores_Data.[dbo].ORDERS_TABLE AS T1
CROSS JOIN 
Order_Stores_Data.[dbo].Stores_Table AS T2;

SELECT *FROM CROSS_JOINING_ORDER_TABLE_STORE_TABLE

-- DROP both the databases --

DROP BRANDS
DROP PRODUCTS
