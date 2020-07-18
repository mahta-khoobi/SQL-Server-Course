create database Commercial
Go
use Commercial
Go
create table OrderMaster(
	Id int primary key identity(1,1),
	Code int not null ,
	Seller nvarchar(50) ,
	Buyer nvarchar(50),
	Discount money constraint chkDiscountTopBorder check(Discount<=100) default 10)

Go
	CREATE UNIQUE INDEX UQ_Code ON DBO.OrderMaster(code)
Go
create table Product(
	Id int primary key identity(1,1),
	Name nvarchar(50),
	Code int not null  constraint chkCode check(Code<=100 and Code>=1),
	UnitPrice money not null constraint chkUnitPriceBorder check(UnitPrice<=50000000 and UnitPrice>=1000000)
	)
Go
	CREATE UNIQUE INDEX UQ_ProductCode ON DBO.Product(code)
Go
create table OrderDetail(
	ProductId int foreign key references Product(Id),
	OrderMasterId int foreign key references OrderMaster(Id),
	Quantity smallmoney,
	UnitPrice money not null constraint chkUnitPriceOrderDetailBorder check(UnitPrice<=50000000 and UnitPrice>=1000000),
	primary key(ProductId,OrderMasterId)

	)

Go