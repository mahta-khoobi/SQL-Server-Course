create database DynamicSql
go
--Static SQL:
Create table Employees
(
     ID int primary key identity(1,1),
     FirstName nvarchar(50),
     LastName nvarchar(50),
     Gender nvarchar(50),
     Salary int
)
Go

Insert into Employees values ('Mark', 'Hastings', 'Male', 60000)
Insert into Employees values ('Steve', 'Pound', 'Male', 45000)
Insert into Employees values ('Ben', 'Hoskins', 'Male', 70000)
Insert into Employees values ('Philip', 'Hastings', 'Male', 45000)
Insert into Employees values ('Mary', 'Lambeth', 'Female', 30000)
Insert into Employees values ('Valarie', 'Vikings', 'Female', 35000)
Insert into Employees values ('John', 'Stanmore', 'Male', 80000)
Go

Create Procedure usp_SearchEmployees
@FirstName nvarchar(100) ,
@LastName nvarchar(100),
@Gender nvarchar(50),
@Salary int
As
Begin

     Select * from Employees where
     (FirstName = @FirstName OR @FirstName IS NULL) AND
     (LastName  = @LastName  OR @LastName  IS NULL) AND
     (Gender      = @Gender    OR @Gender    IS NULL) AND
     (Salary      = @Salary    OR @Salary    IS NULL)
End
Go
--Usage Of Our Search StoredProcedure:
Select * from Employees
exec usp_SearchEmployees 'Mark','hastings',Null,Null

--DynamicSQl:
--Dynamic SQL is a SQL built from Strings at RunTime!
--the SP we used above is not very complicated as we have only 4 Search filters but what if there are 20 or even more!
-- or What if we want to specify Conditions like OR ,AND, ETC .... between these Search Filters!
--Our Stored Procedure can Get Extremely Large ,Complicated and dificult to MainTain 
--So One way to reduce Complexity is by Using "DYNAMIC SQL"
--Search with Dynamic SQL:
--Remember That Dynamic SQL is formed From Strings!

--set @sql= N'Select * from Employees'
--exec sp_executesql @sql
--e size of the string is limited only by available database server memory.
-- On 64-bit servers, the size of the string is limited to 2 GB, the maximum size of nvarchar(max).
declare @sql nvarchar (1000)
Declare @params nvarchar(1000)
Set @sql = 'Select * from Employees '+ 'where FirstName=@FirstName and LastName=@LastName and Gender=@Gender'
Set @params = '@FirstName nvarchar(100), @LastName nvarchar(100),@Gender nvarchar(100)'
--print @sql
Execute sp_executesql @sql, @params, @FirstName='Mark',@LastName='Hastings',@Gender='Male'
 select * from Employees


 --Two Ways to Exec Dynamic SQL:
 --1:
 exec ('select * from employees')
 --2:
 -- use "N" to make our Code Unicode
   exec sp_executeSQl N'select * from employees'



