create table tbl_Address(code int,name varchar(50),parent int  )
Go
insert into tbl_Address values(1,'Iran',Null)
insert into tbl_Address values(2,'Tehran',1)
insert into tbl_Address values(3,'Karaj',2)
insert into tbl_Address values(4,'Germany',Null)
insert into tbl_Address values(5,'Fars',1)
insert into tbl_Address values(6,'Laar',5)
insert into tbl_Address values(7,'Shiraz',5)
insert into tbl_Address values(8,'Koln',4)
insert into tbl_Address values(9,'tehran',2)
Go
select * from tbl_Address


Go
With Tree(Code,Name,ParentCode,Pth,lvl)
as (SELECT Code,Name,Parent,Cast(Name as varchar(max)) as pth,1 as lvl
FROM tbl_Address
Where Parent is null
Union All
SELECT A.Code,A.Name,A.Parent,t.Pth + '\' + A.Name as pth,t.lvl +1 as lvl
FROM tbl_Address A Inner join Tree T
ON A.Parent = T.Code)
SELECT * FROM Tree
Order by Pth