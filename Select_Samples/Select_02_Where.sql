use [SofiaCarRental_v2.2]
go
--SELECT select_list
--	[ INTO new_table_name ]
--FROM table_list
--	[ WHERE search_conditions ]
--	[ GROUP BY group_by_list ]
--	[ HAVING search_conditions ]
--	[ ORDER BY order_list [ ASC | DESC ] ]

select * from cars

--select make,abs,asr 
--	from cars
--	where abs>0 and asr>0 and make between 'Bmw' and 'Lincoln'

--SELECT * from cars where make like '[^fc]%'

--SELECT * from cars where make like'f%'

--SELECT * from cars where make like'opel'
--SELECT * from cars where make NOT  like'opel'

--select * from cars 
--		order by CategoryID desc , caryear 