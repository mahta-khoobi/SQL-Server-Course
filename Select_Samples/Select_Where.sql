use AdventureWorks2012
Go
--Keeping Your WHERE Clause Unambiguous
SELECT Title,FirstName,LastName
FROM Person.Person
WHERE Title = 'Ms.' AND (LastName = 'Antrim' OR LastName = 'Galvin')
Go
SELECT Title,FirstName,LastName 
FROM Person.Person
WHERE NOT (Title = 'Ms.' OR Title = 'Mrs.');
--or:
SELECT Title,FirstName,LastName
FROM Person.Person
WHERE Title != 'Ms.' AND Title != 'Mrs.';
Go
--You can write multiple operators (AND, OR, NOT) in a single WHERE clause,
-- but it is important to make your intentions clear by properly embedding your ANDs and ORs in parentheses.
-- The NOT operator takes precedence (is evaluated first) before AND.
--The AND operator takes precedence over the OR operator.
-- Using both AND and OR operators in the same WHERE clause without parentheses can return unexpected results.
--not good query:
SELECT Title,FirstName,LastName
FROM Person.Person
WHERE Title = 'Ms.' AND FirstName = 'Catherine' OR LastName = 'Adams'
GO
--Providing Shorthand Names for Tables
SELECT E.BusinessEntityID AS "Employee ID",
E.VacationHours AS "Vacation",
E.SickLeaveHours AS "Sick Time"
FROM HumanResources.Employee AS E;
Go
--What if you want to search for the literal % (percentage sign) or an _ (underscore) in your character column?
--you can use an ESCAPE operator. 
--The ESCAPE operator allows you to search for a wildcard symbol as an actual character. 

UPDATE Production.ProductDescription
SET Description = 'Chromoly steel. High % of defects'
WHERE ProductDescriptionID = 3;
Go
SELECT ProductDescriptionID,
Description
FROM Production.ProductDescription
WHERE Description LIKE '%/%%' ESCAPE '/';
Go
--Notice the use of /% in the middle of the search string passed to LIKE. The / is the ESCAPE operator. 
--Thus,the characters /% are interpreted as %, and the LIKE predicate will identify strings containing a % in any position.
Go
