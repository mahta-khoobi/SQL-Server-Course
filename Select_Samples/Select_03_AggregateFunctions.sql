--select categoryName,make,model
--	from Categories left join Cars
--		on Categories.CategoryID=Cars.Categoryref

select * from cars

--select sum(latitude) from cars
--select count(make) from cars

select * from child

select count(parentref) from child
select count(distinct parentref) from child

select count(childcode) from child
select count(distinct childcode) from child