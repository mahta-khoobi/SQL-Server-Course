use [SofiaCarRental_v2.2]
Go
--Concept:
--Trigger use Inserted & Deleted temp table in tempdb.
--Structure of Inserted & Deleted temp table ==> as same as table that Trigger is assigned to it


--After|Instead Of Insert ==> insert one copy of all inserted data in Inserted Table

--After|Instead Of Delete ==> insert one copy of all deleted data in Deleted Table

--After|Instead Of Update ==> 
--							1-insert one copy of all data in  Updated Fields before Update in Deleted Table
--							2-insert one copy of all data in  Updated Fields After Update in Inserted Table
Go
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
select @@VERSION
select @@SPID
select * from sys.sysprocesses
select * from sys.sysprocesses where spid = @@SPID
select DB_NAME(8) 
select DB_NAME(dbid),* from sys.sysprocesses
Go
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
create table Test03 (Id int primary key identity(1,1),Name Varchar(50))
--**
Insert into Test03 Values('Ali')
Insert into Test03 Values('Gelareh')
Insert into Test03 Values('Farhad')
Insert into Test03 Values('Mina')
select * from test03
Go
Create table Test03_Audit (
						Id int,	
						DeleteDate datetime,
						Name Varchar(50),
						Info1 Varchar(500),
						Info2 Varchar(500),
						Info3 Varchar(500),
						Info4 Varchar(500)
						)
Go
select * from Test03_Audit
Go
--~~~~~~~~~~~~~~~~~~ trigger ~~~~~~~~~~~~~~~~~~~~~~~~~~~
Create trigger Test03_DeleteAudit on Test03
For Delete
as
Begin
	Declare @Info1 Varchar(500)
	Declare @Info2 Varchar(500)
	Declare @Info3 Varchar(500)
	Declare @Info4 Varchar(500)
	Declare @Id int
	Declare @Name varchar(50)
	select
		@Info1 = hostname,
		@Info2 = loginame,
		@Info3 = nt_domain,
		@Info4 = Net_address
	from sys.sysprocesses
	where spid = @@Spid
	
		select @Id = d.Id from deleted d;
		select @Name = d.Name from deleted d
	
	Insert into Test03_Audit(Id,DeleteDate,Name,Info1,Info2,Info3,Info4)
	values(@id,GETDATE(),@Name,@Info1,@Info2,@Info3,@Info4)
end
Go
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
delete from Test03
Where ID = 2
Go
Select * from test03
select * from Test03_Audit
Go
drop trigger Test03_DeleteAudit 