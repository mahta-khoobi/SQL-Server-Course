--Type 1
create proc Insert_AutoCode(@FName varchar(50),@LName varchar(50),@Age int)
as
begin
	declare @Code int
	if (select max(code) from person) <> null
		begin
			set @Code=(Select max(code) from person)
		end
	else
		begin
			set @Code=0
		end
	set @Code =@Code+1
	insert into person 
		values(@code,@fname,@lname,@age)

end
Go
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
--Type 2
create proc Insert_AutoCode_2(@FName varchar(50),@LName varchar(50),@Age int)
as
begin
	declare @Code int
	set @code=(select max(code) from person)
	set @Code = isnull(@code,0)+1
	insert into person 
		values(@code,@fname,@lname,@age)

end

Go
exec Insert_AutoCode 'Alimohammad','Bahmanyar',20
exec Insert_AutoCode_2 'Fatemeh','Masomifar',20
select * from person
				
