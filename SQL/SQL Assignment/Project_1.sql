Create Database Customers_Orders_Products 
use Customers_Orders_Products 
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(100)
);

INSERT INTO Customers (CustomerID, Name, Email)
VALUES
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
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductName VARCHAR(50),
  OrderDate DATE,
  Quantity INT
);

INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
VALUES
	  (1, 1, 'Product A', '2023-07-01', 5),
	  (2, 2, 'Product B', '2023-07-02', 3),
	  (3, 3, 'Product C', '2023-07-03', 2),
	  (4, 4, 'Product A', '2023-07-04', 1),
	  (5, 5, 'Product B', '2023-07-05', 4),
	  (6, 6, 'Product C', '2023-07-06', 2),
	  (7, 7, 'Product A', '2023-07-07', 3),
	  (8, 8, 'Product B', '2023-07-08', 2),
	  (9, 9, 'Product C', '2023-07-09', 5),
	 (10, 10,'Product A', '2023-07-10', 1);
  
CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES
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

  --Task 1 :- 1.Write a query to retrieve all records from the Customers table..
    select * from customers

--2.Write a query to retrieve the names and email addresses of customers whose names start with 'J'.
	select Name,Email from Customers
	where Name like 'J%'

--3.Write a query to retrieve the order details (OrderID, ProductName, Quantity) for all orders..
select OrderID,ProductName,Quantity from orders

--4.Write a query to calculate the total quantity of products ordered.
select ProductName, SUM(quantity)as total_products_quantity_ordered from Orders
group by ProductName

--5.Write a query to retrieve the names of customers who have placed an order.
SELECT C.Name
FROM Customers AS C
INNER JOIN Orders AS O ON C.CustomerID = O.CustomerID;

--6.Write a query to retrieve the products with a price greater than $10.00.
select ProductID,ProductName,Price from Products
where Price >=10

--7.Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'.
select C.Name,O.OrderDate from Customers C
inner join Orders O on C.CustomerID=O.CustomerID
where OrderDate >='2023-07-05'

--8.Write a query to calculate the average price of all products.
select AVG(price) as Avg_Price from Products

--9.Write a query to retrieve the customer names along with the total quantity of products they have ordered.
select C.Name,SUM(o.Quantity) as total_product_quantity from Customers C
inner join Orders o on C.CustomerID=o.CustomerID
group by C.Name
order by total_product_quantity asc

--10.Write a query to retrieve the products that have not been ordered.
select p.ProductName from Products P
left join Orders o on P.ProductID=o.CustomerID
where o.OrderID is null

--Task 2-1.Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders.
select top 5 c.CustomerID,c.Name,SUM(o.Quantity)as total_products_quantity from Customers C
left join Orders O on C.CustomerID=O.CustomerID
group by C.CustomerID,C.Name
order by total_products_quantity desc

--2.Write a query to calculate the average price of products for each product category.
select ProductName, AVG(price) as Avg_product_price from Products
group by ProductName

--3.Write a query to retrieve the customers who have not placed any orders.
select C.Name,o.CustomerID from Customers c
left join Orders o on c.CustomerID=o.CustomerID
where o.CustomerID is null

--4.Write a query to retrieve the order details (OrderID, ProductName, Quantity) 
-----for orders placed by customers whose names start with 'M'.-
select o.OrderID, o.ProductName, o.Quantity from Orders o left join Customers c
on o.CustomerID=c.CustomerID
where c.Name like 'M%'

--5.	Write a query to calculate the total revenue generated from all orders.--
select O.ProductName, SUM(o.quantity*p.price) as total_revenue from Orders o
join Products p on o.CustomerID	=p.ProductID
group by o.ProductName
order by total_revenue desc

--6.Write a query to retrieve the customer names along with the total revenue generated from their orders.--
SELECT C.Name, SUM(O.Quantity * P.Price) AS total_revenue FROM Orders O
JOIN Products P ON O.ProductName = P.ProductName
JOIN Customers C ON O.CustomerID = C.CustomerID
GROUP BY C.Name
ORDER BY total_revenue DESC;

--7.Write a query to retrieve the customers who have placed at least one order for each product category.--
SELECT c.CustomerID, c.Name FROM Customers c
WHERE NOT EXISTS (SELECT p.ProductName FROM Products p
WHERE NOT EXISTS (SELECT o.OrderID FROM Orders o WHERE o.CustomerID = c.CustomerID
AND o.ProductName = p.ProductName));

