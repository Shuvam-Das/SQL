/* Capstone Project (Customer_Orders_Products Database)
Let’s Create One Database name as Customers_Orders_Products and Create three tables called as 
Customers,
Orders, 
Products
Insert atleast 10 Records in it 
Records are 
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(100)
); */

Create Database Customers_Orders_Products

USE Customers_Orders_Products

CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
Name VARCHAR(50),
Email VARCHAR(100)
);

INSERT INTO Customers VALUES
(1, 'John Doe', 'johndoe@example.com'),
(2, 'Jane Smith', 'janesmith@example.com'),
(3, 'Robert Johnson', 'robertjohnson@example.com'),
(4, 'Emily Brown', 'emilybrown@example.com'),
(5, 'Michael Davis', 'michaeldavis@example.com'),
(6, 'Sarah Wilson', 'sarahwilson@example.com'),
(7, 'David Thompson', 'davidthompson@example.com'),
(8, 'Jessica Lee', 'jessicalee@example.com'),
(9, 'William Turner', 'williamturner@example.com'),
(10, 'Olivia Martinez', 'oliviamartinez@example.com');


CREATE TABLE Products (
ProductID INT PRIMARY KEY,
ProductName VARCHAR (50) not null unique,
Price DECIMAL (10, 2)
);


INSERT INTO Products VALUES
(1, 'Product A', 10.99),
(2, 'Product B', 8.99),
(3, 'Product C', 5.99),
(4, 'Product D', 12.99),
(5, 'Product E', 7.99),
(6, 'Product F', 6.99),
(7, 'Product G', 9.99),
(8, 'Product H', 11.99),
(9, 'Product I', 14.99),
(10, 'Product J', 4.99);


CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
CustomerID INT REFERENCES Customers,
ProductName VARCHAR(50) references products(productname),
OrderDate DATE,
Quantity INT
);


INSERT INTO Orders VALUES
(1, 1, 'Product A', '2023-07-01', 5),
(2, 2, 'Product B', '2023-07-02', 3),
(3, 3, 'Product C', '2023-07-03', 2),
(4, 4, 'Product A', '2023-07-04', 1),
(5, 5, 'Product B', '2023-07-05', 4),
(6, 6, 'Product C', '2023-07-06', 2),
(7, 7, 'Product A', '2023-07-07', 3),
(8, 8, 'Product B', '2023-07-08', 2),
(9, 9, 'Product C', '2023-07-09', 5),
(10, 10, 'Product A', '2023-07-10', 1);


-- TASK 1:-

-- 1.	Write a query to retrieve all records from the Customers table..
select * from Customers

-- 2.	Write a query to retrieve the names and email addresses of customers whose names start with 'J'.

SELECT name,email from customers where name like 'J%'

-- 3.	Write a query to retrieve the order details (OrderID, ProductName, Quantity) for all orders..

select orderid,Product_Name,quantity from orders

-- 4.	Write a query to calculate the total quantity of products ordered.

SELECT COUNT(quantity) from orders

-- 5.	Write a query to retrieve the names of customers who have placed an order.

select name from orders,Customers where Customers.Customer_ID=orders.customerid

-- 6.	Write a query to retrieve the products with a price greater than $10.00.

select productname from products where price>=10

-- 7.	Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'.

select name,orderdate from customers,orders where Customers.Customer_ID=orders.customerid and orderdate >'2023-07-05';

-- 8.	Write a query to calculate the average price of all products.

SELECT avg(price) from products;

-- 9.	Write a query to retrieve the customer names along with the total quantity of products they have ordered.

SELECT name,quantity from customers,orders where Customers.Customer_ID=orders.customerid;

-- 10.	Write a query to retrieve the products that have not been ordered.

Select productname from products where productname not in(Select productname from orders);

-- TASK:- 2

-- 1.	Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders.

select top 5 customers.Customer_ID,name from customers,orders where customers.Customer_ID=Orders.CustomerID order by Quantity desc;

-- OR

select top 5 CustomerID from orders order by Quantity desc;

-- 2.	Write a query to calculate the average price of products for each product category.

SELECT productname,avg(price) from products GROUP BY productname

-- 3.	Write a query to retrieve the customers who have not placed any orders.

Select Customer_ID from customers where Customer_ID not in(Select customerid from orders)

-- 4.	Write a query to retrieve the order details (OrderID, ProductName, Quantity) for orders placed by customers whose names start with 'M'.

select orderid,Product_Name,quantity from orders,customers where Customers.Customer_ID=orders.customerid and customers.name like 'M%'

-- 5.	Write a query to calculate the total revenue generated from all orders.

select (price*quantity) as TotalRevenueGenerated from orders,products where Orders. Product_Name=products. Productname;

-- 6.	Write a query to retrieve the customer names along with the total revenue generated from their orders.

select name, (Quantity* Price) as revenue from Customers, Orders, Products where Customers.Customer_ID=Orders.OrderID 
and Products.ProductName=Orders.Product_Name;

-- 7.	Write a query to retrieve the customers who have placed at least one order for each product category.

select customerid from orders where quantity>=1

-- 8.	Write a query to retrieve the customers who have placed orders on consecutive days.

select * from Customers
select * from Products
select * from Orders

SELECT DISTINCT C.Customer_ID, C.Name, C.Email
FROM Customers C
JOIN Orders O1 ON C.Customer_ID = O1.CustomerID
JOIN Orders O2 ON C.Customer_ID = O2.CustomerID
WHERE DATEDIFF(DAY, O1.OrderDate, O2.OrderDate) = 1;


-- 9.	Write a query to retrieve the customers who have placed orders on consecutive days.

select top 3 Product_Name, avg(Quantity) from Orders group by Product_Name order by avg(Quantity) desc;

