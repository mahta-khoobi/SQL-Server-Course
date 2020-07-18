use test
go
create function CreateFullName (@FirstName varchar(50),@SurName varchar(50))
returns varchar(100) as
begin
declare @FullName varchar(100)
set @fullname=@firstname+' '+@surname
return @Fullname
end

select dbo.CreateFullName('Ali Mohammad','Bahmanyar')