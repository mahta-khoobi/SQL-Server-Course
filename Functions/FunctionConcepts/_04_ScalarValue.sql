--Syntax:
--Create Function Fn_Name (Parameters)
--Returns DataType As
--Begin
--…
--…
--Return Value
--End
Go
--Multiply:
Create Function Multiply(@a int, @b int)
returns int as
begin
Declare @C int
set @C = @a * @b
return @C
end
--use:
select dbo.Multiply(4,6)
Go
Declare @T int
set @T = dbo.Multiply(15,16)
print @T
Go
--Use in Query
create table test2(num1 int,num2 int)
	insert into test2 values(10,20)
	insert into test2 values(30,220)
	insert into test2 values(100,2)
	insert into test2 values(4,25)
	
select *,dbo.multiply(num1,num2)
 from test2
Go

Create Function dbo.CountTable(@Name varchar(50))
returns int as
begin
Declare @C int
set @C = (select count(*) from @Name)
return @C
end
Go
Create function dbo.CountTable(@Name varchar(50))
returns int as
begin
Declare @C int
set @C = 100
return @C
end
Go

create function test2222(@A varchar(50))
returns varchar as
begin
return @A
end
Go
create function CountDay(@Make varchar(50))
returns int as
begin
declare @Days int
set @days=(select sum(days) from RentalOrders left join cars on RentalOrders.CarRef=Cars.CarID where make=@make)
return @days
end
Go
select dbo.countday('volvo')