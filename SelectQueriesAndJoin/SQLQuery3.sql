use NORTHWND
GO
--1
select c.CategoryName as 'GroupName'
from Categories c
where c.CategoryName like '%e'
GO
--2
select c.CategoryName as 'GroupName'
from Categories c
where c.Picture is null
GO
--3
select c.CategoryName as 'GroupName' , isnull (count (p.UnitsInStock+p.UnitsOnOrder),0 ) as 'AppliedQuantity'
from Categories c left join Products p on c.CategoryID = p.CategoryID 
group by c.CategoryName
GO
--4
select p.ProductName as 'ProductName' ,  isnull (count(p.ProductID),0) as 'Quantity'
from Products p 
where p.UnitPrice<20 and p.ProductName like 'a%'
group by p.ProductName
GO
--5
select isnull(COUNT(p.ProductID),0) as 'DiscontinuedProducts'
from Products p
where p.Discontinued = 1
GO
--6
select s.CompanyName as 'SupplierName' , isnull(count(p.ProductID),0) as 'QuantityOfProducts'
from Suppliers s inner join Products p on s.SupplierID = p.SupplierID
group by s.CompanyName
GO
--7
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
--8
select t.TerritoryDescription , r.RegionDescription
from Territories t right join Region r 
on r.RegionID=t.RegionID
GO
--9
select CONCAT(e.FirstName, ' ', e.LastName) as 'Sellers' , e.City , e.BirthDate
from Employees e inner join Orders o 
on e.EmployeeID = o.EmployeeID
GO
--10
select isnull (count (e.EmployeeID),0) as 'NumberOfEmployeesNotInvolvedInOrders '
from Employees e 
where e.EmployeeID not in ( select o.EmployeeID
from Orders o )
GO
--11
--select isnull (sum(od.Quantity*od.UnitPrice),0) as 'AmountOfSellsFromLondonSellers'
--from Employees e inner join Orders o 
--on e.EmployeeID=o.EmployeeID 
--inner join [Order Details] od 
--on o.OrderID=od.OrderID
--where e.City='London' -- it doesnt include all employees who havent sold anything
select Q1.EmployeeCity , SUM(Q2.Total)
from
(select e.City as EmployeeCity , o.OrderID
from Employees e left join Orders o
on e.EmployeeID = o.EmployeeID
where e.City='London')Q1
left join
(select isnull(sum(od.Quantity*od.UnitPrice-od.Discount),0) as Total , o.OrderID
from Orders o inner join [Order Details] od
on o.OrderID= od.OrderID
group by o.OrderID
)Q2
on Q1.OrderID=Q2.OrderID
group by Q1.EmployeeCity
GO
--12
select isnull(count(sum(p.UnitsInStock+p.UnitsOnOrder)),0) as QuantityOfUSAProducts
from Suppliers s left join Products p 
on s.SupplierID=p.SupplierID 
where s.Country='USA'
Go
--13
select CONCAT(e.FirstName,' ', e.LastName) 'NameOfEmployeesHiredBefore1993' , e.Title as Title
from Employees e 
where  YEAR(e.HireDate)<1993
Go
--14
select o.EmployeeID,isnull (sum(od.Quantity),0) as 'NumberOfSells'
from Orders o inner join [Order Details] od 
on o.OrderID=od.OrderID
group by o.EmployeeID
Go
--15
select top 3  c.CompanyName as 'Customer(Company)' , sum(od.Quantity*od.UnitPrice-od.Discount) as AmounOfSells
from Customers c inner join Orders o 
on c.CustomerID = o.CustomerID
inner join [Order Details] od
on o.OrderID = od.OrderID
group by c.CompanyName
Order by AmounOfSells Desc
Go
