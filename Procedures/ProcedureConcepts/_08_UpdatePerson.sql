create proc Update_Person(@Code int,@FName varchar(50),@LName varchar(50))
as
begin
	if @code in (select code from person)
	begin
		update person
			set fname=@fname,lname=@Lname
		where code=@code
	end
	else 
	begin
	 raiserror('˜Ï æÌæÏ äÏÇÑÏ',16,1)
	end
end

exec Update_Person 1,'hamid','heydari'
exec Update_Person 100,'aa','ff'
select * from person
			