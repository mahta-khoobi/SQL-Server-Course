use test
go

--We Can not Pass the table as parameter to function

create function CountTable( table)
returns  int as
begin
declare @Count int
set @Count=select COUNT(*) from @tableName
return @count
end


--*****************************
CREATE TABLE [dbo].[Student]
(
            [StudentID] [int] NULL,
            [StudentName] [varchar](30) NULL,
            [StudentFees] [int] NULL
)

CREATE TYPE dbo.StudentType AS TABLE
(
   [StudentID] [int] ,
   [StudentName] [varchar](30) ,
   [StudentFees] [int] 
)

Create FUNCTION StudentDetailFunction( @StudentDetail dbo.StudentType READONLY )
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @Studentname VARCHAR(50)
    SELECT  @Studentname= StudentName FROM @StudentDetail
    RETURN @Studentname
END
