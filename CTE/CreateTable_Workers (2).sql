CREATE TABLE dbo.Employees
(
  EmployeeID intNOTNULLPRIMARYKEY,
  FirstName varchar(50)NOTNULL,
  LastName varchar(50)NOTNULL,
  ManagerID intNULL
)

GO


INSERTINTO Employees VALUES (101,'Alireza','Nematollahi',NULL)
INSERTINTO Employees VALUES (102,'Ahmad','Mofarrahzadeh', 101)
INSERTINTO Employees VALUES (103,'Mohammad','BozorgGhommi', 102)
INSERTINTO Employees VALUES (104,'Masoud','Narimani', 103)
INSERTINTO Employees VALUES (105,'Mohsen','Hashemi', 103)
INSERTINTO Employees VALUES (106,'Aref','Partovi', 102)
INSERTINTO Employees VALUES (107,'Hosain','Mahmoudi', 106)
INSERTINTO Employees VALUES (108,'Naser','Pourali', 106)
INSERTINTO Employees VALUES (109,'Reza','Bagheri', 102)
INSERTINTO Employees VALUES (110,'Abbas','Najafian', 102)