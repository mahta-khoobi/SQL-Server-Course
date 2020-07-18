/*
These can be used as an interceptor for anything that anyone tried to do on our table or view.
 If you define an Instead Of trigger on a table for the Delete operation, they try to delete rows,
  and they will not actually get deleted (unless you issue another delete instruction from within the trigger)

INSTEAD OF TRIGGERS can be classified further into three types as:

INSTEAD OF INSERT Trigger.
INSTEAD OF UPDATE Trigger.
INSTEAD OF DELETE Trigger.
*/
CREATE TRIGGER trgInsteadOfDelete ON [dbo].[Employee] 
INSTEAD OF DELETE
AS
	declare @id int;
	declare @name varchar(50);
	declare @salary money;
	
	select @id=d.ID from deleted d;
	select @name=d.Name from deleted d;
	select @salary=d.Salary from deleted d;

	BEGIN
		if(@salary>1200)
		begin
			RAISERROR('Cannot delete where salary > 1200',16,1);
			ROLLBACK;
		end
		else
		begin
			delete from Employee where ID=@id;
			COMMIT;
			insert into Employee_Audit(ID,Name,Salary,Audit_Action,Audit_Timestamp)
			values(@id,@name,@salary,'Deleted -- Instead Of Delete Trigger.',getdate());
			PRINT 'Record Deleted -- Instead Of Delete Trigger.'
		end
	END
GO



delete from Employee where ID=4

select * from Employee_audit