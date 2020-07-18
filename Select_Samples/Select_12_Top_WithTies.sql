select * from cars

select make,model from cars 
	where CarYear=(select max(caryear) from cars)
--**********************************************************

--Select [Distinct] [Top n] [Percent]]
--from …
select top 1 caryear from cars
select top 3 caryear from cars order by make
select top 5 percent caryear,make,model
from cars
order by make

select top 1 caryear, make,model
from cars
order by make
SELECT TOP 2 * FROM Cars;
SELECT TOP 2 * FROM Customers;
--**********************************************************

--Select [Distinct] [Top n] [Percent] [With ties]
--from …
--Order by …

--select title
--from titles
--where price = (select MIN(price)from (select distinct top 5 price
--				from titles
--				order by price desc)K
--				)

select top 1 with ties caryear , make,model
from cars
order by make

select top 5 with ties caryear , make,model
from cars
order by make

SELECT TOP 5 PERCENT * FROM Customers;