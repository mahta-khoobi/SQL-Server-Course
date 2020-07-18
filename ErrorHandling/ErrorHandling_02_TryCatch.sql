use [SofiaCarRental_v2.2]
/*
BEGIN TRY
{ sql_statement | statement_block }
END TRY
BEGIN CATCH
{ sql_statement | statement_block }
END CATCH
*/
--********************************
--Sample 01 :
DECLARE @Probs int
BEGIN TRY
	SELECT 'This Select will work'
	SELECT @Probs='Not Right' --this line generate error and trace pointer goes to catch cluase
	SELECT 10+5
END TRY
BEGIN CATCH
	SELECT 'An error has occurred at line ' +LTRIM(STR(ERROR_LINE())) +' with error ' + LTRIM(STR(ERROR_NUMBER())) + ' ' + ERROR_MESSAGE()
END CATCH
--********************************
DECLARE @Probs int
BEGIN TRY
	SELECT 'This will work'
	BEGIN TRY
		SELECT @Probs='Not Right'
		SELECT 10+5
	END TRY
	BEGIN CATCH
		SELECT 'The second catch block'
	END CATCH
	SELECT 'And then this will now work'
END TRY
BEGIN CATCH
	SELECT 'An error has occurred at line ' +LTRIM(STR(ERROR_LINE())) +' with error ' + LTRIM(STR(ERROR_NUMBER())) + ' ' + ERROR_MESSAGE()
END CATCH
--**************************
DECLARE @Probs int
BEGIN TRY
	SELECT 'This will work'
	BEGIN TRY
		SELECT @Probs='Not Right'
		SELECT 10+5
	END TRY
	BEGIN CATCH
		THROW
	END CATCH
	SELECT 'The THROW means this is skipped' --This does not trace
END TRY
BEGIN CATCH
	SELECT 'An error has occurred at line ' +LTRIM(STR(ERROR_LINE())) +' with error ' + LTRIM(STR(ERROR_NUMBER())) + ' ' + ERROR_MESSAGE()
	IF @@TRANCOUNT > 0
		ROLLBACK TRAN
END CATCH
--*****************
DECLARE @Probs int
BEGIN TRY
	SELECT 'This will work'
	BEGIN TRY
		SELECT * FROM #Temp --This line generate error that catch cluase does trap that.
	END TRY
	BEGIN CATCH
		SELECT 'The second catch block'
	END CATCH
	SELECT 'And then this will now work'
END TRY
BEGIN CATCH
	SELECT 'An error has occurred at line ' +LTRIM(STR(ERROR_LINE())) +' with error ' + LTRIM(STR(ERROR_NUMBER())) + ' ' + ERROR_MESSAGE()
END CATCH
--************
--Bubble Up:
BEGIN TRY
	SELECT 'Outer level'
	BEGIN TRY
		SELECT 'Inner level';
		THROW 51200, 'Inner level throw', 1
	END TRY
	BEGIN CATCH
		SELECT 'Inner Catch with re-throw';
		THROW
	END CATCH
END TRY
BEGIN CATCH
	SELECT 'Outer Catch';
	THROW
END CATCH