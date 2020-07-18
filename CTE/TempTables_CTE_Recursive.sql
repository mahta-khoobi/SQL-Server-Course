
--WITH cteName AS
--(
--   query1 ===> Anchor Member
--   UNION ALL =====> [UNION,INTERSECT,EXCEPT]
--   query2 ===> Recursive Member
--)

CREATE TABLE tbl_Employee
(
  EmployeeID int NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  ManagerID int NULL
)
 
GO

INSERT INTO tbl_Employee VALUES (101,'Ali','Hamidi',NULL)
INSERT INTO tbl_Employee VALUES (102,'Mina','Nazari', 101)
INSERT INTO tbl_Employee VALUES (103,'Ali Mohammad','Bahmanyar', 102)
INSERT INTO tbl_Employee VALUES (104,'Masoud','Narimani', 103)
INSERT INTO tbl_Employee VALUES (105,'Mohsen','Hashemi', 103)
INSERT INTO tbl_Employee VALUES (106,'Fatemeh','Masoumifar', 102)
INSERT INTO tbl_Employee VALUES (107,'Matin','Mahmoudi', 106)
INSERT INTO tbl_Employee VALUES (108,'Nasim','Malek', 106)
INSERT INTO tbl_Employee VALUES (109,'Reza','Bagheri', 102)
INSERT INTO tbl_Employee VALUES (110,'Samira','Esmi', 102)

select * from tbl_Employee

WITH cteReports(EmpID, FirstName, LastName, MgrID, EmpLevel)
AS
(
SELECT EmployeeID, FirstName, LastName, ManagerID, 1 as EmpLevel
FROM Employees
WHERE ManagerID IS NULL
UNION ALL
SELECT e.EmployeeID, e.FirstName, e.LastName, e.ManagerID,r.EmpLevel + 1
FROM Employees e INNER JOIN cteReports r
ON e.ManagerID = r.EmpID
)
SELECT
FirstName +' '+ LastName AS FullName,EmpLevel,(SELECT FirstName +' '+ LastName FROM Employees
												WHERE EmployeeID = cteReports.MgrID)AS Manager
FROM cteReports
ORDERBY EmpLevel, MgrID



