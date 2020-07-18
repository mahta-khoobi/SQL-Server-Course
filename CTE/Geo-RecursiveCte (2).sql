
Create Table Geo(Code int primary key,Name Varchar(50),ParentCode int) 
Go 
Insert into Geo Values (1,'Iran',Null)
Insert into Geo Values (2,'Tehran',1)
Insert into Geo Values (3,'Tehran',2)
Insert into Geo Values (4,'Iraq',Null)
Insert into Geo Values (5,'Fars',1)
Insert into Geo Values (6,'Baghdad',4)
Insert into Geo Values (7,'Laar',5)
Insert into Geo Values (8,'Damavand',2)
Insert into Geo Values (9,'Shiraz',5)
Insert into Geo Values (10,'Shemiran',3)
Go

--SELECT * FROM Geo
------
--2005
Go
CREATE VIEW AS VW

With Tree(Code,Name,ParentCode,Pth,LVL) 
	as (SELECT Code,Name,ParentCode,Cast(Name as Varchar(max)) as Pth,1 as LVL
		FROM Geo 
		Where ParentCode is Null
		--Where Code = 2
		Union ALL 
		SELECT G.Code,G.Name,G.ParentCode,T.Pth + '-' +  G.Name as Pth,T.LVL + 1 as LVL
		FROM Geo G Inner join Tree T 
			ON G.ParentCode = T.Code) 
SELECT * FROM Tree
--Where LVL = 3
Order by Pth