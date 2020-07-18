-- ASCII pattern matching with char column
CREATE TABLE t (col1 char(30));
INSERT INTO t VALUES ('Robert King');
SELECT * 
FROM t 
WHERE col1 LIKE '% King';   -- returns 1 row

-- Unicode pattern matching with nchar column
CREATE TABLE t (col1 nchar(30));
INSERT INTO t VALUES ('Robert King');
SELECT * 
FROM t 
WHERE col1 LIKE '% King';   -- no rows returned

-- Unicode pattern matching with nchar column and RTRIM
CREATE TABLE t (col1 nchar (30));
INSERT INTO t VALUES ('Robert King');
Go
SELECT * 
FROM t 
WHERE RTRIM(col1) LIKE '% King';   -- returns 1 row
Go
USE AdventureWorks2012;
GO
SELECT Name
FROM sys.system_views
WHERE Name LIKE 'dm%';
GO
USE AdventureWorks2012;
GO
SELECT p.FirstName, p.LastName, ph.PhoneNumber
FROM Person.PersonPhone AS ph
INNER JOIN Person.Person AS p
ON ph.BusinessEntityID = p.BusinessEntityID
WHERE ph.PhoneNumber LIKE '415%'
ORDER by p.LastName;
GO
USE AdventureWorks2012;
GO
SELECT p.FirstName, p.LastName, ph.PhoneNumber
FROM Person.PersonPhone AS ph
INNER JOIN Person.Person AS p
ON ph.BusinessEntityID = p.BusinessEntityID
WHERE ph.PhoneNumber NOT LIKE '415%' AND p.FirstName = 'Gail'
ORDER BY p.LastName;
GO
--===============================================================
-- Using the ESCAPE clause
--The following example uses the ESCAPE clause and 
--the escape character to find the exact character string 10-15% in column c1 of the mytbl2 table.
USE tempdb;
GO
IF EXISTS(SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES
      WHERE TABLE_NAME = 'mytbl2')
   DROP TABLE mytbl2;
GO
USE tempdb;
GO
CREATE TABLE mytbl2
(
 c1 sysname
);
GO
INSERT mytbl2 VALUES ('Discount is 10-15% off'), ('Discount is .10-.15 off');
GO
SELECT c1 
FROM mytbl2
WHERE c1 LIKE '%10-15!% off%' ESCAPE '!';
GO
--Using the [ ] wildcard characters
--The following example finds employees on the Person table with the first name of Cheryl or Sheryl.
USE AdventureWorks2012;
GO
SELECT BusinessEntityID, FirstName, LastName 
FROM Person.Person 
WHERE FirstName LIKE '[CS]heryl';
GO
USE AdventureWorks2012;
GO
SELECT LastName, FirstName
FROM Person.Person
WHERE LastName LIKE 'Zh[ae]ng'
ORDER BY LastName ASC, FirstName ASC;
GO