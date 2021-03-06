create TYPE udt_CategoryInfo as table
   (
	categoryCode int,
	categoryName nvarchar(50)
)
GO

alter PROCEDURE dbo.usp_Category_Insert
	(@categoryInfo as dbo.udt_CategoryInfo Readonly
)
 
AS
begin tran
begin try

	insert into ProductCategory(CategoryCode,CategoryName)
	select categoryCode,categoryName from @categoryInfo 
			 
commit tran
end try
begin catch
rollback
end catch
go


Declare @categoryList as dbo.udt_CategoryInfo
INSERT INTO @categoryList VALUES (789, 'sport')

exec dbo.usp_Category_Insert @categoryInfo=@categoryList

select * from ProductCategory