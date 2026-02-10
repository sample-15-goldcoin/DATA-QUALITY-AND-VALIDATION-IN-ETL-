CREATE DATABASE sales_db1;
USE sales_db;
CREATE TABLE sales_Transactions1 ( 
Txn_ID INT PRIMARY KEY,
Customer_ID VARCHAR(10),
Customer_Name VARCHAR(50),
Product_ID VARCHAR(10), 
Quantity INT,
Txn_Amount INT,
Txn_Date DATE,
City VARCHAR(30));
INSERT INTO Sales_Transactions1 VALUES
(201, 'C101', 'Rahul Mehta', 'P11', 2, 4000, '2025-12-01', 'Mumbai'),
(202, 'C102', 'Anjali Rao', 'P12', 1, 1500, '2025-12-01', 'Bengaluru'),
(203, 'C101', 'Rahul Mehta', 'P11', 2, 4000, '2025-12-01', 'Mumbai'),
(204, 'C103', 'Suresh Iyer', 'P13', 3, 6000, '2025-12-02', 'Chennai'),
(205, 'C104', 'Neha Singh', 'P14', NULL, 2500, '2025-12-02', 'Delhi'),
(206, 'C105', 'N/A', 'P15', 1, NULL, '2025-12-03', 'Pune'),
(207, 'C106', 'Amit Verma', 'P16', 1, 1800, NULL, 'Pune'),
(208, 'C101', 'Rahul Mehta', 'P11', 2, 4000, '2025-12-01', 'Mumbai');
SELECT * FROM sales_Transactions1;
-- Question 7 : Write an SQL query on sales_Transactions1 to list all duplicates keys and their counts using the business key (Customer_ID + Product_ID + Txn_Amount)
SELECT 
Customer_ID,
Product_ID,
Txn_Date,
Txn_Amount,
COUNT(*) AS duplicate_count
FROM Sales_Transactions1
GROUP BY 
Customer_ID,
Product_ID,
Txn_Date,
Txn_Amount
HAVING COUNT(*) > 1;
-- Question 8 : Enforcing Referential Integrity 
-- Assume the following table:
-- Identity sales_Transactions1.Customer_ID values that violate referential integrity when joined with Customer_Master and write to detect such violations.
CREATE TABLE Customers_Master1 ( 
CustomerID VARCHAR(10) PRIMARY KEY,
CustomerName VARCHAR(50),
City VARCHAR(30));
INSERT INTO Customers_Master1 VALUES
('C101', 'Rahul Mehta', 'Mumbai'),
('C102', 'Anjali Rao', 'Bengaluru'),
('C103', 'Suresh Iyer', 'Chennai'),
('C104', 'Neha Singh', 'Delhi');
SELECT DISTINCT s.Customer_ID
FROM Sales_Transactions1 s
LEFT JOIN Customers_Master1 c
ON s.Customer_ID = c.CustomerID
WHERE c.CustomerID IS NULL;


