-- CREATE DATABASE--

CREATE DATABASE BRANDS;
CREATE DATABASE PRODUCTS;
-- TABLE CREATION --
USE BRANDS;
CREATE TABLE ITEMS_TABLE
(
Item_Id	INT PRIMARY KEY,
item_description VARCHAR(255),	
vendor_nos INT,	
vendor_name VARCHAR(255),	
bottle_size INT,
bottle_price MONEY
);

--INSERT VALUE UNDER TABLE --
INSERT INTO ITEMS_TABLE VALUES
(1,'Travis Hasse Apple Pie',305,'Mhw Ltd',750,$9.77),
(2,'D aristi Xtabentun',391,'Anchor Distilling(preiss Imports)',750,$14.12), 
(3,'Hiram Walker Peach Brandy',370,'Pernod Ricard Usa/austin Nichols',1000,$6.50), 
(4,'Oak Cross Whisky',305,'Mhw Ltd',750,$25.33), 
(5,'Uv Red(cherry) Vodka',380,'Phillips Beverage Company',200,$1.97), 
(6,'Heaven Hill Old Style White Label',259,'Heaven Hill Distilleries Inc.',750,$6.37), 
(7,'Hyde Herbal Liqueur',194,'Fire Tail Brands Llc',750,$5.06), 
(8,'Dupont Calvados Fine Reserve',403,'Robert Kacher Selections',750,$23.61);

-- TABLE CREATION --
USE PRODUCTS;
CREATE TABLE PRODUCT_TABLE 
(
Product_Id INT PRIMARY KEY,
Country VARCHAR(255),
Product VARCHAR(50),
Units_Sold DECIMAL(5,1) ,	
Manufacturing_Price INT,
Sale_Price MONEY,
Gross_Sales MONEY,		  
Sales MONEY, 	 
COGS MONEY,	 
Profit MONEY,	
Date DATE,
Month_Number INT,	 
Month_Name VARCHAR(15),
Year INT
);

/* INSERT INTO PRODUCT_TABLE VALUES
(1 , 'Canada' ,  'Carretera' , 1618.5 , 3.00 , 20.00 ,  32,370.00 ,  32,370.00 ,  16,185.00 ,  16,185.00 , ' 2014-01-01 ' , 1 , 'January' , 2014),
(2 , 'Germany' , 'Carretera' , 1321 ,   3.00 , 20.00 ,  26,420.00 ,  26,420.00 ,  13,210.00 ,  13,210.00 , ' 2014-01-01 ' , 1 , 'January' , 2015),
(3 , 'France' ,  'Carretera' , 2178 ,   3.00 , 15.00 ,  32,670.00 ,  32,670.00 ,  21,780.00 ,  10,890.00 , ' 2014-06-01 ' , 6 , 'June' ,    2016),
(4 , 'Germany' , 'Carretera' , 888 ,    3.00 , 15.00 ,  13,320.00 ,  13,320.00 ,  8,880.00 ,   4,440.00 ,  ' 2014-06-01 ' , 6 , 'June' ,    2017),
(5 , 'Mexico' ,  'Carretera' , 2470 ,   3.00 , 15.00 ,  37,050.00 ,  37,050.00 ,  24,700.00 ,  12,350.00 , ' 2014-06-01 ' , 6 , 'June' ,    2018),
(6 , 'Germany' , 'Carretera' , 1513 ,   3.00 , 350.00 , 5,29550.00 , 5,29550.00 ,  3,93380.00 ,1,36170.00 , ' 2014-12-01 ' , 12 , 'December' ,2019),
(7 , 'Germany' , 'Montana' ,   921 ,    5.00 , 15.00 ,  13,815.00 ,  13,815.00 ,  9,210.00 ,   4,605.00 ,  ' 2014-03-01 ' , 3 , 'March' ,    2020),
(8 , 'Canada' ,  'Montana' ,   2518 ,   5.00 , 12.00 ,  30,216.00 ,  30,216.00 ,  7,554.00 ,   22,662.00 , ' 2014-06-01 ' , 6 , 'June' ,     2021); */

-----DATA INSERTION-

