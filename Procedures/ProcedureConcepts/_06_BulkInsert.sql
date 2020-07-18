create proc BulkInsert2
as
begin
declare @x int
set @x=2000
while @x>=0
	begin
		insert into test1200(code,name)
			values(@x,'ali mohammad Bahmanyar')
		set @x =@x-10
	end
end

exec BulkInsert2

select * from test1200