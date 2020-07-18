
alter PROCEDURE dbo.usp_CreateCommercialTables
   
AS
	begin tran
	begin try
    create table Category(id int primary key identity(1,1))
	create table ProductType(id int primary key identity(1,1), categoryID int foreign key references Category)
	create table Products(id int primary key identity(1,1), ProductID int foreign key references Category)
	commit tran
	print 'OK'
	end try
	begin catch
	print 'Error'
	rollback
	end catch
	Go
		exec dbo.usp_CreateCommercialTables
	----------------------------------------
CREATE PROCEDURE dbo.usp_DeleteCommercialTables
   
AS
	begin tran
	begin try
    drop table Category
	drop table ProductType
	drop table Products
	commit tran
	print 'OK'
	end try
	begin catch
	print 'Error' 
	rollback
	end catch

	Go
	exec dbo.usp_DeleteCommercialTables


	

