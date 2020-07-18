--Type 1: not recommend
SELECT * INTO #temptable FROM Cars
UPDATE #temptable SET Latitude=Latitude+100
select * from #temptable
--*****************************************
--Type 2: use Table type [use in functions & stored procedures]
DECLARE @tempTable TABLE
(
   [ProductID] [int] NOT NULL,
   [ProductName] [nvarchar](40) NOT NULL,
   [UnitPrice] [money] NULL
)
  
INSERT INTO @tempTable
SELECT
   carid,
   make+' '+model,
   latitude
FROM cars

UPDATE @temptable SET [UnitPrice] = [UnitPrice] + 1000
select * from @tempTable
--***********************************************
--Type3:CTE(Common Table Expression)

--NonRecursive:

		--Simple CTE:
			--WITH CTE_Name [(Column1, Column2, ...)]
			--AS
			--(
			--    query
			--)
--***********************
			--WITH CTE_1 AS
			--(
			--   ....
			--),
			--CTE_2 AS
			--(
			--   SELECT  ... FROM CTE_1 JOIN ...
			--)
			--SELECT   * FROM FOO LEFTJOIN  CTE_1 LEFTJOIN  CTE_2

WITH temp
AS
(
    SELECT Make+' '+model as CarName,latitude FROM cars
)
SELECT * FROM temp
ORDER BY Latitude DESC
--*******************************************************
select customerref,fullname as 'Customer Name'
	from rentalorders left join Customers
		on RentalOrders.CustomerRef=Customers.CustomerID
		where customerref in(select customerref
							from RentalOrders left join cars 
								on RentalOrders.CarRef=Cars.CarID
							where make='opel')
	--CTE:
with tmp 
as
(
	select customerref
							from RentalOrders left join cars 
								on RentalOrders.CarRef=Cars.CarID
							where make='opel' 
)
select customerref,fullname as 'Customer Name'
	from tmp left join Customers
		on tmp.CustomerRef=Customers.CustomerID
--**********************************************************			
select  employeename,title as 'Employee Position',CustomerName
	from 
	(select fullname as 'CustomerName',RentalOrderID
			from rentalorders left join Customers
			on RentalOrders.CustomerRef=Customers.CustomerID
			where customerref in(select customerref
									from RentalOrders left join cars 
									on RentalOrders.CarRef=Cars.CarID
									where make='opel'))  k
	inner join
	(select firstname+' ' +lastname as employeename,title,RentalOrderID
	from RentalOrders left join Employees
	on RentalOrders.EmployeeRef=Employees.EmployeeID
	where Employeeref in (select EmployeeRef
							from RentalOrders left join cars 
								on RentalOrders.CarRef=Cars.CarID
								where make='opel'))  b

	on k.RentalOrderID=b.RentalOrderID
--*****************************************************************
--Multiple CTE:
WITH CarList
AS
(
   select make+' '+model as CarName,carid from cars
)
,
RentList
AS
(
   SELECT CarRef,Days from RentalOrders
)
SELECT CarName,Days 
	from CarList left join RentList
		on CarList.CarID=RentList.CarRef
--***********************************************
	--Generate 1 to 100
create table tblDigit(digit tinyint)
go
declare @x tinyint
set @x=0
while (@x<10)
begin
	insert into tblDigit values(@x)
	set @x=@x+1
end
go
select * from tblDigit
go
WITH digitList
AS
(
   SELECT [digit] from tblDigit
)
SELECT
   a.[digit] * 10 + b.[digit] + 1 AS [Digit]
FROM tblDigit AS a CROSS JOIN [digitList] AS b
go

