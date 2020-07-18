use [SofiaCarRental_v2.2]
go
--Type1:
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
Go
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
--Type2:
create proc Create_tblPerson
as
begin
	IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'person') AND type in (N'U'))
		begin
			create table person
				(	Id int primary key ,
					Code int not null,
					FName varchar(50),
					LName varchar(50),
					Age int
				)
		end
	else
		begin
			raiserror('Table  is Created before.',16,1)
		end
end
Go
exec Create_tblPerson

SELECT * FROM sys.objects
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
--Type 3 :
IF object_id('Person') is not null
    PRINT 'Present!'
ELSE
    PRINT 'Not accounted for'
--***************************
--type 4:
IF object_id('Person', 'U') is not null
    PRINT 'Present!'
ELSE
    PRINT 'Not accounted for'

--***************************
--type 5:use for tempTable
IF object_id('tempdb.dbo.#MyTable') is not null
    PRINT 'Present!'
ELSE
    PRINT 'Not accounted for'
--******************************
--type 6:
IF  NOT EXISTS (SELECT * FROM sys.tables WHERE name = N'person' AND type = 'U')
	PRINT 'Present!'
 ELSE
    PRINT 'Not accounted for'

select * from sys.tables 