create proc Insert_WithoutDuplication(@FName varchar(50),@LName varchar(50),@Age int)
as
begin
	declare @Code int
	set @code=(select max(code) from person)
	set @Code = isnull(@code,0)+1
	if not exists(select * from person where lname=@LName)
		begin
			insert into person 
				values(@code,@fname,@lname,@age)
		end
	else
		begin
			raiserror('attention ====> Lname is inserted before ',16,1)
		end

end
exec Insert_WithoutDuplication 'ali mohammad','masomifar',20