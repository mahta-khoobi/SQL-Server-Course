 --5)

create PROC [dbo].[InsertCode]	
	@Fname varchar(100),
	@lName varchar(100),
	@Age TINYINT
AS
BEGIN

DECLARE @Code	TINYINT


SELECT @Code=CODE
FROM Personnel


IF @Code IS NULL
BEGIN
	SET @Code=1
	INSERT INTO Personnel (Fname,Lname,Age,code)
	VALUES (@Fname,@lName,@Age,@Code)
END
ELSE
--IF @Code IS NOT NULL
BEGIN
	SELECT @Code=MAX(CODE)+1
	FROM Personnel 

	--SET @Code=@Code+1
	INSERT INTO Personnel (Fname,Lname,Age,code)
	VALUES (@Fname,@lName,@Age,@Code)

END

END


 EXEC  InsertCode @Fname='Saba',@Lname='Abbasi',@Age=22
 SELECT * FROM Personnel

 DELETE FROM PERSONNEL

 --------------------------------------------------------
 