INSERT INTO PRODUCT_TABLE VALUES
(1, 'Canada', 'Carretera', 1618.5, 3.00, 20.00, 32370.00, 32370.00, 16185.00, 16185.00, '2014-01-01', 1, 'January', 2014),
(2, 'Germany', 'Carretera', 1321, 3.00, 20.00, 26420.00, 26420.00, 13210.00, 13210.00, '2015-01-01', 1, 'January', 2015),
(3, 'France', 'Carretera', 2178, 3.00, 15.00, 32670.00, 32670.00, 21780.00, 10890.00, '2016-01-06', 6, 'June', 2016),
(4, 'Germany', 'Carretera', 888, 3.00, 15.00, 13320.00, 13320.00, 8880.00, 4440.00, '2017-01-06', 6, 'June', 2017),
(5, 'Mexico', 'Carretera', 2470, 3.00, 15.00, 37050.00, 37050.00, 24700.00, 12350.00, '2018-01-06', 6, 'June', 2018),
(6, 'Germany', 'Carretera', 1513, 3.00, 350.00, 529550.00, 529550.00, 393380.00, 136170.00, '2019-01-12', 12, 'December', 2019),
(7, 'Germany', 'Montana', 921, 5.00, 15.00, 13815.00, 13815.00, 9210.00, 4605.00, '2020-01-03', 3, 'March', 2020),
(8, 'Canada', 'Montana', 2518, 5.00, 12.00, 30216.00, 30216.00, 7554.00, 22662.00, '2021-01-06', 6, 'June', 2021);

--TO CHECK DATA IN THE TABLE --

USE PRODUCTS
SELECT *FROM PRODUCT_TABLE;

USE BRANDS
SELECT *FROM ITEMS_TABLE;

-- DATA DELETE -- 

DELETE FROM PRODUCT_TABLE WHERE Units_Sold = 1618.5;
DELETE FROM PRODUCT_TABLE WHERE Units_Sold = 888;
DELETE FROM PRODUCT_TABLE WHERE Units_Sold = 2470;

--DELETED DATA INSERTION AGAIN --

INSERT INTO PRODUCT_TABLE VALUES
(1, 'Canada', 'Carretera', 1618.5, 3.00, 20.00, 32370.00, 32370.00, 16185.00, 16185.00, '2014-01-01', 1, 'January', 2014),
(4, 'Germany', 'Carretera', 888, 3.00, 15.00, 13320.00, 13320.00, 8880.00, 4440.00, '2017-01-06', 6, 'June', 2017),
(5, 'Mexico', 'Carretera', 2470, 3.00, 15.00, 37050.00, 37050.00, 24700.00, 12350.00, '2018-01-06', 6, 'June', 2018)

--DROP TABLE --
USE PRODUCTS
DROP PRODUCT_TABLE ;

USE BRANDS
DROP ITEMS_TABLE;

--TOTAL OF SALES--
SELECT SUM(Sales)
FROM PRODUCT_TABLE 

--TOTAL OF GROSS SALES--
SELECT SUM(Gross_Sales)
FROM PRODUCT_TABLE
------------------------

SELECT *FROM PRODUCT_TABLE;

-- In which year we have got the highest sales --

SELECT Year,MAX(Sales) AS MAX_SALES
FROM PRODUCT_TABLE GROUP BY YEAR
ORDER BY MAX_SALES DESC

--Which Product having the sales of $ 37,050.00--
SELECT *FROM PRODUCT_TABLE;
SELECT Product FROM PRODUCT_TABLE WHERE SALES = 37050.00

-- Which Countries lies between profit of $ 4,605 to $  22 , 662.00 --
SELECT *FROM PRODUCT_TABLE;
SELECT Country FROM PRODUCT_Table WHERE Profit BETWEEN 4605 AND 22662.00
ORDER BY Profit DESC

-- Which Product Id having the sales of $ 24 , 700.00 --
SELECT *FROM PRODUCT_TABLE;
SELECT Product_Id , Sales FROM PRODUCT_TABLE WHERE SALES = 37050.00

-----------------------------------------------------------------------------------------------------

-- Find the item_description having the bottle size of 750 --
USE BRANDS
SELECT *FROM ITEMS_TABLE;
SELECT ITEM_DESCRIPTION , BOTTLE_SIZE FROM ITEMS_TABLE WHERE bottle_size = 750;

