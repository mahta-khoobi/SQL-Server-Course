use [SofiaCarRental_v2.2]
Go
CREATE TRIGGER trgAfterUpdate ON [dbo].[Employee] 
FOR UPDATE
AS
	declare @id int;
	declare @name varchar(50);
	declare @salary money;
	declare @audit_action varchar(100);

	select @id=i.ID from inserted i;	
	select @name=i.Name from inserted i;	
	select @salary=i.Salary from inserted i;	
	
	if update(Name)
		set @audit_action='Updated Record -- After Update Trigger.';
	if update(Salary)
		set @audit_action='Updated Record -- After Update Trigger.';

	insert into Employee_Audit(ID,Name,Salary,Audit_Action,Audit_Timestamp) 
	values(@id,@name,@salary,@audit_action,getdate());

	PRINT 'AFTER UPDATE Trigger fired.'
GO

update Employee set Salary=1550 where ID=6
Go
select * from employee
select * from employee_Audit