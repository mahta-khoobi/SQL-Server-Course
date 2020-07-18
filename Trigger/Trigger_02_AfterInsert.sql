

CREATE TABLE Employee
(
	ID INT primary key  Identity(1,1),
	Name Varchar(50),
	Salary Money 
)
Go
INSERT INTO Employee VALUES ('Mina',1000);
INSERT INTO Employee VALUES ('Rick',1200);
INSERT INTO Employee VALUES ('John',1100);
INSERT INTO Employee VALUES ('Stephen',1300);
INSERT INTO Employee VALUES ('Maria',1400);
Go
--Create Logestic Table for Audit the main Table(Employee):
CREATE TABLE Employee_Audit
(
ID int,
Name varchar(50),
Salary money ,
Audit_Action varchar(100),
Audit_Timestamp datetime
)
Go
--Create After Insert Trigger:
CREATE TRIGGER trgAfterInsert ON [dbo].[Employee] 
FOR INSERT
AS
	declare @id int;
	declare @name varchar(50);
	declare @salary money;
	declare @audit_action varchar(100);

	select @id=i.ID from inserted i;	
	select @name=i.Name from inserted i;	
	select @salary=i.Salary from inserted i;	
	set @audit_action='Inserted Record -- After Insert Trigger.';

	insert into Employee_Audit
           (ID,Name,Salary,Audit_Action,Audit_Timestamp) 
	values(@id,@name,@salary,@audit_action,getdate());

	PRINT 'AFTER INSERT trigger fired.'
GO
--Insert Data to Employee:
 insert into Employee values('Chris',1500);
 Go
 select * from Employee
 Go
 select * from Employee_Audit
 Go