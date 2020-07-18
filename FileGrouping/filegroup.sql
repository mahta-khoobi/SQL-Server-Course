create database Store
Go
use Store
Go
alter database Store
add filegroup fg_before_2009
go
alter database Store
add filegroup fg_2009
go
alter database Store
add filegroup fg_2010
go
alter database Store
add filegroup fg_after_2010
go

select * from sys.filegroups

alter database Store 
add file
(
Name='Datafile1',
filename='D:\C#_SQL_MFT\SQL\Session9\Datafile1.NDF'
)to filegroup fg_before_2009
GO
alter database Store 
add file
(
Name='Datafile2',
filename='D:\C#_SQL_MFT\SQL\Session9\Datafile2'
)to filegroup fg_2009
GO
alter database Store 
add file
(
Name='Datafile3',
filename='D:\C#_SQL_MFT\SQL\Session9\Datafile3'
)to filegroup fg_2010
GO
alter database Store 
add file
(
Name='Datafile4',
filename='D:\C#_SQL_MFT\SQL\Session9\Datafile4'
)to filegroup fg_after_2010
GO
exec sp_helpfile
GO
select name from sys.database_files
GO
Create partition function pf_name(int)
as range left for values 
(2009,2010,2011)
GO
create partition schema ps_name
as partition pf_name 
to (fg_before_2009,fg_2009,fg_2010,fg_after_2010)
GO
create table Sale (yearSale int , qty int )
on ps_name(yearSale)
GO
insert into Sale(2010,2)
insert into Sale(2011,2)
insert into Sale(2009,2)
insert into Sale(2008,2)


