
--Wrong Way
USE AdventureWorks2012;
GO
CREATE PROCEDURE FindEmployee @EmpLName char(20)
AS
SELECT @EmpLName = RTRIM(@EmpLName) + '%';
SELECT p.FirstName, p.LastName, a.City
FROM Person.Person p JOIN Person.Address a ON p.BusinessEntityID = a.AddressID
WHERE p.LastName LIKE @EmpLName;
GO
EXEC FindEmployee @EmpLName = 'Barb';
GO

--Right Way:
USE AdventureWorks2012;
Go
Drop procedure FindEmployee
GO
CREATE PROCEDURE FindEmployee @EmpLName varchar(20)
AS
SELECT @EmpLName = RTRIM(@EmpLName) + '%';
SELECT p.FirstName, p.LastName, a.City
FROM Person.Person p JOIN Person.Address a ON p.BusinessEntityID = a.AddressID
WHERE p.LastName LIKE @EmpLName;
GO
EXEC FindEmployee @EmpLName = 'Barb';