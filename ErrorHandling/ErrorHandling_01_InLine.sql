use [SofiaCarRental_v2.2]
@@Error
Declare @Number int
set @Number=12.5
set @Number=12/0
Print @Number
 --**************************
 SELECT 100/0
SELECT @@ERROR
SELECT @@ERROR  --Return Zero 
/*
The second result set is the number from the first SELECT @@ERROR.
 Notice the number corresponds to the msg number found in the Messages tab. 
 The third result set shows a value of 0.
  This is because the first SELECT @@ERROR worked successfully and therefore set the system variable to 0.
   This demonstrates the lifetime of the value within @@ERROR
*/
--*****************************
--Statement is True but it raise error,so @@Error is not 0
RAISERROR (50001,1,1,243)
SELECT @@ERROR
--************
RAISERROR (5000,1,1,243)
SELECT @@ERROR
--****************
RAISERROR (13002,1,1,243)
SELECT @@ERROR
--******************
RAISERROR (50001,11,1,243)
SELECT @@ERROR
--********************************