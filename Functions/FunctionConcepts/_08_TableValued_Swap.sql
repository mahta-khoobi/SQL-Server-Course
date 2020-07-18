

--********************[ - Swap - ]*******************************
create function Swap(@Num1 int,@num2 int)
returns @ShowTable Table(
	num1 int ,
	num2 int)as
begin 
	declare @C int
	set @c=@Num1
	set @Num1=@num2
	set @num2=@c
	insert into @ShowTable(num1,num2)
	values (@Num1,@num2)
	return
end

Go

create function Swap2(@num1 int,@num2 int)
	returns @ShowTable Table(num1 int,num2 int) as
begin
	insert into @ShowTable(num1,num2)
		values(@num2,@num1)
	return
end

Go
select * from swap(12,15)
select * from Swap2(12,15)
--*********************************************************************************


DECLARE @dates 
   TABLE (
      DateValue date NOT NULL
   );