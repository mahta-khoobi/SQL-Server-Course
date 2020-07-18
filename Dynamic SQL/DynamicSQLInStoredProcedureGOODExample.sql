alter Procedure usp_SearchEmployeesGoodDynamicSQL	
@FirstName nvarchar(100) = NULL,
@LastName nvarchar(100) = NULL,
@Gender nvarchar(50) = NULL,
@Salary int = NULL
As
Begin

     Declare @sql nvarchar(max)
	 
     Set @sql = 'Select * from Employees where 1 = 1'
   
     if(@FirstName is not null)
          Set @sql = @sql + 'and FirstName=@FN'
     if(@LastName is not null)
          Set @sql = @sql + ' and LastName=@LN'
     if(@Gender is not null)
          Set @sql = @sql + ' and Gender=@Gen'
     if(@Salary is not null)
          Set @sql = @sql + ' and Salary=@Sal'

      Execute sp_executesql @sql,
     N'@FN nvarchar(50), @LN nvarchar(50), @Gen nvarchar(50), @sal int',
     @FN=@FirstName, @LN=@LastName, @Gen=@Gender, @Sal=@Salary
	                
End
Go