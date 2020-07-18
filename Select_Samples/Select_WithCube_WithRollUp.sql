use [SofiaCarRental_v2.2]
create table Data3(item varchar(50),color varchar(50),Quantity int);
insert into Data3 values('Benz','Blue',1000)
insert into Data3 values('Benz','Red',2000)
insert into Data3 values('BMW','Blue',100)
insert into Data3 values('BMW','Red',200)

select * from Data3

select Item,Color,SUM(Quantity)as Tp
from Data3
Group by item,color

select Item,Color,SUM(Quantity) as Tp
from Data3
Group by item,color with cube

select Item,Color,SUM(Quantity) as Tp
from Data3
Group by color,item with cube

select Item,Color,SUM(Quantity)as Tp
from Data3
Group by item,color with rollup

select Item,Color,SUM(Quantity)as Tp
from Data3
Group by color,item with rollup