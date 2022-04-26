

SELECT  CategoryName, Description
FROM Northwind..Categories


SELECT ContactName, CompanyName, ContactTitle, Phone
FROM Northwind..Customers



-- Employee Report Showing newest to oldest Hire
SELECT  FirstName, LastName, HireDate
FROM Northwind..Employees
ORDER BY HireDate Desc

--Northwind orders by Most expensive to chepeast Frieght train
SELECT  OrderID, OrderDate, ShippedDate, CustomerID, Freight
FROM Northwind..Orders
ORDER BY Freight Desc


SELECT CompanyName , Fax, Phone, HomePage,Country
FROM Northwind..Suppliers
ORDER BY  Country DESC, CompanyName Asc

--company , contact name of Northwind customers in Buenos Aires
SELECT CompanyName , ContactName
FROM Northwind..Customers
WHERE City = 'Buenos Aires'

--The product name, price and quanity per unit that are out of stock
SELECT  ProductName, UnitPrice, UnitsInStock, QuantityPerUnit
FROM Northwind..Products
WHERE UnitsInStock = 0

-- The order, ship date , customer id and freight of all orders place on may 1997
SELECT  OrderDate, ShippedDate, CustomerID, Freight
FROM Northwind..Orders
WHERE OrderDate = CONVERT(VARCHAR, '05/15/1997', 103)

 --Show the full name and country of all employees not found in United States
 SELECT  FirstName, LastName, Country
FROM Northwind..Employees
WHERE  Country <> 'USA'

-- shows the employee id, customer id, required date, and shippeddate  
--where the order was shipped later than when it was required.
SELECT EmployeeID,OrderID ,CustomerID, RequiredDate, ShippedDate
FROM Northwind..Orders
WHERE RequiredDate < ShippedDate

--Show city, company name, contact name 
--customers who are in cities that start with A or B

SELECT City, CompanyName, ContactName
FROM Northwind..Customers
WHERE City like 'A%' OR  City like 'B%'
ORDER BY ContactName Desc

--Show all orders that have a freight cost of more than 500
SELECT * 
FROM Northwind..Orders
WHERE Freight > 500

--show the product name, units in stock, reorder level of all products that are up for reorder
SELECT ProductName, UnitsInStock, ReorderLevel
FROM Northwind..Products
WHERE ReorderLevel > 0

--shows the companyname, contact name , fax number of all customers that dohave a fax number
SELECT CompanyName, ContactName, Fax
FROM Northwind..Customers
WHERE Fax IS NOT NULL
ORDER BY  CompanyName
--show the first and last name of all employees who do not report to anybody
SELECT FirstName, LastName
FROM Northwind..Employees
WHERE ReportsTo < 1 OR ReportsTo IS NULL

--show the first and last names and birth date of all employees born in the 1950s
SELECT FirstName,LastName, BirthDate
FROM Northwind..Employees
WHERE BirthDate >= '1950-01-01' AND BirthDate <= '1959-12-31'

--show product name and supplier id for all products supplied by Exotic liquids, grandma kelly hometead, tokyo trader
SELECT ProductName, Products.SupplierID
FROM Northwind..Products
JOIN Northwind..Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE CompanyName IN ('Exotic Liquids','Grandma Kelly''s Homestead','Tokyo Traders')


--20. show shipping postal code , order id, order date with a ship postal code starting with 02389
SELECT ShipPostalCode, OrderID, OrderDate
FROM Northwind..Orders
WHERE ShipPostalCode like '02389%';


--21.Include contact name, title and company name for all customers whose
--contact tile does not contain the word "Sales"\

SELECT [ContactName]
      ,[ContactTitle]
	  ,[CompanyName]
FROM Northwind..Customers
WHERE ContactTitle not like '%Sales%';

-- first and last names and cities of employees from cities other than seattle
--in  the state of Washington

SELECT FirstName , LastName, City
FROM Northwind..Employees
WHERE City <> 'Seattle' and Region ='WA';


--Show  the comapny name, contact tile, city and country of all customer in
--mexico or in any city in spain except madrid

SELECT CompanyName, ContactTitle, City, Country
FROM Northwind..Customers
WHERE Country = 'Mexico' OR (Country = 'Spain' AND  City <> 'Madrid');

-- make a contact column for employee
SELECT CONCAT(FirstNAme ,' ', LastName, ' can be reached by',' ','x',Extension) AS ContactInfo
FROM Northwind..Employees;

-- show the unit in stock, unit price , the total price value of all units in stock
--the total price value of all units stock rounded down, and total prices of all units rounded up
SELECT UnitPrice, UnitsInStock , (UnitPrice * UnitsInStock) as 'TotalPriceValue',
ROUND((UnitPrice * UnitsInStock),-1) AS 'TotalPriceValueUP'
FROM Northwind..Products
ORDER BY 3 DESC
