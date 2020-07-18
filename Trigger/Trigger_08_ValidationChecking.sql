use [SofiaCarRental_v2.2]
Go
create table UserAccounts (Id int primary key identity(1,1),Name Varchar(50),Password varchar(32))
Go
create trigger Password_Validation on UserAccounts
For Insert,Update
as
begin
	if exists (Select * from UserAccounts where LEN(Password)<8 )
	begin
		RollBack
		Raiserror('Wrong Password',16,1)
	end
end
Go
insert into UserAccounts
	values('bahmanyar','123')
Go