Create Proc TestIns(@Code int OutPut,@Name varchar(50),@ErrNo int outPut)
as
Begin
DECLARE @NCode int
Begin Try
Set Tran Isolation Level Serializable
Begin Tran
SET @NCode = (Select MAX(Code) FROM Test)
Set @NCode = ISNULL(@NCode,0) + 1
Insert into Test Values (@NCode,@Name)
Commit Tran
Set @ErrNo = 0
End Try
Begin Catch
Rollback Tran
Set @ErrNo = ERROR_NUMBER()
End Catch
Set Tran Isolation Level read committed
End
Go