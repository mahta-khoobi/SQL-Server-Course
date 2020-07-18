CREATE Procedure usp_SearchEmployeesBadDynamicSQL	
@FirstName nvarchar(100) = NULL,
@LastName nvarchar(100) = NULL,
@Gender nvarchar(50) = NULL,
@Salary int = NULL
As
Begin

     Declare @sql nvarchar(max)

     Set @sql = 'Select * from Employees where 1 = 1'
         
     if(@FirstName is not null)
          Set @sql = @sql + ' and FirstName=''' + @FirstName + ''''
     if(@LastName is not null)
          Set @sql = @sql + ' and LastName=''' + @LastName + ''''
     if(@Gender is not null)
          Set @sql = @sql + ' and Gender=''' + @Gender + ''''
     if(@Salary is not null)
          Set @sql = @sql + ' and Salary=''' + @Salary + ''''

     Execute sp_executesql @sql
End
Go