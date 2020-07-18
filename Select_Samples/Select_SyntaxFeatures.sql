use AdventureWorks2012
Go
--Syntax:
--SELECT select_list
	--[ INTO new_table_name ]
		--FROM table_list
	--[ WHERE search_conditions ]
	--[ GROUP BY group_by_list ]
	--[ HAVING search_conditions ]
	--[ ORDER BY order_list [ ASC | DESC ] ]
Go
-- * :
--Select * 
--from Purchasing.ShipMethod
Go
-- as :
--Select Name as FirstName,SurName from Test
Go 
--Where:
--use [SofiaCarRental_v2.2]
--Go
--select make,abs,asr 
--	from cars
--	where abs>0 and asr>0 and make between 'Bmw' and 'Lincoln'
--	Go
--SELECT * 
--from cars where make like '[^fc]%'
--Go
--SELECT *
-- from cars where make like'f%'
--Go
--SELECT * 
--from cars where make like'opel'
--Go
--SELECT * 
--from cars where make NOT  like'opel'
--Go
--select * from Employees 
--		where FirstName like '[a-z][a-z][a-z][a-z][a-z]'
--select * from test100
--where Code>15
--Go
--select * from titles
--where	type = 'Business'
--	and price<15
--Go
--select * from Titles
--	 where Price is null
--Go
 --select * from Titles
	--where Price between 10 and 15
--Go
-- select * from Titles
	--where title like '%the%'
--Go
--select * from Titles 
	--where title like 'the%'
--Go
 --select * from Titles 
		--where title like '_e%'
--Go
 --select * from Titles 
		--where title like '[]e%'
Go
--Like:
---- ASCII pattern matching with char column
--CREATE TABLE t (col1 char(30));
--INSERT INTO t VALUES ('Robert King');
--Go
--SELECT * 
--FROM t 
--WHERE col1 LIKE '% King';   -- returns 1 row
--Go
---- Unicode pattern matching with nchar column
--CREATE TABLE t (col1 nchar(30));
--INSERT INTO t VALUES ('Robert King');
--Go
--SELECT * 
--FROM t 
--WHERE col1 LIKE '% King';   -- no rows returned
--Go
---- Unicode pattern matching with nchar column and RTRIM
--CREATE TABLE t (col1 nchar (30));
--INSERT INTO t VALUES ('Robert King');
--Go
--SELECT * 
--FROM t 
--WHERE RTRIM(col1) LIKE '% King';   -- returns 1 row
--Go
--USE AdventureWorks2012;
--GO
--SELECT Name
--FROM sys.system_views
--WHERE Name LIKE 'dm%';
--GO
--USE AdventureWorks2012;
--GO
--SELECT p.FirstName, p.LastName, ph.PhoneNumber
--FROM Person.PersonPhone AS ph
--INNER JOIN Person.Person AS p
--ON ph.BusinessEntityID = p.BusinessEntityID
--WHERE ph.PhoneNumber LIKE '415%'
--ORDER by p.LastName;
--GO
--USE AdventureWorks2012;
--GO
--SELECT p.FirstName, p.LastName, ph.PhoneNumber
--FROM Person.PersonPhone AS ph
--INNER JOIN Person.Person AS p
--ON ph.BusinessEntityID = p.BusinessEntityID
--WHERE ph.PhoneNumber NOT LIKE '415%' AND p.FirstName = 'Gail'
--ORDER BY p.LastName;
--GO
---- Using the ESCAPE clause
----The following example uses the ESCAPE clause and 
----the escape character to find the exact character string 10-15% in column c1 of the mytbl2 table.
--USE tempdb;
--GO
--IF EXISTS(SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES
--      WHERE TABLE_NAME = 'mytbl2')
--   DROP TABLE mytbl2;
--GO
--USE tempdb;
--GO
--CREATE TABLE mytbl2
--(
-- c1 sysname
--);
--GO
--INSERT mytbl2 VALUES ('Discount is 10-15% off'), ('Discount is .10-.15 off');
--GO
--SELECT c1 
--FROM mytbl2
--WHERE c1 LIKE '%10-15!% off%' ESCAPE '!';
--GO
----Using the [ ] wildcard characters
----The following example finds employees on the Person table with the first name of Cheryl or Sheryl.
--USE AdventureWorks2012;
--GO
--SELECT BusinessEntityID, FirstName, LastName 
--FROM Person.Person 
--WHERE FirstName LIKE '[CS]heryl';
--GO
--USE AdventureWorks2012;
--GO
--SELECT LastName, FirstName
--FROM Person.Person
--WHERE LastName LIKE 'Zh[ae]ng'
--ORDER BY LastName ASC, FirstName ASC;
Go
--Group by:
--select t1.JobTitle,Sum(t1.VacationHours) as TotalVacation
--from HumanResources.Employee as t1
--Group by t1.JobTitle
Go
--Order by:
--select * from cars 
--		order by CategoryID desc , caryear
--Go
 --select * from Titles order by Price desc
