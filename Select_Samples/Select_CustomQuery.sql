--Q1:Finding a particular column name within all tables of SQL server datbase:
select table_name,column_name from information_schema.columns
where column_name like '%tax%'
Go
select table_name,column_name from information_schema.columns
where column_name like 'E%'
Go
SELECT t.name AS table_name,SCHEMA_NAME(schema_id) AS schema_name,c.name AS column_name
FROM sys.tables AS t INNER JOIN sys.columns c
ON t.OBJECT_ID = c.OBJECT_ID
WHERE c.name LIKE '%EmployeeID%'
ORDER BY schema_name, table_name;
Go
select sys.columns.name,sys.tables.name as table_name,schema_name(schema_id) as Schema_Name
from sys.tables inner join sys.columns
on sys.tables.object_id=sys.columns.object_id
where sys.tables.name like 'Employee%'
order by SCHEMA_NAME,table_name
Go
--All Column:
SELECT t.name AS table_name,SCHEMA_NAME(schema_id) AS schema_name,c.name AS column_name
FROM sys.tables AS t INNER JOIN sys.columns c 
ON t.OBJECT_ID = c.OBJECT_ID 
ORDER BY schema_name, table_name;
Go
--Q2:searching stored procedures containing a particular text:
select routine_name, routine_definition
      from information_schema.routines
      where routine_definition like '%tax_id%'
      and routine_type='procedure'
--Q3:Query to specific row from a table:
SELECT * FROM (
  SELECT 
    ROW_NUMBER() OVER (ORDER BY HumanResources.Employee.BusinessEntityID ASC) AS rownumber,*
    FROM HumanResources.Employee
)  as temptablename
WHERE rownumber IN (2,5)
Go
; WITH Base AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY Employee.BusinessEntityID) RN FROM HumanResources.Employee as Employee
)
SELECT *
    FROM Base WHERE RN IN (2, 5)
Go

	WITH Base AS 
	(
    SELECT *, ROW_NUMBER() OVER (ORDER BY Employee.BusinessEntityID) RN FROM HumanResources.Employee as Employee
	)
	SELECT *
    FROM Base WHERE RN BETWEEN 100 and 200
	Go

--SELECT OrderingColumn 
--FROM (
--    SELECT OrderingColumn, ROW_NUMBER() OVER (ORDER BY OrderingColumn) AS RowNum
--    FROM MyTable
--) AS MyDerivedTable
--WHERE MyDerivedTable.RowNum BETWEEN @startRow and @endRow
Go
--Type2:
SELECT  *
FROM     HumanResources.Employee 
ORDER BY HumanResources.Employee.BusinessEntityID ASC 
OFFSET  0 ROWS 
FETCH NEXT 5 ROWS ONLY 
Go