CREATE FUNCTION CheckRent(@Make varchar(50))
returns varchar(50) as
begin
declare @result varchar(50)
	IF( @make in (select make from Cars) )
		BEGIN
		declare @RentDays int
		set @RentDays=isnull((select sum(RentalOrders.Days) from cars left join RentalOrders on Cars.CarID=RentalOrders.CarRef where make=@Make),0)
		--set @result= cast(isnull(select sum(RentalOrders.Days) from cars left join RentalOrders on Cars.CarID=RentalOrders.CarRef where make=@Make,0) as varchar(50))
		set @result=cast(@RentDays as varchar(50))
		END
	else
		begin
		set @result= 'Invalid Value!Please enter a valid Make'
		end
return @result
end

select dbo.checkRent('ali')