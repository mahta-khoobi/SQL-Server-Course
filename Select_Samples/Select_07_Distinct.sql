use [SofiaCarRental_v2.2]
go
--select distinct parentcode,parentname,childcode,childname 
--	from parent inner join child
--		on parent.parentid=child.parentref
--=========================================================
insert into cars (make,model,TagNumber)
values	('Bently','SuperLux',10),
		('Alfaromeo','147',120),
		('Bently','SuperLux',20),
		('Alfaromeo','147',220)

select make,model,TagNumber from Cars order by make
select distinct make,model,TagNumber from Cars order by make
select distinct make,model from cars order by make
Go
select * from cars
Select count(Make) from cars
select count(distinct make) from cars
Go
--Aggregates do not calculate Null:
insert into cars (make,model,TagNumber)
values	(Null,'SuperLux','10t')
Select count(Make) from cars
select count(*) from cars
