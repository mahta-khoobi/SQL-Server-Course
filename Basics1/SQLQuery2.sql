use pubs


select * from Person

select p.PersonSurname , w.DescriptionRow, w.Type_Flag 
from Warranty w inner join Person p
on p.Id=w.Person_Ref

select p.PersonSurname , SUM(w.Amount) as 'Sum'
from Warranty w inner join Person p
on p.Id=w.Person_Ref
group by p.PersonSurname


select a.au_fname as 'Name' , a.au_lname  as 'Last Name', a.city as 'City'
from authors a 
GO
select *
from publishers p 
where p.city ='New York'
GO
select count(p.pub_id) as ' ⁄œ«œ ‰«‘—«‰', p.country as 'ò‘Ê—'
from publishers p 
group by p.country
GO
select t.title as 'Title' , t.price 'Price'
from titles t 
where t.title like '%[s?!]' and t.type='Business'
GO
select isnull(count(e.emp_id),0) as ' ⁄œ«œ ò«—„‰œ«‰',p.pub_name  --count(e,emp_id ) bhtare
from publishers p left join employee e
on p.pub_id=e.pub_id
group by p.pub_name

select *
from employee e
where e.pub_id=9952
