alter procedure dbo.usp_Category_Select
as 
begin
select pc.Id,pc.CategoryCode,pc.CategoryName
from ProductCategory pc
end