use [SofiaCarRental_v2.2]
select * from RentalOrders

--create function Give_Customer_Employee(@make nvarchar(50))
--returns table as
--return(select FirstName+' '+Lastname as Employee,Title as 'Employee Title',)

select EmployeeRef,customerref,carref,make
	from RentalOrders left join cars 
		on RentalOrders.CarRef=Cars.CarID
		where make='opel'
		
select Employeeref,firstname+' ' +lastname as employeename,title
	from RentalOrders left join Employees
	on RentalOrders.EmployeeRef=Employees.EmployeeID
	where Employeeref in (select EmployeeRef
							from RentalOrders left join cars 
								on RentalOrders.CarRef=Cars.CarID
								where make='opel')


select customerref,fullname as 'Customer Name'
	from rentalorders left join Customers
		on RentalOrders.CustomerRef=Customers.CustomerID
		where exists(select EmployeeRef,customerref,carref,make
							from RentalOrders left join cars 
								on RentalOrders.CarRef=Cars.CarID
							where make='opel')

--ok
select customerref,fullname as 'Customer Name'
	from rentalorders left join Customers
		on RentalOrders.CustomerRef=Customers.CustomerID
		where customerref in(select customerref
							from RentalOrders left join cars 
								on RentalOrders.CarRef=Cars.CarID
							where make='opel')


select Employeeref,firstname+' ' +lastname as employeename,title
	from RentalOrders left join Employees
	on RentalOrders.EmployeeRef=Employees.EmployeeID
	where Employeeref in (select EmployeeRef
							from RentalOrders left join cars 
								on RentalOrders.CarRef=Cars.CarID
								where make='opel')

create function Return_EmployeeCustomer(@make varchar(50))
returns @DerivedTable(
	make varchar(50),
	EmployeeName varchar(100),
	EployeeTitle varchar(50),
	Customer varchar(100)
	)as
begin
declare @employeeName
--*********************[ - ok - ]***********************************
select  employeename,title as 'Employee Position',CustomerName
	from 
	(select fullname as 'CustomerName',RentalOrderID
			from rentalorders left join Customers
			on RentalOrders.CustomerRef=Customers.CustomerID
			where customerref in(select customerref
									from RentalOrders left join cars 
									on RentalOrders.CarRef=Cars.CarID
									where make='opel'))  k
	inner join
	(select firstname+' ' +lastname as employeename,title,RentalOrderID
	from RentalOrders left join Employees
	on RentalOrders.EmployeeRef=Employees.EmployeeID
	where Employeeref in (select EmployeeRef
							from RentalOrders left join cars 
								on RentalOrders.CarRef=Cars.CarID
								where make='opel'))  b

	on k.RentalOrderID=b.RentalOrderID


--************************[ - ok - ]****************************

select customerref,fullname as 'Customer Name'
	from rentalorders left join Customers
		on RentalOrders.CustomerRef=Customers.CustomerID
		where customerref in(select customerref
							from RentalOrders left join cars 
								on RentalOrders.CarRef=Cars.CarID
							where make='opel')


select Employeeref,firstname+' ' +lastname as employeename,title,(select customerref,fullname as 'Customer Name'
																	from rentalorders left join Customers
																	on RentalOrders.CustomerRef=Customers.CustomerID
																	where customerref in(select customerref
																							from RentalOrders left join cars 
																							on RentalOrders.CarRef=Cars.CarID
																							where make='opel')) 
	from RentalOrders left join Employees
	on RentalOrders.EmployeeRef=Employees.EmployeeID
	where Employeeref in (select EmployeeRef
							from RentalOrders left join cars 
								on RentalOrders.CarRef=Cars.CarID
								where make='opel')