--8.Write a query to retrieve the customers who have placed orders on consecutive days.
WITH ConsecutiveOrders AS (
SELECT o.CustomerID,  o.OrderDate,
LEAD(o.OrderDate) OVER (PARTITION BY o.CustomerID ORDER BY o.OrderDate) AS NextOrderDate
FROM  Orders o )
SELECT DISTINCT c.CustomerID, c.Name
FROM Customers c
INNER JOIN 
ConsecutiveOrders co ON c.CustomerID = co.CustomerID
WHERE DATEDIFF(DAY, co.OrderDate, co.NextOrderDate) = 1;


--9.Write a query to retrieve the top 3 products with the highest average quantity ordered.
select top 3 p.ProductID, p.ProductName, AVG(o.Quantity) as Average_quantity_ordered from Products p
left join orders o
on p.ProductID  = o.OrderID
group by p.ProductID, p.ProductName
order by Average_quantity_ordered desc

--10.Write a query to calculate the percentage of orders that have a quantity greater than the average quantity.

WITH AvgQuantity AS (
    SELECT AVG(quantity) AS AvgQuantity FROM Orders
)
SELECT 
    (COUNT(CASE WHEN quantity > AvgQuantity THEN 1 END) * 100.0 / COUNT(*)) AS percentage
FROM Orders
CROSS JOIN AvgQuantity;



select * from Customers
select * from Orders
select * from Products










--Task 3:1.Write a query to retrieve the customers who have placed orders for all products.

SELECT c.CustomerID, c.Name, c.Email FROM Customers c
WHERE NOT EXISTS (SELECT p.ProductID
	 FROM Products p WHERE NOT EXISTS (SELECT o.OrderID
										FROM Orders o
										WHERE o.CustomerID = c.CustomerID AND o.ProductName = p.ProductName)
);
--2.Write a query to retrieve the products that have been ordered by all customers.
SELECT * 
FROM Products 
WHERE 

--3.Write a query to calculate the total revenue generated from orders placed in each month.


--4.Write a query to retrieve the products that have been ordered by more than 50% of the customers.


--5.Write a query to retrieve the top 5 customers who have spent the highest amount of money on orders.
select top 5 c.CustomerID, c.Name, SUM(o.quantity*p.price) as Highest_Amount_Spend from Customers c
inner join Orders o on c.CustomerID=o.CustomerID
inner join Products p on o.ProductName=p.ProductName
group by c.CustomerID, c.Name
order by highest_amount_spend desc

--6.Write a query to calculate the running total of order quantities for each customer.
SELECT CustomerID, OrderID, OrderDate, Quantity,
       SUM(Quantity) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS RunningTotal
FROM Orders

--7.Write a query to retrieve the top 3 most recent orders for each customer.
SELECT top 3  CustomerID, OrderID, ProductName, OrderDate, Quantity
FROM (SELECT *,ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY OrderDate DESC) AS rn FROM Orders )as ranked_order
where rn <=3 
order by CustomerID, rn
	
--8.Write a query to calculate the total revenue generated by each customer in the last 30 days.

SELECT c.CustomerID, c.Name, SUM(p.Price * o.Quantity) AS TotalRevenue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Products p ON o.ProductName = p.ProductName
WHERE o.OrderDate >= DATEADD(day, -30, GETDATE()) AND o.OrderDate <= GETDATE()
GROUP BY c.CustomerID, c.Name

--9.Write a query to retrieve the customers who have placed orders for at least two different product categories.
SELECT c.CustomerID, c.Name
FROM Customers c
WHERE c.CustomerID IN (
    SELECT o.CustomerID
    FROM Orders o
    JOIN Products p ON o.ProductName = p.ProductName
    GROUP BY o.CustomerID
    HAVING COUNT(DISTINCT p.ProductName) >= 2
);

--10.Write a query to calculate the average revenue per order for each customer.
select c.CustomerID, c.Name, avg(o.quantity*p.price) as Average_revenue from Customers c
inner join Orders o on c.CustomerID=o.CustomerID
inner join Products p on o.ProductName=p.ProductName
group by c.CustomerID, c.Name
order by Average_revenue desc

--11.Write a query to retrieve the customers who have placed orders for every month of a specific year.


--12.Write a query to retrieve the customers who have placed orders for a specific product in consecutive months.


--13.Write a query to retrieve the products that have been ordered by a specific customer at least twice.
select * from Customers
select * from Orders
select * from Products