-- 10.	Write a query to calculate the percentage of orders that have a quantity greater than the average quantity.

alter table orders alter column quantity decimal(3,2);
select orderid, concat((quantity/(select sum(quantity)from orders)*100),'%') as percentage from orders 
where Quantity>(select avg(Quantity) from orders);


-- Task 3:-
-- 1.	Write a query to retrieve the customers who have placed orders for all products.

CREATE VIEW Customers_Orders_Products1
AS
SELECT * FROM 
Customers_Orders_Products.dbo.Customers AS T1
INNER JOIN Customers_Orders_Products.dbo.Products AS T2
ON T1.Customer_ID=T2.ProductID
INNER JOIN Customers_Orders_Products.dbo.Orders AS T3
ON T1.Customer_ID=T3.OrderID

SELECT *FROM Customers_Orders_Products1
-- OR --
SELECT c.Customer_ID, c.Name, c.Email FROM Customers c
WHERE NOT EXISTS (SELECT p.ProductID
FROM Products p WHERE NOT EXISTS 
(SELECT o.OrderID FROM Orders o WHERE o.CustomerID = c.Customer_ID AND o.Product_Name = p.ProductName))

-- 2.	Write a query to retrieve the products that have been ordered by all customers.

SELECT O.Product_Name
FROM Orders O
GROUP BY O.Product_Name
HAVING COUNT(DISTINCT O.CustomerID) = (SELECT COUNT(*) FROM Customers);

-- 3.	Write a query to calculate the total revenue generated from orders placed in each month ?

SELECT 
    YEAR(o.OrderDate) AS OrderYear,
    MONTH(o.OrderDate) AS OrderMonthNo,
    SUM(p.Price * o.Quantity) AS MonthlyRevenue
FROM Orders o
JOIN Products p ON o.Product_Name = p.ProductName
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY OrderYear, OrderMonthNo;

-- 4.	Write a query to retrieve the products that have been ordered by more than 50% of the customers.

SELECT p.ProductID, p.ProductName
FROM Products p
JOIN Orders o ON p.ProductName = o.Product_Name
GROUP BY p.ProductID, p.ProductName
HAVING COUNT(DISTINCT o.CustomerID) > (SELECT COUNT(DISTINCT CustomerID) * 0.5 FROM Customers)

-- 5.	Write a query to retrieve the top 5 customers who have spent the highest amount of money on orders.

select top 5 c.Customer_ID, c.Name, SUM(o.quantity*p.price) as Highest_Amount_Spend from Customers c
inner join Orders o on c.Customer_ID=o.CustomerID
inner join Products p on o.Product_Name=p.ProductName
group by c.Customer_ID, c.Name
order by highest_amount_spend desc

-- 6.	Write a query to calculate the running total of order quantities for each customer.

SELECT CustomerID, OrderID, OrderDate, Quantity,
SUM(Quantity) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS RunningTotal
FROM Orders

-- 7.	Write a query to retrieve the top 3 most recent orders for each customer.

SELECT top 3  CustomerID, OrderID, Product_Name, OrderDate, Quantity
FROM (SELECT *,ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY OrderDate DESC) AS rn FROM Orders )as ranked_order
where rn <=3 
order by CustomerID, rn

-- 8.	Write a query to calculate the total revenue generated by each customer in the last 30 days.

SELECT c.Customer_ID, c.Name, SUM(p.Price * o.Quantity) AS TotalRevenue
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.CustomerID
JOIN Products p ON o.Product_Name = p.ProductName
WHERE o.OrderDate >= DATEADD(day, -30, GETDATE()) AND o.OrderDate <= GETDATE()
GROUP BY c.Customer_ID, c.Name

-- 9.	Write a query to retrieve the customers who have placed orders for at least two different product categories.

SELECT c.Customer_ID, c.Name
FROM Customers c WHERE c.Customer_ID IN (
SELECT o.CustomerID FROM Orders o
JOIN Products p ON o.Product_Name = p.ProductName
GROUP BY o.CustomerID
HAVING COUNT(DISTINCT p.ProductName) >= 2

-- 10.	Write a query to calculate the average revenue per order for each customer.

SELECT c.Customer_ID, c.Name, avg(o.quantity*p.price) as Average_revenue from Customers c
inner join Orders o on c.Customer_ID=o.CustomerID
inner join Products p on o.Product_Name=p.ProductName
group by c.Customer_ID, c.Name
order by Average_revenue desc

-- 11.	Write a query to retrieve the customers who have placed orders for every month of a specific year.

SELECT C.Customer_ID, C.Name, C.Email
FROM Customers C
WHERE NOT EXISTS (
SELECT DISTINCT MONTH(O.OrderDate) AS Month
FROM Orders O WHERE YEAR(O.OrderDate) = 2023 EXCEPT
SELECT DISTINCT MONTH(OrderDate) FROM Orders O
WHERE O.CustomerID = C.Customer_ID
);


-- 12.	Write a query to retrieve the customers who have placed orders for a specific product in consecutive months.

SELECT DISTINCT C.Customer_ID, C.Name, C.Email
FROM Customers C
JOIN Orders O1 ON C.Customer_ID = O1.CustomerID
JOIN Orders O2 ON C.Customer_ID = O2.CustomerID
WHERE 
O1.Product_Name = 'Product A'
AND 
O2.Product_Name = 'Product A'
AND 
DATEADD(MONTH, 1, O1.OrderDate) = O2.OrderDate;


-- 13.	Write a query to retrieve the products that have been ordered by a specific customer at least twice.

SELECT O.Product_Name, COUNT(*) AS OrderCount
FROM Orders O
WHERE O.CustomerID = 3
GROUP BY O.Product_Name
HAVING COUNT(*) >= 2;

