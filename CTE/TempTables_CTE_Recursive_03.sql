use [SofiaCarRental_v2.2]
create table Parts (
					Id int primary key not null identity(1,1),
					Name varchar(50) not null,
					Parent int foreign key  REFERENCES Parts (Id)
					)
--Insert Groups
insert into Parts values('A',null)
insert into Parts values('B',null)
insert into Parts values('C',null)
Select * from Parts
--Insert Types
insert into Parts values('t1',1)
insert into Parts values('t2',2)
insert into Parts values('t3',3)
insert into Parts values('t4',2)
insert into Parts values('t5',1)
insert into Parts values('t6',3)
Select * from Parts
--Insert Models
insert into Parts values('m1',9)
insert into Parts values('m2',8)
insert into Parts values('m3',7)
insert into Parts values('m4',6)
insert into Parts values('m5',5)
insert into Parts values('m6',4)
insert into Parts values('m7',4)
insert into Parts values('m8',7)
insert into Parts values('m9',5)
insert into Parts values('m10',9)
insert into Parts values('m11',9)
insert into Parts values('m12',5)
Select * from Parts
--***************************************
--CTE Recursive:
--[ - 1 - ]
With Tree(Id,Name,Parent,Path,Layer)
as 
(
SELECT id,Name,Parent,Cast(Name as varchar(max)) as path,1 as Layer
	FROM Parts
	Where Parent is null
Union All
SELECT P.id,P.Name,P.Parent,t.Path + '  ==>  ' + p.Name as path,t.Layer +1 as Layer
	FROM Parts P Inner join Tree T
	ON P.Parent = T.Id
)
SELECT * FROM Tree
--Order by Path
order by name
--***************************************************
--[ - 2 - ]
With Tree(Id,Name,Path,Layer)
as 
(
SELECT Id,Name,Cast(Name as varchar(max)) as path,1 as Layer
	FROM Parts
	Where Parent is null
Union All
SELECT P.id,P.Name,t.Path + '  ==>  ' + p.Name as path,t.Layer +1 as Layer
	FROM Parts P Inner join Tree T
	ON P.Parent = T.Id
)
SELECT * FROM Tree
--Order by Path
order by name
--***************************************************
--[ - 3 - ]: Set Condition to show the specific Layer
With Tree(Id,Name,Path,Layer)
as 
(
SELECT Id,Name,Cast(Name as varchar(max)) as path,1 as Layer
	FROM Parts
	Where Parent is null
Union All
SELECT P.id,P.Name,t.Path + '  ==>  ' + p.Name as path,t.Layer +1 as Layer
	FROM Parts P Inner join Tree T
	ON P.Parent = T.Id
)
SELECT * FROM Tree
where layer=3
--Order by Path
order by name
--***************************************************
--[ - 4 - ]: Set Condition to show a specific Group
With Tree(Id,Name,Path,Layer)
as 
(
SELECT Id,Name,Cast(Name as varchar(max)) as path,1 as Layer
	FROM Parts
	where Id =2
	
Union All
SELECT P.id,P.Name,t.Path + '  ==>  ' + p.Name as path,t.Layer +1 as Layer
	FROM Parts P Inner join Tree T
	ON P.Parent = T.Id
)
SELECT * FROM Tree
where layer=3
--Order by Path
order by name
