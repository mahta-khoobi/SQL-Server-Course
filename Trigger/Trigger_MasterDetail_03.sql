use [SofiaCarRental_v2.2]
GO 

CREATE TABLE dbo.InvoiceMaster
(
InvMasterId int primary key NOT NULL identity(1,1),
SubmissionDate Date default getdate(),
Customer varchar (50) NULL,
TotalPrice money NULL
)
GO

CREATE TABLE dbo.InvoiceDetail
(
InvDetailId int primary key NOT NULL identity(1,1),
InvMasterRef int NOT NULL FOREIGN KEY REFERENCES dbo.InvoiceMaster(InvmasterId),
PartModel varchar (50) NULL,
Amount smallmoney NULL,
Price money NULL
)
GO



--ALTER TABLE dbo.FactorItem WITH NOCHECK ADD
--CONSTRAINT PK_FactorItem PRIMARY KEY CLUSTERED
--(FNo,Row)
--GO


Create TRIGGER [dbo].[TotalPriceComputing] ON InvoiceDetail 
FOR INSERT, UPDATE, DELETE
AS
	Update InvoiceMaster
	Set TotalPrice = Tp
	FROM InvoiceMaster 
	inner join
	 (
		SELECT InvoiceMaster.InvMasterId,Sum(Amount*Price) as Tp 
			FROM InvoiceMaster Left Join InvoiceDetail 
			ON InvoiceMaster.InvMasterId = InvoiceDetail.InvMasterRef 
			Where
				InvoiceMaster.InvMasterId in (SELECT InvMasterRef FROM Inserted) 
			OR 
				InvoiceMaster.InvMasterId in (SELECT InvMasterRef FROM Deleted) 
			Group by InvoiceMaster.InvMasterId
		) K  
	  ON InvoiceMaster.InvMasterId = K.InvMasterId
Go 
-------------------
insert into InvoiceMaster(Customer)
values('Ali Mohammad Bahmanyar')
go
insert into InvoiceMaster(Customer)
values('Fatemeh Masoumifar')
go
--====================================
drop trigger [dbo].[TotalPriceComputing]
go
select * from InvoiceMaster
go
select * from InvoiceDetail
go
--========================================
insert into InvoiceDetail(InvMasterRef,PartModel,Amount,Price)
values(1,'Benz',20,2000)
go
insert into InvoiceDetail(InvMasterRef,PartModel,Amount,Price)
values(1,'BMW',10,1500)
go
insert into InvoiceDetail(InvMasterRef,PartModel,Amount,Price)
values(2,'BMW',10,100)
go
Delete FROM InvoiceDetail Where PartModel = 'Pride'
Delete FROM InvoiceDetail 