declare @counter int
set @counter =1
while(@counter<=20)
begin 
print @counter 
set @counter +=1
end

---------------------
select Q1.CompanyName , Q1.ContactName , Q1.City, SUM(Q2.Quantity*Q2.UnitPrice-Q2.Discount) as TotalPrice
from 
(select p.ProductID , s.CompanyName , s.ContactName , s.City
from Suppliers s left join Products p
on s.SupplierID=p.SupplierID )Q1
left join
(select od.Quantity , od.UnitPrice , od.Discount , p.ProductID
from Products p inner join [Order Details] od
on p.ProductID = od.ProductID)Q2
on Q1.ProductID = Q2.ProductID
group by  Q1.CompanyName , Q1.ContactName , Q1.City

-----------------------

CREATE FUNCTION dbo.udf_GetFullName
(
    @CompanyName nvarchar(40),
	@City nvarchar (15),
	@ContactName nvarchar(30)


)
RETURNS nvarchar(100)
AS
BEGIN

    RETURN @CompanyName + ' ' + @City + ' ' + @ContactName

END

--------------------------------------------------

Alter FUNCTION dbo.udf_TotalPrice
(
    @Quantity smallint,
	@UnitPrice money,
	@Discount real
	
)
RETURNS money
AS
BEGIN

	declare @Sum money
	set @Sum=Sum(@Quantity*@UnitPrice-@Discount)
    RETURN @Sum

END

-----------------------------------------

select Q1.FullName ,Sum(Q2.Total) as TotalPrice
from 
(select p.ProductID ,dbo.udf_GetFullName(s.CompanyName ,s.City, s.ContactName ) as FullName
from Suppliers s left join Products p
on s.SupplierID=p.SupplierID )Q1
left join
(select dbo.udf_TotalPrice(od.Quantity,od.UnitPrice,od.Discount)as Total , p.ProductID
from Products p inner join [Order Details] od
on p.ProductID = od.ProductID
--group by p.ProductID 
)Q2
on Q1.ProductID = Q2.ProductID
group by Q1.FullName
------------------------------------

CREATE FUNCTION dbo.udf_TotalPrice
(
    @FullName nvarchar(100),
	@Total money
)
RETURNS 
AS
BEGIN

    RETURN @param1 + @param2

END

