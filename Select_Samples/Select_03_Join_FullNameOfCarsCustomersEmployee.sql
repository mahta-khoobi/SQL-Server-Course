use [SofiaCarRental_v2.2]
go
SELECT E.FullName
FROM RentalOrders RO 
INNER JOIN Employees E ON RO.Employeeref=E.EmployeeID
INNER JOIN Cars C ON C.CarID=RO.Carref
go
--==============================================
select make+' '+model as car,Customers.FullName as customer
from RentalOrders
inner join
cars on cars.CarID=RentalOrders.CarRef
inner join
Customers on Customers.CustomerID=RentalOrders.CustomerRef
--===============================================
select make,model,Customers.FullName as Customer,Employees.FullName as Employee,RentalOrders.Days
from RentalOrders
inner join
Employees on RentalOrders.EmployeeRef=Employees.EmployeeID
inner join
cars on cars.CarID=RentalOrders.CarRef
inner join 
Customers on Customers.CustomerID=RentalOrders.CustomerRef

go