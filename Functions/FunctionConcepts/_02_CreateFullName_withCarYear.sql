use [SofiaCarRental_v2.2]
Go
create function CreateFullName(@Make varchar(50),@Model varchar(50),@CarYear smallint)
returns varchar(100) as
begin
declare @FullName varchar(100)
set @fullname=@Make+' '+@Model+' '+CAST(@CarYear as varchar(10))
return @Fullname
end
Go

Drop function CreateFullName
Go
--Use:
select dbo.CreateFullName(Cars.Make,Cars.Model,Cars.CarYear)
Go

--Sample:
select dbo.CreateFullName(Cars.Make,Cars.Model,Cars.CarYear),RentalOrders.Days
	from cars left join RentalOrders
	on Cars.CarID=RentalOrders.CarRef