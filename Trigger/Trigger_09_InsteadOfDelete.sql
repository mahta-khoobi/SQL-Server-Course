--We do not delete ,only change the Status field value:
Create Trigger TempDelete on Test03
Instead of Delete
as
Begin
	Update Table_Name
		Set Status = 1
	From Test03 Inner Join (Select * From Deleted)D 
	on test03.ID = k.ID
End