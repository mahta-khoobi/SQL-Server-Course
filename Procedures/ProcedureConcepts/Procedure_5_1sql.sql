alter proc Conter
as
begin
declare @conters int
declare @conters1 int
set @conters1=(select count(code) from persons)

if(@conters1!=0)
Begin
set @conters=(select max(code) from persons)
set @conters=@conters+1
insert persons(id,[Fname],[Lname],[Age],[code]) values(1255,'dfsd','sdjjjfsd',22,@conters)
end
else 
Begin

insert persons(id,[Fname],[Lname],[Age],[code]) values(999,'dfsd','sdjjjfsd',22,1)
end
end
exec Conter