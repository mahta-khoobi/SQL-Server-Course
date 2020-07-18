
--3+1.Statistical Functions:
-----PERCENT_RANK(), CUME_DIST(), PERCENTILE_DISC(), PERCENTILE_CONT()

--PERCENT_RANK and CUME_DIST provide a ranking for each row over a partition.
--PERCENT_RANK returns the percentage of rows that rank lower than the current row. 
--CUME_DIST, or cumulative distribution, returns the exact rank.
--CUME_DIST calculates the relative position of a specified value in a group of values. 
 
--e.g 1: Here is an example using the average high temperature in St. Louis for each month. 
CREATE TABLE #MonthlyTempsStl(MName varchar(15), AvgHighTempF INT, AvgHighTempC INT)
INSERT INTO #MonthlyTempsStl(MName, AvgHighTempF, AvgHighTempC)
VALUES('Jan',40,4),('Feb',45, 7),('Mar',56, 13),('Apr',67, 20),
	  ('May',76,25),('Jun',85,30),('Jul',89,32),('Aug',88,31),
	  ('Sep',80,27),('Oct',69,20),('Nov',56,13),('Dec',43,6);
SELECT MName, AvgHighTempF,AvgHighTempC, RANK() OVER(ORDER BY AvgHighTempF) AS Rank,
	PERCENT_RANK() OVER(ORDER BY AvgHighTempF)  AS PercentRank,
	CUME_DIST() OVER(ORDER BY AvgHighTempF)  AS CumeDist
FROM #MonthlyTempsStl;
GO
--The ranks are determined by the positions of the rows.
--PERCENT_RANK = (Rank -1)/(Row count -1)
--CUME_DIST = (Rank)/(Row count)
----------------------------------------------------
--e.g 2:
USE AdventureWorks2016;  
GO  
SELECT Department, LastName, Rate,   
       CUME_DIST () OVER (PARTITION BY Department ORDER BY Rate) AS CumeDist,   
       PERCENT_RANK() OVER (PARTITION BY Department ORDER BY Rate ) AS PctRank  
FROM HumanResources.vEmployeeDepartmentHistory AS edh  
    INNER JOIN HumanResources.EmployeePayHistory AS e    
    ON e.BusinessEntityID = edh.BusinessEntityID  
WHERE Department IN (N'Information Services',N'Document Control')   
ORDER BY Department, Rate DESC;

--The following example uses the CUME_DIST() function to compute the salary percentile for each employee within a given department. 
--CUME_DIST function represents the percent of employees that have a salary <= current employee in the same department.
-- The PERCENT_RANK function computes the rank of the employee's salary within a department as a percentage. 
--The PARTITION BY clause is specified to partition the rows in the result set by department. 
--The ORDER BY clause in the OVER clause orders the rows in each partition. 
--The ORDER BY clause in the SELECT statement sorts the rows in the whole result set.
--------------------------------------------------------------------------------------------------------------------------------------

--PERCENTILE_DISC() and PERCENTILE_CONT() work in the opposite way. 
--Given a percent rank, find the value at that rank. 
--They differ in that PERCENTILE_DISC() will return a value that exists in the set 
--while PERCENTILE_CONT() will calculate an exact value if none of the values in the set falls precisely at that rank. 
--You can use PERCENTILE_CONT() to calculate a median by supplying 0.5 as the percent rank. 
--For example, which temperature ranks at 50% in St. Louis
--e.g 1:
SELECT MName, AvgHighTempF,AvgHighTempC,
	RANK() OVER(ORDER BY AvgHighTempF) AS Rank,
	PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY AvgHighTempF) OVER() AS PercentileCont,
	PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY AvgHighTempF) OVER() AS PercentileDisc
FROM #MonthlyTempsStl;
GO
--these two functions have an extra clause WITHIN GROUP, that contains the ORDER BY instead of within the OVER clause.
-----------------------------------------------------------------------------------------------------
--e.g 2:
--The following example uses PERCENTILE_CONT and PERCENTILE_DISC to find the median employee salary in each department. 
--Note that these functions may not return the same value. 
--This is because PERCENTILE_CONT interpolates the appropriate value, whether or not it exists in the data set, 
--while PERCENTILE_DISC always returns an actual value from the set.

USE AdventureWorks2016;  
  
SELECT DISTINCT Name AS DepartmentName  
      ,PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ph.Rate)   
                            OVER (PARTITION BY Name) AS MedianCont  
      ,PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY ph.Rate)   
                            OVER (PARTITION BY Name) AS MedianDisc  
FROM HumanResources.Department AS d  
INNER JOIN HumanResources.EmployeeDepartmentHistory AS dh   
    ON dh.DepartmentID = d.DepartmentID  
INNER JOIN HumanResources.EmployeePayHistory AS ph  
    ON ph.BusinessEntityID = dh.BusinessEntityID  
WHERE dh.EndDate IS NULL; 