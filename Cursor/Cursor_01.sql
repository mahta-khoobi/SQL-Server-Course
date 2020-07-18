use [SofiaCarRental_v2.2]
/*
	DECLARE cursor_name CURSOR
	[ LOCAL | GLOBAL ]
	[ FORWARD_ONLY | SCROLL ]
	[ STATIC | KEYSET | DYNAMIC | FAST_FORWARD ]
	[ READ_ONLY | SCROLL_LOCKS | OPTIMISTIC ]
	[ TYPE_WARNING ]
	FOR select_statement
	[ FOR UPDATE [ OF column_name [ ,...n ] ] ]
*/
select * from cars
Go
Declare _cursor cursor for Select make,model From cars
Go
Open _cursor
Fetch Next From _cursor --Read First Record Afer openning the Cursor
Close _cursor
Deallocate _cursor
Go
--***********
--Fetch_Status =0 --Previos fecth was successful & Control the end of cursor
--********
Declare x cursor for Select make,model From cars
Go
declare @make nvarchar(50),@model nvarchar(50)
print 'Our Cars:'
print 'Make'+','+'Model'
Open x
Fetch Next From x into @make,@model
while @@FETCH_STATUS = 0
Begin
Print @make+' , '+@model
Fetch Next from x into @make,@model
End
Close x
Deallocate x
Go
--***************
--use in sp:
select * from cars
Go
create procedure sp_Changelatitude
as
begin
	declare x cursor for select make,model,latitude from cars
	declare @make nvarchar(50),@model nvarchar(50),@latitude float
	open x
	fetch next from x into @make,@model,@latitude
	while @@FETCH_STATUS=0
		begin
			if @latitude>48
				set @latitude =@latitude-( @latitude * 0.2)
			else
				set @latitude =@latitude-10
				update cars set latitude = @latitude Where Current of x
				--Where make=@make
	fetch next from x into @make,@model,@latitude
end
close x
deallocate x
end
Go
exec sp_Changelatitude
Go
select * from cars