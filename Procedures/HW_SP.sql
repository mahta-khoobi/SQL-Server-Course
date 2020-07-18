select @@version
--1
use Commercial
INSERT INTO dbo.Category
SELECT * FROM [MAHTA\SQLEXPRESS].[NORTHWND].[dbo].[Categories]
GO

--2
use NORTHWND
Go
--Join:
select s.CompanyName,p.ProductName
from Products p right join Suppliers s
on p.SupplierID =s.SupplierID
Go
--Function & CrossApply:

CREATE FUNCTION [dbo].Get_ProductInfo
(
    @SupplierId int
  
)
RETURNS TABLE AS RETURN
(
    SELECT p.ProductName from Products p where p.SupplierID=@SupplierId
)
Go
select s.CompanyName,p.ProductName
from Suppliers s cross apply [dbo].Get_ProductInfo(s.SupplierID) p

select s.CompanyName,p.ProductName
from Suppliers s outer apply [dbo].Get_ProductInfo(s.SupplierID) p

select s.CompanyName,p.ProductName
from Products p right join Suppliers s
on p.SupplierID =s.SupplierID

--3
use Commercial
create procedure dbo.usb_InsertToProducts(@Name nvarchar(50))
as
begin
	
	insert into Products
		values(@Name)

end

Go
exec  dbo.usb_InsertToProducts 'Mobile'
--4
