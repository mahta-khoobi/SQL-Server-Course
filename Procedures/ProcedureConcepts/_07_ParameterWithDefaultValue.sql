create proc WithOutput2(@num1 int=10,@num2 int=12,@result int output)
as
begin
set @result=@num1*@num2
end

declare @ResultShow int
exec WithOutput2 default,10,@ResultShow output
print @ResultShow

declare @ResultShow int
exec WithOutput2 default,default,@resultshow output
print @ResultShow