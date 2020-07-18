use [SofiaCarRental_v2.2]
go
create proc SelectAllCars
as
begin 
select * from cars
end

exec SelectAllCars