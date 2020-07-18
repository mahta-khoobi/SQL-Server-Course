--7
select q1.CategoryName,q2.CompanyName
from
(select c.CategoryName,p.ProductID
from Categories c left join Products p
on c.CategoryID = p.CategoryID)Q1
left join
(select s.CompanyName,p.ProductID
from Suppliers s inner join Products p
on s.SupplierID=p.SupplierID)Q2
on q1.ProductID=q2.ProductID

---------------------------------

CREATE VIEW dbo.uvw_CategoryFullInfo
AS(
select q1.CategoryName,q2.CompanyName
from
(select c.CategoryName,p.ProductID
from Categories c left join Products p
on c.CategoryID = p.CategoryID)Q1
left join
(select s.CompanyName,p.ProductID
from Suppliers s inner join Products p
on s.SupplierID=p.SupplierID)Q2
on q1.ProductID=q2.ProductID
)
------------------------------------
select *
from dbo.uvw_CategoryFullInfo
------------------------------------
