select * from cars
select * from cars 
	where make in ('opel','honda')

select * from cars 
	where make in ('opel','honda') and model in ('corsa','accord')

select * from cars 
	where make not in ('opel','honda','audi','volvo')

select * from cars
	where CarYear in (select CarYear from cars
							where make='hyundai' and model='i30')

select * from cars 
	where CarID not in (select carref from RentalOrders)

select * from cars
	where  exists( select * from cars where make='hyundai' and model='i30')

select * from cars 
	where not exists (select 1 from RentalOrders)