--Go
--select * from Titles order by Type,Price desc
--Go
--select * from Titles order by Price desc
--Go
--select * from Titles order by Type,Price desc
--Go
--select * from Titles order by 3
Go
--Aggregate Function:
--Sum()
--Count
--Min()
--Max()
--Avg()
--...
--Go
--select t1.JobTitle,Sum(t1.VacationHours) as TotalVacation
--from HumanResources.Employee as t1
--Group by t1.JobTitle
Go
--Having:
--select t1.JobTitle,Sum(t1.VacationHours) as TotalVacation
--from HumanResources.Employee as t1
--Group by t1.JobTitle
--having Sum(t1.VacationHours)>100
Go
-- in , not in:
--use [SofiaCarRental_v2.2]
--Go
--select * from cars 
--	where make in ('opel','honda')
--Go
--select * from cars 
--	where make in ('opel','honda') and model in ('corsa','accord')
--Go
--select * from cars 
--	where make not in ('opel','honda','audi','volvo')
--Go
--select * from cars
--	where CarYear in (select CarYear from cars
--							where make='hyundai' and model='i30')
--Go
--select * from cars 
--	where CarID not in (select carref from RentalOrders)
Go
-- Exist , not Exist:
--select * from cars
--	where  exists( select * from cars where make='hyundai' and model='i30')
--Go
--select * from cars 
--	where not exists (select 1 from RentalOrders)
Go
--Distinct:
--select distinct parentcode,parentname,childcode,childname 
--	from parent inner join child
--		on parent.parentid=child.parentref
--Go
--insert into cars (make,model,TagNumber)
--values	('Bently','SuperLux',10),
--		('Alfaromeo','147',120),
--		('Bently','SuperLux',20),
--		('Alfaromeo','147',220)
--Go
--select make,model,TagNumber from Cars order by make
--select distinct make,model,TagNumber from Cars order by make
--select distinct make,model from cars order by make
--Go
--select * from cars
--Select count(Make) from cars
--select count(distinct make) from cars
--Go
----Aggregates do not calculate Null:
--insert into cars (make,model,TagNumber)
--values	(Null,'SuperLux','10t')
--Select count(Make) from cars
--select count(*) from cars
Go
--IsNull():
--select t1.JobTitle,isnull(Sum(t1.VacationHours),0) as TotalVacation
--from HumanResources.Employee as t1
--Group by t1.JobTitle
Go
--Between:

Go 
--RowNumber, Rank:
----select *,ROW_NUMBER() over (order by zipcode ) as 'row' from Customers
--select * from cars

--select make,model,ROW_NUMBER() over(partition by (make)order by make) as row
--FROM CARS
--go
--SELECT MAKE,MODEL,RANK() OVER(ORDER BY LATITUDE) AS 'RANK'
--	FROM CARS
--go
--SELECT MAKE,MODEL,DENSE_RANK() OVER(ORDER BY LATITUDE) AS 'DENSE_RANK'
--	FROM CARS
--go
--SELECT MAKE,MODEL,DENSE_RANK() OVER(ORDER BY LATITUDE) AS 'DENSE_RANK'
--	FROM CARS
--	WHERE MAKE LIKE 'TOYOTA'
Go
--Union all,Union,Intersect,except:
----Number of Fields must be the same
----DataTypes must be castable
----=========================================
----Create & Insert Data in test_110
--create Table Test_110(code int,FName varchar(50),LName varchar(50))
--go
--insert into Test_110
--values(1,'Ali Mohammad','Bahmanyar'),
--	  (2,'Fatemeh','MasoumiFar'),
--	  (3,'samira','Esmi')
--go
----Create & Insert Data in test_120
--create Table Test_120(code int,FName varchar(50),LName varchar(50))
--go
--insert into Test_120
--values(1,'Ali Mohammad','Bahmanyar'),
--	  (2,'Ali','Lotfi'),
--	  (3,'Matin','Asadi')
--go
----=============================
--select * from Test_110
--select * from Test_120
----union all 
--select * from Test_110 
--union all 
--select * from Test_120 
--go
----union
--select * from Test_110 
--union  
--select * from Test_120 
--go
----intersect
--select * from Test_110 
--intersect 
--select * from Test_120 
--go
----Except
--select * from Test_110 
--Except 
--select * from Test_120 
--Go
--select * from cars

--select make,model	from cars where Mp3Player>0

--select make ,model from cars where DVDPlayer>0

--select make,model	from cars where Mp3Player>0
--union
--select make ,model from cars where DVDPlayer>0

--select make,model	from cars where Mp3Player>0
--union all
--select make ,model from cars where DVDPlayer>0

