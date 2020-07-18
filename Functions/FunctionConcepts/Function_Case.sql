CREATE FUNCTION whichContinent (@Country nvarchar(15)) 
RETURNS varchar(30) AS 
BEGIN 
declare @Return varchar(30) 
select @return = case @Country 
					when 'Argentina' then 'South America' 
					when 'Belgium' then 'Europe' 
					when 'Brazil' then 'South America' 
					when 'Canada' then 'North America' 
					when 'Denmark' then 'Europe' 
					when 'Finland' then 'Europe' 
					when 'France' then 'Europe' 
					else 'Unknown' 
					end 
return @return 
end ;
Go

print dbo.WhichContinent('USA')
Go
select dbo.WhichContinent(Customers.Country), customers.* from customers 
Go
create table test (
					Country varchar(15),
					 Continent as (dbo.WhichContinent(Country))
					 );
	Go 
 insert into test (country) 
	values ('USA') 
	Go
	select * from test
	Go