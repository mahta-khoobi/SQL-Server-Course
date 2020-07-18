use [SofiaCarRental_v2.2]
Go
create function GetCars(@CustomerName varchar(80))
returns @ShowTable Table(CustomerName varChar(80),CarFullName varchar(100))						 
as
begin

IF( @CustomerName in (select customers.FullName from Customers) )
	BEGIN
	 insert into @showTable(CustomerName,CarFullName)
			select Q1.Customer_FullName,isnull(Q2.Car_FullName,'<< No Rent >>')
			from
				(select Customers.FullName as Customer_FullName,RentalOrders.RentalOrderID
					from Customers left join RentalOrders
					on Customers.CustomerID=RentalOrders.CustomerRef)Q1
			left join 
				(select cars.Make+' '+cars.Model as Car_FullName,RentalOrders.RentalOrderID
					from cars inner join RentalOrders
					on cars.CarID=RentalOrders.CarRef)Q2
			on Q1.RentalOrderID=Q2.RentalOrderID
			where Q1.Customer_FullName like @CustomerName
		 
	
	END
Else
	begin
	insert into @showTable(CustomerName,CarFullName)
		values(@CustomerName,'<< Not Valid Name>>')
		
	end
return
end
Go
drop function dbo.GetCars
Go
select * from dbo.GetCars('John Wattson')
Go
select * from dbo.GetCars('John')



