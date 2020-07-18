Create database store
go
use store
go
alter database store
add filegroup before_2009
go 
alter database store
add filegroup FG_AFTER_2010
go
Create table PartitionTest
(
FinancialYear date,
Qty int
)
GO
SELECT * FROM SYS.filegroups
GO
EXEC sp_helpfilegroup
GO
ALTER DATABASE STORE 
ADD FILE(name='DFbefore_2009_1', filename='D:\storedatafiles\DFbefore_2009_1.ndf')to filegroup before_2009
go
ALTER DATABASE STORE 
ADD FILE(name='DF_FG_AFTER_2010_1', filename='D:\storedatafiles\DF_FG_AFTER_2010_1.ndf')to filegroup FG_AFTER_2010
GO
EXEC SP_HELPFILE
GO
CREATE PARTITION FUNCTION PF_FINANCIALYEAR (INT)
AS RANGE LEFT FOR VALUES (2009,2010,2011)
GO
CREATE PARTITION SCHEME PF_FINANCIALYEAR
AS PARTITION PF_FINANCIALYEAR
TO (BEFORE_2009,FG_2009,FG_2010,FG_AFTER_2010)
GO
Create table PartitionTest
(
FinancialYear INT,
Qty int
)ON PF_FINANCIALYEAR(fINANCIALYEAR)
GO
INSERT INTO PartitionTesT
VALUES(2007,145)
GO
