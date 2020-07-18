--1
 
select Q3.CategoryID , Q6.Country , isnull(sum(Q6.Quantity*Q6.UnitPrice-Q6.Discount),0)
from 

(select Q1.CategoryID , Q1.CategoryName, Q2.OrderID
from 
(select p.ProductID , c.CategoryID , c.CategoryName
from Categories c left join Products p
on c.CategoryID=p.CategoryID)Q1
left join
(select p.ProductID , od.OrderID
from Products p left join [Order Details] od
on p.ProductID=od.ProductID)Q2
on Q1.ProductID = Q2.ProductID)Q3

left join

(select Q4.Country , Q5.OrderID , Q5.Quantity , Q5.UnitPrice , Q5.Discount
from
(select o.OrderID , c.Country 
from Customers c left join Orders o
on c.CustomerID=o.CustomerID)Q4
left join
(select od.OrderID , od.Quantity , od.UnitPrice , od.Discount
from Orders o inner join [Order Details] od
on o.OrderID=od.OrderID)Q5
on Q4.OrderID=Q5.OrderID)Q6
on Q3.OrderID=Q6.OrderID

group by Q3.CategoryID , Q6.Country 

--2

select Q1.ShipperID , SUM(Q2.Quantity) as SumOfProducts
from
(select s.ShipperID , o.OrderID
from Shippers s left join Orders o
on s.ShipperID = o.ShipVia)Q1
left join
(select od.Quantity , o.OrderID
from Orders o inner join [Order Details] od
on o.OrderID=od.OrderID
)Q2
on Q1.OrderID = Q2.OrderID
group by Q1.ShipperID

--3

select c.CustomerID as ID , c.CompanyName as CustomersUsedShip
from Customers c left join Orders o
on c.CustomerID = o.CustomerID
where ShipVia is not null

--4

select Q1.CustomerName ,  Q1.Country , SUM(Q2.UnitPrice*Q2.Quantity-Q2.Discount) as TotalProductsPricePaid , SUM(Q2.Quantity) as TotalProductsQuantity
from
(select c.CompanyName as CustomerName , o.OrderID , c.Country
from Customers c left join Orders o
on c.CustomerID=o.CustomerID)Q1
left join
(select od.Quantity , od.UnitPrice , od.Discount , o.OrderID
from Orders o inner join [Order Details] od
on o.OrderID=od.OrderID
)Q2
on Q1.OrderID=Q2.OrderID
group by Q1.CustomerName ,  Q1.Country
