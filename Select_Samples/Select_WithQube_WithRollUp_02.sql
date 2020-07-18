create table tbl_Sample(Laptop varchar(50),Model varchar(50),Amount int);

insert into tbl_Sample values('Sony','FXzh',1000)
insert into tbl_Sample values('Sony','X220',2000)
insert into tbl_Sample values('Sony','1234',100)
insert into tbl_Sample values('Sony','FXzh',200)
insert into tbl_Sample values('Asus','1234',1000)
insert into tbl_Sample values('Asus','1234',2000)
insert into tbl_Sample values('Asus','X220',100)
insert into tbl_Sample values('Asus','X220',200)

select * from tbl_Sample

select Laptop,Model,Sum(Amount)
from tbl_Sample
group by Laptop,Model

select Laptop,Model,Sum(Amount)
from tbl_Sample
group by Laptop,Model with Cube

select Laptop,Model,Sum(Amount)
from tbl_Sample
group by Model,Laptop with Cube

select Laptop,Model,Sum(Amount)
from tbl_Sample
group by Laptop,Model with Rollup

select Laptop,Model,Sum(Amount)
from tbl_Sample
group by Model,Laptop with Rollup