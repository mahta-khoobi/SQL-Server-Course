use [SofiaCarRental_v2.2]
select * from sys.messages
/*
Type 1:
	RAISERROR ({msg_id|msg_str} {,severity,state}
	[,argument [ ,...n ] ])
	[WITH option [ ,...n ]]

msg_str is a string of characters with optional embedded conversion specifications.
Each conversion specification defines how a value in the argument list is formatted and placed
  into a field at the location of the conversion specification in msg_str.
Conversion specifications have this format:
							% [[flag] [width] [. precision] [{h | l}]] type

*/
/*
Type 2:
	RAISERROR('You made an error', 10, 1)
*/
raiserror('This is message %s %d.',10,1,'number',5)

RAISERROR ('This is message %s %d.', -- Message text.
           10, -- Severity,
           1, -- State,
           'number', -- First argument.
           5); -- Second argument.

GO
--*********************
RAISERROR ('<<%*.*s>>', -- Message text.
           10, -- Severity,
           1, -- State,
           7, -- First argument used for width.
           3, -- Second argument used for precision.
           'abcde'); -- Third argument supplies the string.
-- The message text returned is: <<    abc>>. <== <<????abc>>

GO
--*******************************

RAISERROR ('<<%*.*s>>', -- Message text.
           10, -- Severity,
           1, -- State,
           7, -- First argument used for width.
           7, -- Second argument used for precision.
           'abcde'); -- Third argument supplies the string.
-- The message text returned is: <<    abcde>>.
GO
--*******************************
RAISERROR ('<<%7.3s>>', -- Message text.
           10, -- Severity,
           1, -- State,
           'abcde'); -- First argument supplies the string.
-- The message text returned is: <<    abc>>.
GO
--***********************************
RAISERROR ('<<%*.*s>>', -- Message text.
           10, -- Severity,
           1, -- State,
           7, -- First argument used for width.
           3, -- Second argument used for precision.
           '12345.0125'); -- Third argument supplies the string.
-- The message text returned is: <<    123>>.
GO
--******************
RAISERROR ('<<%i>>', -- Message text.
           10, -- Severity,
           1, -- State,
           7, -- First argument used for width.
           3, -- Second argument used for precision.
           'abcde'); -- Third argument supplies the string.
-- The message text returned is: <<7>>.
GO
--*********************
--in try catch:
BEGIN TRY
    -- RAISERROR with severity 11-19 will cause execution to  jump to the CATCH block.
    RAISERROR ('Error raised in TRY block by "Bahmanyar"', -- Message text.
               16, -- Severity.
               1 -- State.
               );
END TRY
BEGIN CATCH
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT 
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();

    /* Use RAISERROR inside the CATCH block to return error information about the original error 
		that caused execution to jump to the CATCH block.*/
    RAISERROR (@ErrorMessage, -- Message text.
               @ErrorSeverity, -- Severity.
               @ErrorState -- State.
               );
END CATCH
Go
--****************************
--Creating a message in sys.messages:
/*
The following example shows how to raise a message stored in the sys.messages catalog view.
	The message was added to the sys.messages catalog view
	by using the sp_addmessage system stored procedure as message number 50005.
*/

--Adding Message:
sp_addmessage @msgnum = 50005,
              @severity = 10,
              @msgtext = '[ - %s  - ]';

select * from sys.messages where message_id=50005
GO
--Using this message by it's message_id:
RAISERROR (50005, -- Message id.
           10, -- Severity,
           1, -- State,
           'This Error is registered in sys.messages by Ali Mohammad Bahmanyar'); 
GO
--Dropping the Message:
sp_dropmessage @msgnum = 50005;
select * from sys.messages where message_id=50005
GO
--********************
/*
 Using a local variable to supply the message text:
	The following code example shows how to use a local variable to supply the message text for a RAISERROR statement.
*/
DECLARE @StringVariable NVARCHAR(50);
SET @StringVariable = '[ - %s - ]';
RAISERROR (@StringVariable,10,1,'This Error use Local Variable was defined by Ali Mohammad Bahmanyar');
GO