create proc WithOutput(@num1 int,@num2 int,@result int output)
as
begin
set @result=@num1*@num2
end

declare @ResultShow int
exec WithOutput 12,10,@ResultShow output
print @ResultShow