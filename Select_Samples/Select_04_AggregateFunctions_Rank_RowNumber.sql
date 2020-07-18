select * from cars

select make,model,latitude from cars

--select make,sum(latitude) as 'sum' 
--	from cars
--	group by make

--select categoryname ,sum(latitude) 
--	from Categories left join Cars
--	on Categories.CategoryID=Cars.Categoryref
--	group by CategoryName

--select categoryname ,sum(latitude) 
--	from Categories left join Cars
--	on Categories.CategoryID=Cars.Categoryref
--	group by CategoryName
--	having sum(latitude)>500


select make,model,Latitude
	from cars
	where latitude=(select max(latitude) from cars)

--select  top 10 percent  latitude, make 
--	from cars
--	order by make

--select top 1 make,latitude
--	from cars
--	order by make

select top 1 percent  make,model,Latitude
	from cars
	where latitude=(select max(latitude) from cars)

select * from Customers
--select *,ROW_NUMBER() over (order by zipcode ) as 'row' from Customers
select * from cars

select make,model,ROW_NUMBER() over(partition by (make)order by make) as row
FROM CARS

SELECT MAKE,MODEL,RANK() OVER(ORDER BY LATITUDE) AS 'RANK'
	FROM CARS

SELECT MAKE,MODEL,DENSE_RANK() OVER(ORDER BY LATITUDE) AS 'DENSE_RANK'
	FROM CARS


SELECT MAKE,MODEL,DENSE_RANK() OVER(ORDER BY LATITUDE) AS 'DENSE_RANK'
	FROM CARS
	WHERE MAKE LIKE 'TOYOTA'

SELECT * FROM CARS 
	WHERE MAKE IN ('BMW','BENZ','TOYOTA')

SELECT * FROM CARS 
	WHERE MAKE NOT IN ('BMW','BENZ','TOYOTA')