--select make,model	from cars where Mp3Player>0
--intersect
--select make ,model from cars where DVDPlayer>0
--Go
--select make,model	from cars where Mp3Player>0
--except
--select make ,model from cars where DVDPlayer>0
Go
--With Qube,With RollUp:
--create table tbl_Sample(Laptop varchar(50),Model varchar(50),Amount int);
--Go
--insert into tbl_Sample values('Sony','FXzh',1000)
--insert into tbl_Sample values('Sony','X220',2000)
--insert into tbl_Sample values('Sony','1234',100)
--insert into tbl_Sample values('Sony','FXzh',200)
--insert into tbl_Sample values('Asus','1234',1000)
--insert into tbl_Sample values('Asus','1234',2000)
--insert into tbl_Sample values('Asus','X220',100)
--insert into tbl_Sample values('Asus','X220',200)
--Go
--select * from tbl_Sample
--Go
--select Laptop,Model,Sum(Amount)
--from tbl_Sample
--group by Laptop,Model
--Go
--select Laptop,Model,Sum(Amount)
--from tbl_Sample
--group by Laptop,Model with Cube
--Go
--select Laptop,Model,Sum(Amount)
--from tbl_Sample
--group by Model,Laptop with Cube
--Go
--select Laptop,Model,Sum(Amount)
--from tbl_Sample
--group by Laptop,Model with Rollup
--Go
--select Laptop,Model,Sum(Amount)
--from tbl_Sample
--group by Model,Laptop with Rollup
Go
--Case:
----Type1:
----Case Field When Value1 Then Exp1
----			 When Value2 Then Exp2
----.....
----			[Else Exp_n]
----End
--Go
----Type2:
----Case When Condition1 Then Exp1
----	   When Condition2 Then Exp2
----.....
----		[Else Exp_n]
----End
--Go
--select make,model,
--	case make when 'opel' then 'OpelGermany'
--			  when 'Honda' then 'HondaJapan'
--			  else 'other'
--	 end as newmake
--from cars
--Go
--select make+' '+model as FullName,Mp3Player,latitude,
--		case mp3player when 1 then latitude+10
--					   when 0 then latitude-10
--					   Else 0 
--		End as NewLatitude
--from cars
--Go
--select carref,days,case when days<5 then 100
--						when days=5 then 1500
--						when days>5 and Days<20 then 5000
--						when days>=20 then 100000
--						else 0 
--					end as Price
--		from RentalOrders
--Go
--select Mileagestart,mileageend,mileageend-mileagestart as result
--from RentalOrders
--Go
--select Mileagestart,mileageend,mileageend-mileagestart as result,Days,case  when mileageend-mileagestart>5000 then days+10
--																			when mileageend-mileagestart>1000 then days+5
--																			when mileageend-mileagestart>500 then days+3
--																		    when mileageend-mileagestart>100 then days+2
--																	        else days
--																		end as NewDays 
--from RentalOrders
Go
--Top ,with ties :
--select * from cars
--Go
--select make,model from cars 
--	where CarYear=(select max(caryear) from cars)
--Go
----Select [Distinct] [Top n] [Percent]]
----from �
--select top 1 caryear from cars
--select top 3 caryear from cars order by make
--select top 5 percent caryear,make,model
--from cars
--order by make
--Go
--select top 1 caryear, make,model
--from cars
--order by make
--Go
--SELECT TOP 2 * FROM Cars;
--SELECT TOP 2 * FROM Customers;
--Go
----Select [Distinct] [Top n] [Percent] [With ties]
----from �
----Order by �

----select title
----from titles
----where price = (select MIN(price)from (select distinct top 5 price
----				from titles
----				order by price desc)K
----				)
--Go
--select top 1 with ties caryear , make,model
--from cars
--order by make
--Go
--select top 5 with ties caryear , make,model
--from cars
--order by make
--Go
--SELECT TOP 5 PERCENT * FROM Customers;
Go
--Select into:
--The SELECT INTO statement copies data from one table and inserts it into a new table.

--SELECT *
--	INTO newtable [IN externaldb]
--	FROM table1;

--SELECT column_name(s)
--INTO newtable [IN externaldb]
--FROM table1;

--SELECT CustomerName, ContactName
--INTO CustomersBackup2013
--FROM Customers;

--SELECT *
--	INTO CustomersBackup2013
--	FROM Customers
--	WHERE Country='Germany';

--SELECT Customers.CustomerName, Orders.OrderID
--	INTO CustomersOrderBackup2013
--	FROM Customers LEFT JOIN Orders
--	ON Customers.CustomerID=Orders.CustomerID;

--Go
--Create new table:
	--SELECT *
	--INTO newtable
	--FROM table1
	--WHERE 1=0;
Go