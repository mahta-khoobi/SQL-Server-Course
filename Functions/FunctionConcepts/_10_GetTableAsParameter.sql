CREATE TABLE Student_01
(
            StudentID int primary key not null identity(1,1),
            StudentFName varchar(50),
			StudentLName varchar(50),
            StudentFees int NULL)

insert into Student_01
	values('Ali Mohammad','Bahmanyar',100)
insert into Student_01
	values('Fatemeh','Masoumifar',200)
insert into Student_01
	values('Ali','Lotfi',300)
--*****************************************
--Create a new Type:
CREATE TYPE StudentType_01 AS TABLE
(
	StudentID int primary key not null identity(1,1),
    StudentFName varchar(50),
	StudentLName varchar(50),
    StudentFees int NULL)
--*****************************************
--Create Function:
Create FUNCTION StudentDetailFunction_01( @StudentDetail StudentType_01 READONLY )
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @Studentname VARCHAR(50)
    SELECT  @Studentname=StudentName FROM @StudentDetail
    RETURN @Studentname
END
--*****************************************
Create FUNCTION StudentDetailFunction_02( @StudentDetail StudentType_01 READONLY )
RETURNS table
AS
    return (select StudentFName,StudentLName,StudentFName+' '+StudentLName as 'Sudent fullname' from @StudentDetail)
--*****************************************

DECLARE @StudentVariable AS StudentType
INSERT INTO @StudentVariable(StudentName) VALUES('Bahmanyar')
SELECT dbo.StudentDetailFunction(@StudentVariable)