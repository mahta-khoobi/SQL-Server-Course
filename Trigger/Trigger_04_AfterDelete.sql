use [SofiaCarRental_v2.2]
CREATE TRIGGER trgAfterDelete ON [dbo].[Employee] 
AFTER DELETE
AS
	declare @id int;
	declare @name varchar(50);
	declare @salary money;
	declare @audit_action varchar(100);

	select @id=d.ID from deleted d;	
	select @name=d.Name from deleted d;	
	select @salary=d.Salary from deleted d;	
	set @audit_action='Deleted -- After Delete Trigger.';

	insert into Employee_Audit(ID,Name,Salary,Audit_Action,Audit_Timestamp) 
	values(@id,@name,@salary,@audit_action,getdate());

	PRINT 'AFTER DELETE TRIGGER fired.'
GO

select * from employee_audit