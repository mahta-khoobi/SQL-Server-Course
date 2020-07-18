USE [WindowingFunctionsTest]

EXEC SYS.sp_cdc_enable_db

SELECT [name],is_cdc_enabled FROM SYS.databases

EXEC SYS.SP_CDC_ENABLE_TABLE  
@SOURCE_SCHEMA=N'DBO',
@SOURCE_NAME='Orders',
@ROLE_NAME=NULL

SELECT * FROM [cdc].[DBO_Orders_CT]