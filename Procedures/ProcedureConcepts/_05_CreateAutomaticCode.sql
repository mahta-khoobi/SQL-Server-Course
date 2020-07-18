Create Procedure TestIns(@Code int output,@Name Varchar(50),@ErrorNo int output)
as
begin
Declare @NCode int
Set @NCode = (Select MAX(Code) From Test)
Set @NCode = ISNULL(@NCode,0)+1
Insert into Test Values(@NCode,@Name)
end