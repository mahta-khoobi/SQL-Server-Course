--Number of Fields must be the same
--DataTypes must be castable
--=========================================
--Create & Insert Data in test_110
create Table Test_110(code int,FName varchar(50),LName varchar(50))
go
insert into Test_110
values(1,'Ali Mohammad','Bahmanyar'),
	  (2,'Fatemeh','MasoumiFar'),
	  (3,'samira','Esmi')
go
--Create & Insert Data in test_120
create Table Test_120(code int,FName varchar(50),LName varchar(50))
go
insert into Test_120
values(1,'Ali Mohammad','Bahmanyar'),
	  (2,'Ali','Lotfi'),
	  (3,'Matin','Asadi')
go
--=============================
select * from Test_110
select * from Test_120
--union all 
select * from Test_110 
union all 
select * from Test_120 
go
--union
select * from Test_110 
union  
select * from Test_120 
go
--intersect
select * from Test_110 
intersect 
select * from Test_120 
go
--Except
select * from Test_110 
Except 
select * from Test_120 
go