Create Database Commercial
Go
Use Commercial
GO
Create Table OrderMaster(
Id int primary key identity (1,1),
Code int,
ProductName nvarchar(50),
UnitPrice money,
Amount smallmoney,
Price as UnitPrice*Amount
)
Go
Insert into OrderMaster(Code,ProductName,UnitPrice,Amount)
values(10,'Note5',2000000,2),
(11,'Nokia',1000000,2),
(12,'Macbook',20000000,3),
(13,'Samsung',500000,4),
(14,'Note6',100000,3),
(15,'Nexus',2000000,2),
(16,'Sony',10000000,2),
(17,'Nvidia',60000,2),
(18,'iphone',18000000,3),
(19,'N5',69000000,1)

select * from OrderMaster

select ProductName
from OrderMaster 
where Amount>2.00

select ProductName,Price
from OrderMaster
where ProductName like 'n%'

select *
from OrderMaster
where UnitPrice<2000000 and Amount>3

select ProductName,Price
from OrderMaster
where ProductName like '__t%[0123456789]'