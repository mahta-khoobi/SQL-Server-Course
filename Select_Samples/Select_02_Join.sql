use [SofiaCarRental_v2.2]
go
	--[make],[count(make)],[count(make) if available]
--=======================================================================
	update cars
		set Available=0
		where make like 'Audi' 
--==================================================
--inner join:
--It doesn't show cars with available=0
	 select k.make,k.count,f.available
	 from
	 ( select  make,count(make) as count from cars group by make) as k	
	 inner join
	( select make,count(available) as available from cars where Available=1 group by make) as f 
	on k.Make=f.Make
	go
--=======================================================================
	update cars
		set Available=0
		where make like 'Audi' 
--==================================================
--left join:
--It shows all cars
	 select k.make,k.count,isnull(f.available,0)
	 from
	 ( select  make,count(make) as count from cars group by make) as k	
	 left join
	( select make,count(available) as available from cars where Available=1 group by make) as f 
	on k.Make=f.Make
	go
--Right join:
	 select k.make,k.count,isnull(f.available,0)
	 from
	 ( select  make,count(make) as count from cars group by make) as k	
	 right join
	( select make,count(available) as available from cars where Available=1 group by make) as f 
	on k.Make=f.Make
	go

	update cars
		set Available=0
		where make like 'Audi'