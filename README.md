# Database-Design-and-Management-Project
Designed a database from scratch with Diagrams, Entity Design, Schema, and SQL queries including detail report 

# Introduction
Designed and demonstrated relational database from scratch for 20 fashion stores with Entity-Relationship Diagrams, Relational Schema, Database Designs and SQL queries using MS VISIO and MSSQL server. Featched required information by manipulating database through complax SQL Queries for improving communication between stores employees, customers, and inventory entities. 


# Entity-Relationship Diagram

![](https://github.com/romilpatel78/Database-Design-and-Management-Project/blob/master/EERD%201.PNG)

![](https://github.com/romilpatel78/Database-Design-and-Management-Project/blob/master/EERD%202.PNG)

# Relational Schema

![](https://github.com/romilpatel78/Database-Design-and-Management-Project/blob/master/Relational%20Schema.PNG)

# Database Design

![](https://github.com/romilpatel78/Database-Design-and-Management-Project/blob/master/Database%20Diagram.PNG)

# Assumptions

• Store may have at least one or more than one product inventory.

• Product Inventory may at least one store or more than one store.

• Manufacturer may not supply any inventory.

• Customer may not make any sales.

• Sale may be made by one and only one customer.

• Customer may use at least one payment method.

• Store may have at least one inventory.

• Store may not have any sales.

• Sale may be made at least one store.

• Store may have at least one sales associate.

• Sales associates may not help any customer, if customer don’t need help.

• Sales associates may not credit for any sales.

• Manager may supervise at least one sales associate.

• At least one customer may get at least one coupon.

• For return with receipt there may be at least one sale or at least one item to be purchased.

• For return without receipt at least one or many items may purchase by at least one customer.

# Data Requirement and Queries

/*1*/ /* Information Selection Query */

/* List the ProductID, Product Name, Inventory Price for all the Products with a Inventory Price in range of between 50 and 250 Put the list in order of CategoryID, then descending order of Inventory Price */

Select CategoryID, InventoryPrice, ProductID, ProductName
FROM Inventory_T
where InventoryPrice BETWEEN 50 AND 250
ORDER BY CategoryID, InventoryPrice DESC;

![](https://github.com/romilpatel78/Database-Design-and-Management-Project/blob/master/Queries_Output/Q%201.PNG)

/*2*/ /*Aggregate Function Query */

/*What is the total of inventory price for all the products in CategoryID 2*/

SELECT SUM(InventoryPrice) AS 'Total'
FROM Inventory_T
Where CategoryID IN (1,2,3);

![](https://github.com/romilpatel78/Database-Design-and-Management-Project/blob/master/Queries_Output/Q%202.PNG)

/*3*/ /*2 table Query */

/*For sales with the ID's 2705,2708,2709, show the SaleID, Date of Sale, Time of Sale, CustomerID,, and the Phone number of the Customer who purchases the product. Put the list in descending order of SaleID */

SELECT S.SaleID, S.Date, C.CustomerID, C.FirstName ,C.Phone
FROM Sale_T AS S, Customer_T AS C
WHERE S.CustomerID = C.CustomerID
AND S.SaleID BETWEEN 2700 AND 2707
ORDER BY S.SaleID DESC;

![](https://github.com/romilpatel78/Database-Design-and-Management-Project/blob/master/Queries_Output/Q%203.PNG)

/*4*/ /*3 Table Query */

/*List the CategoryID, CategoryType, ProductID, ProductName, InventoryPrice, CompanyName for all the products that belong in the categories 1 and 2, also which has CompanyName ZARA, Michael Kors. Put List in order of CategoryID, then Descending order of Inventory Price*/

SELECT CT.CategoryID, CT.CategoryType, CT.CatDesc, I.ProductID, I.ProductName, I.InventoryPrice, M.CompanyName
FROM Category_T AS CT, Inventory_T AS I, Manufacture_T AS M
WHERE M.CompanyID=I.CompanyID
AND I.CategoryID=Ct.CategoryID
AND CT.CategoryID IN (1,2)
AND M.CompanyName IN ('ZARA', 'Michael Kors', 'ADIDAS','NIKE');

![](https://github.com/romilpatel78/Database-Design-and-Management-Project/blob/master/Queries_Output/Q%204.PNG)

/*5*/ /*4 table Query */

/* For all sale from customers with ID's 1,2,3, List the CustomerName, SaleID, ProductName, Quantity, Price, and individual total of (Quantity * Price). USe the column alias 'Total' for (Quantity * Price). Put your list in order of CustomerName, then Descending order of SaleDate*/

SELECT CONCAT(C.FirstName,C.LastName) AS 'Customer Name', S.SaleID, S.Date, I.ProductName, SIS.Quantity, SIS.Price, (SIS.Quantity * SIS.Price) AS 'Total'
FROM Customer_T AS C, Sale_T AS S, Store_Inventory_Sale_T AS SIS, Inventory_T AS I
WHERE C.CustomerID=S.CustomerID
AND S.SaleID=SIS.SaleID
AND SIS.ProductID=I.ProductID
AND C.CustomerID BETWEEN 80 AND 89
ORDER BY CONCAT(C.FirstName,C.LastName), S.Date DESC;

![](https://github.com/romilpatel78/Database-Design-and-Management-Project/blob/master/Queries_Output/Q%205.PNG)

/*6*/ /*5 table Query*/

/*For each Store from the manager with the ID's 4400,4600, or 4700, list the ManagerID, StoreID, StoreName, StoreCity, ProductName, SaleID, individual total (Price*Quantity). Use the column alias 'Total', CompanyID, CompanyName. Put the list in descending order of StoreID*/

SELECT SAT.ManagerID, St.StoreID, St.StoreName, ST.City, I.ProductName, SI.SaleID, SI.Quantity, SI.Price, (SI.Price*SI.Quantity) AS 'Total', M.CompanyID, M.CompanyName
FROM SaleAssociate_T AS SAT, Store_T AS St, Inventory_T AS I, Store_Inventory_Sale_T AS SI, Manufacture_T M
WHERE SAT.StoreID = St.StoreID
AND St.StoreID = SI.StoreID
AND SI.ProductID = I.ProductID
AND I.CompanyID = M.CompanyID
AND SAT.ManagerID IN (4400,4600,4700)
ORDER BY StoreID DESC;

![](https://github.com/romilpatel78/Database-Design-and-Management-Project/blob/master/Queries_Output/Q%206.PNG)

/*6*/ /* Sub Query*/

Sub Queries: Subqueries are the queries which has a query within a query.
It is also referred as a Nested Queries. One example of subqueries with the join table.

/*List CompanyID, CompanyName, InventoryPrice, ProductID, ProductName, ProdDesc for all the products that have an InventoryPrice less than Sum of all the InventoryPrice*/

SELECT I.CompanyID, M.CompanyName,I.InventoryPrice, I.ProductID, I.ProductName, I.ProdDesc, C.CategoryID, C.CatDesc
FROM Inventory_T AS I, Category_T AS C,Manufacture_T AS M
WHERE InventoryPrice <
(SELECT SUM(InventoryPrice) AS 'Total'
FROM Inventory_T
Where CategoryID IN (1,2,3))
AND I.CategoryID=C.CategoryID
AND I.CompanyID=M.CompanyID
ORDER BY I.CompanyID, I.InventoryPrice DESC;

![](https://github.com/romilpatel78/Database-Design-and-Management-Project/blob/master/Queries_Output/Q%207.PNG)
