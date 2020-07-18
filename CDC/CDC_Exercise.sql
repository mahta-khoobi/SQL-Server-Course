Create database Practice_CDC
Go
Use Practice_CDC
Go
Create table Test
(
Id int primary key identity(1,1),
FirstName nvarchar(30),
Age int
)

Go
select name,is_cdc_enabled from sys.databases
Go



exec sys.sp_cdc_enable_db
Go
Exec sys.sp_cdc_enable_table
@source_schema='dbo',
@source_name='Test',
@role_name=null
Go
insert into Test values ('Dorsa',20)
insert into Test values ('Dorin',23)
insert into Test values ('Irsa',21)
delete  from Test where id=1
Go
select * from [cdc].[dbo_Test_CT]
Go
exec sys.sp_cdc_disable_table
@source_schema='dbo',
@source_name='Test',
@capture_instance='dbo_Test'

Go
exec sys.sp_cdc_enable_table
@source_schema='dbo',
@source_name='Test',
@role_name=null,
@captured_column_list='[id],[FirstName]'


Go
insert into Test values ('chan',20)
insert into Test values ('Baek',23)

Go
exec sys.sp_cdc_change_job
@retention=12000,
@job_type=cleanup
Go









