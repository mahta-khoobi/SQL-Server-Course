/*Syntax
sp_addmessage [ @msgnum= ] msg_id , [ @severity= ] severity , [ @msgtext= ] 'msg' 
     [ , [ @lang= ] 'language' ] 
     [ , [ @with_log= ] { 'TRUE' | 'FALSE' } ] 
     [ , [ @replace= ] 'replace' ] 
*/
go
/*
[ @msgnum= ] msg_id :
	Is the ID of the message.
	msg_id is int with a default of NULL.
	msg_id for user-defined error messages can be an integer between 50,001 and 2,147,483,647.
	The combination of msg_id and language must be unique; an error is returned 
		if the ID already exists for the specified language.

[ @severity = ]severity:
	Is the severity level of the error.
	severity is smallint with a default of NULL.
	Valid levels are from 1 through 25.

[ @msgtext = ] 'msg':
	Is the text of the error message.
	msg is nvarchar(255) with a default of NULL.

[ @lang = ] 'language':
	Is the language for this message.
	language is sysname with a default of NULL.
	Because multiple languages can be installed on the same server,
		language specifies the language in which each message is written.
	When language is omitted, the language is the default language for the session.

[ @with_log = ] { 'TRUE' | 'FALSE' }:
	Is whether the message is to be written to the Windows application log when it occurs.
	@with_log is varchar(5) with a default of FALSE.
	If TRUE, the error is always written to the Windows application log. 
	If FALSE, the error is not always written to the Windows application log but can be written,
		depending on how the error was raised. Only members of the sysadmin server role can use this option.
	**If a message is written to the Windows application log, it is also written to the Database Engine error log file.**

[ @replace = ] 'replace':
	If specified as the string replace, an existing error message is overwritten with new message text and severity level. 
	replace is varchar(7) with a default of NULL.
	This option must be specified if msg_id already exists. 
	If you replace a U.S. English message, the severity level is replaced for all messages in all other languages
		that have the same msg_id.
*/
Go
USE [SofiaCarRental_v2.2];
GO
EXEC sp_addmessage 50001, 16,'Result between 20 and 100 is wrong. Please reexecute with appropriate values.';
select * from sys.messages where message_id=50001
GO
--***********************
EXEC sp_addmessage @msgnum = 60001, @severity = 16, 
   @msgtext = 'The item named %s already exists in %s.', 
   @lang = 'us_english';
   select * from sys.messages where message_id=60001
go
sp_dropmessage @msgnum = 60000;

EXEC sp_addmessage @msgnum = 60001, @severity = 16, 
   @msgtext = ' گچ پژ این پیغام به زبان پارسی چاپ میشود', 
   @lang = 'Arabic';
   select * from sys.messages where message_id=60001
go
--Dropping Message:
   sp_dropmessage @msgnum = 60000 , @lang='Arabic';
   EXEC sp_dropmessage @msgnum = 60000, @lang = 'all';
GO
--*****************
select * from sys.syslanguages
--****************
--Altering:
/*
sp_altermessage [ @message_id = ] message_number,[ @parameter = ]'write_to_log',[ @parameter_value = ]'value' 
*/