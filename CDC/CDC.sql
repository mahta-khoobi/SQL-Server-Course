create database Practice_CDC
GO
use Practice_CDC
GO
Create table Test 
(
Id int primary key identity(1,1),
FirstName nvarchar(30)
)
GO
Exec SYS.sp_cdc_enable_table
@SOURCE_SCHEMA = N'DBO',
@SOURCE_NAME = 'Orders',
@ROLE_NAME =null