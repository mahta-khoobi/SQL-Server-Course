--Type1:
--Case Field When Value1 Then Exp1
--			 When Value2 Then Exp2
--.....
--			[Else Exp_n]
--End
--******************************************
--Type2:
--Case When Condition1 Then Exp1
--	   When Condition2 Then Exp2
--.....
--		[Else Exp_n]
--End
--*******************************************
select * from cars
--**************************************************
select make,model,
	case make when 'opel' then 'OpelGermany'
			  when 'Honda' then 'HondaJapan'
			  else 'other'
	 end as newmake
from cars
--*************************************************
select make,model, make+' '+model as fullname
	from cars

select make+' '+model as FullName,Mp3Player,latitude,
		case mp3player when 1 then latitude+10
					   when 0 then latitude-10
					   Else 0 
		End as NewLatitude
from cars
--****************************************************
select * from RentalOrders

select carref,days,case when days<5 then 100
						when days=5 then 1500
						when days>5 and Days<20 then 5000
						when days>=20 then 100000
						else 0 
					end as Price
		from RentalOrders
--*********************************************************
select Mileagestart,mileageend,mileageend-mileagestart as result
from RentalOrders

select Mileagestart,mileageend,mileageend-mileagestart as result,Days,case  when mileageend-mileagestart>5000 then days+10
																			when mileageend-mileagestart>1000 then days+5
																			when mileageend-mileagestart>500 then days+3
																		    when mileageend-mileagestart>100 then days+2
																	        else days
																		end as NewDays 
from RentalOrders
																		
--***************************************************

	