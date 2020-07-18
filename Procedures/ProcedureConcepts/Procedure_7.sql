create proc Test_Table
as
begin
if 'test' not in (select name from sys.objects)
begin
create table test(Test nvarchar(50))
end
else 
begin
raiserror('Nadarim',16,1)
end
end