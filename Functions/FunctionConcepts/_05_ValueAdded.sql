use [SofiaCarRental_v2.2]
go

create function SetValueAdded(@Data money,@Percentage smallmoney)
returns money as
begin
	if @data is not null and @Percentage is not null
		begin
			declare @ValueAdded money
			set @ValueAdded=@data*(@Percentage/100)
			
		end
	else
		begin
			set @ValueAdded=0
			
		end
	return @valueAdded
end

select dbo.setvalueadded(50.21,20)
