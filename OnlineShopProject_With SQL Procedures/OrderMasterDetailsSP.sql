create TYPE udt_OrderDetailsList as table
   (
	unitPrice money ,
	discount decimal(18, 2) ,
	taxRate decimal(18, 2) ,
	quantity int ,
	product_Ref int
)
GO

alter PROCEDURE dbo.usp_OrderMasterDetails_Insert
	(@udt_orderDetailsList as dbo.udt_OrderDetailsList Readonly,
	@orderDate datetime = '',
    @customer_Ref int = 0)
 
AS
begin tran
begin try

    insert into OrderMaster
	values(@orderDate,@customer_Ref)
	
	Declare @orderMasterID int
	set @orderMasterID=(select max(OrderMaster.Id) from OrderMaster )

	insert into OrderDetails(UnitPrice,Discount,TaxRate,Quantity,Product_Ref,OrderMaster_Ref)
	select unitPrice,discount,taxRate,quantity,product_Ref,@orderMasterID from @udt_orderDetailsList 
			 
commit tran
end try
begin catch
rollback
end catch
go