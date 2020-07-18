select * from cars
select * from Categories

select make+' '+model,(select categoryName from Categories where CategoryID=categoryref)
	from cars