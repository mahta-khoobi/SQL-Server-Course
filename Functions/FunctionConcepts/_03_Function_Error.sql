--a USE database statement is not allowed in a procedure, function or trigger.
create function UseDataBase(@dbName varchar(50))
returns varchar(50) as
begin
use @dbName  --Compile Error
declare @Message varchar(50)
set @Message='fffff'
return @message
end