-- Find the vendor Name having the vendor_nos 305 , 380 , 391 --
SELECT *FROM ITEMS_TABLE;
SELECT vendor_name FROM ITEMS_TABLE WHERE vendor_nos IN (305,380,391);

-- What is total Bottle_price --

SELECT SUM(BOTTLE_PRICE) AS TOTAL_BOTTLE_PROCE FROM ITEMS_TABLE

-- Make Primary Key to Item_id --
SELECT *FROM ITEMS_TABLE;
ALTER TABLE ITEMS_TABLE
ADD PRIMARY KEY (item_id);

-- Which item id having the bottle_price of $ 5.06 --
SELECT *FROM ITEMS_TABLE;
SELECT ITEM_ID,bottle_price FROM ITEMS_TABLE WHERE bottle_price =5.06

-- Apply INNER  , FULL OUTER , LEFT JOIN types on both the table --
SELECT *FROM ITEMS_TABLE;

SELECT *FROM 
BRANDS.[dbo].ITEMS_TABLE AS T1
INNER JOIN PRODUCTS.[dbo].PRODUCT_TABLE AS T2
ON T1.Item_Id=T2.Product_Id

SELECT *FROM 
BRANDS.[dbo].ITEMS_TABLE AS T1
FULL JOIN PRODUCTS.[dbo].PRODUCT_TABLE AS T2
ON T1.Item_Id=T2.Product_Id

SELECT *FROM 
BRANDS.[dbo].ITEMS_TABLE AS T1
FULL OUTER JOIN PRODUCTS.[dbo].PRODUCT_TABLE AS T2
ON T1.Item_Id=T2.Product_Id

SELECT *FROM 
BRANDS.[dbo].ITEMS_TABLE AS T1
LEFT JOIN PRODUCTS.[dbo].PRODUCT_TABLE AS T2
ON T1.Item_Id=T2.Product_Id

-- Apply  OUTER  ,  RIGHT JOIN , CROSS JOIN types  on both the table --
SELECT *FROM 
BRANDS.[dbo].ITEMS_TABLE AS T1
RIGHT JOIN PRODUCTS.[dbo].PRODUCT_TABLE AS T2
ON T1.Item_Id=T2.Product_Id

SELECT *FROM 
BRANDS.[dbo].ITEMS_TABLE AS T1
RIGHT JOIN PRODUCTS.[dbo].PRODUCT_TABLE AS T2
ON T1.Item_Id=T2.Product_Id

SELECT *FROM 
BRANDS.[dbo].ITEMS_TABLE AS T1
RIGHT OUTER JOIN PRODUCTS.[dbo].PRODUCT_TABLE AS T2
ON T1.Item_Id=T2.Product_Id

SELECT *FROM 
BRANDS.[dbo].ITEMS_TABLE AS T1
CROSS JOIN PRODUCTS.[dbo].PRODUCT_TABLE AS T2;

-- Find the item_description and Product having the gross sales of 13,320.00 --
USE BRANDS
SELECT *FROM ITEMS_TABLE;
USE PRODUCTS
select *from PRODUCT_TABLE;

CREATE VIEW item_description_product_gross_sales 
AS
SELECT *FROM 
BRANDS.[dbo].ITEMS_TABLE AS T1
INNER JOIN 
PRODUCTS.[dbo].PRODUCT_TABLE AS T2
ON T1.Item_Id=T2.Product_Id

SELECT *FROM item_description_product_gross_sales

CREATE VIEW item_description_product_gross_sales1 AS
SELECT item_description_product_gross_sales.item_description,item_description_product_gross_sales.Gross_Sales
FROM item_description_product_gross_sales

SELECT *FROM item_description_product_gross_sales1

-- Split the Item_description Column into Columns Item_desc1 and Item_desc2 --

SELECT
  SUBSTRING(Item_description, 1 , 
  CHARINDEX(' ', Item_description)-1) 
  AS Item_desc1,
  SUBSTRING(Item_description, 
  CHARINDEX(' ', Item_description) + 1, 
  LEN(Item_description)) 
  AS Item_desc2
FROM item_description_product_gross_sales1;