CREATE DATABASE Students_SQL_Database;
USE Students_SQL_Database;

CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(100),
Email VARCHAR(100),
City VARCHAR(50),
Country VARCHAR(50)
);

CREATE TABLE Products (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Category VARCHAR(50),
Price DECIMAL(10,2),
Stock INT
);

CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
TotalAmount DECIMAL(10,2),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
OrderDetailID INT PRIMARY KEY,
OrderID INT,
ProductID INT,
Quantity INT,
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers VALUES
(1,'Anjana','anjana@gmail.com','Mysore','India'),
(2,'Rahul','rahul@gmail.com','Bangalore','India'),
(3,'John','john@gmail.com','New York','USA'),
(4,'Emma','emma@gmail.com','London','UK'),
(5,'Aisha','aisha@gmail.com','Dubai','UAE');

INSERT INTO Products VALUES
(101,'Laptop','Electronics',55000.00,20),
(102,'Smartphone','Electronics',25000.00,35),
(103,'Headphones','Accessories',2000.00,100),
(104,'Keyboard','Accessories',1500.00,60),
(105,'Mouse','Accessories',800.00,80);

INSERT INTO Orders VALUES
(1001,1,'2026-07-01',55000.00),
(1002,2,'2026-07-02',50000.00),
(1003,3,'2026-07-03',2000.00),
(1004,4,'2026-07-04',1500.00),
(1005,5,'2026-07-05',1600.00);

INSERT INTO OrderDetails VALUES
(1,1001,101,1),
(2,1002,102,2),
(3,1003,103,1),
(4,1004,104,1),
(5,1005,105,2);

SELECT * FROM Customers;

SELECT *FROM Products;

SELECT * FROM Customers WHERE Country = 'India';

SELECT *FROM Products ORDER BY Price DESC;

SELECT Country,COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country;

SELECT Customers.CustomerName,
Products.ProductName,
Orders.TotalAmount
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
INNER JOIN OrderDetails
ON Orders.OrderID = OrderDetails.OrderID
INNER JOIN Products
ON OrderDetails.ProductID = Products.ProductID;


SELECT Customers.CustomerName,Orders.OrderID
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;


SELECT Customers.CustomerName,Orders.OrderID
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;


SELECT ProductName,Price FROM Products WHERE Price >(SELECT AVG(Price) FROM Products);


SELECT SUM(TotalAmount) AS TotalSales FROM Orders;


SELECT AVG(TotalAmount) AS AverageOrderValue FROM Orders;

CREATE VIEW Sales_Report AS
SELECT Customers.CustomerName,
Products.ProductName,
Orders.TotalAmount FROM Orders
JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails
ON Orders.OrderID = OrderDetails.OrderID
JOIN Products
ON OrderDetails.ProductID = Products.ProductID;

SELECT * FROM Sales_Report;



CREATE INDEX idx_customer
ON Orders(CustomerID);

SHOW INDEX FROM Orders;

