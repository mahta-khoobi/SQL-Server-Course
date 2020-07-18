use [SofiaCarRental_v2.2]
go
select * from cars

create function SearchCars_Make(@make varchar(50))
returns table as
return(select * from cars where make=@make)

select * from SearchCars_Make('opel')