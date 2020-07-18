alter proc Bulkinsert
as
begin
	while (select count(ID)from person)<300
	insert into person values('ali','ali','20')
end