alter PROCEDURE usp_Category_Delete(@id int)
AS 
begin
 if exists (select Id from ProductCategory where Id=@id)
 begin 
 if exists (select Category_Ref from Product where Category_Ref=@id)
 begin
 raiserror('You cant delete this record because there is a record assiociated with in Product Table',16,1)
 end
 else
 begin
 delete 
 from ProductCategory 
 where Id=@id
 end
 end
 else
 begin
raiserror('òœ ê—ÊÂ ò«·« ÊÃÊœ ‰œ«—œ',16,1)
 end
end
Go

exec usp_Category_Delete 49

select * from ProductCategory