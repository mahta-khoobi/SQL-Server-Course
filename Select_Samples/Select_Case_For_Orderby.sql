use AdventureWorks2012
Go
SELECT p.ProductID,p.Name,p.Color
FROM Production.Product AS p
--WHERE p.Color IS NOT NULL
ORDER BY CASE p.Color
WHEN 'Red' THEN NULL
ELSE p.Color
END;
Go
use [SofiaCarRental_v2.2]
Go
select cars.make+Cars.model as FullName,cars.CarYear
from cars
order by Cars.CarYear
Go
--We need 2006 first and after that null and after that etc...
select cars.make+Cars.model as FullName,cars.CarYear
from cars
order by case cars.CarYear
			when 2006 
			then null
			else cars.CarYear
			end;
Go
--the fact that SQL Server sorts nulls first.
--change the 2 and 3 with null and see the effect of null
select cars.make+Cars.model as FullName,cars.CarYear
from cars
order by case cars.CarYear
			when 2006 then null 
			when 2008 then 2
			when 2010 then 3
			else cars.CarYear
			end;