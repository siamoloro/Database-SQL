/*=================================================================
FileName: Create_SendLetter_Procedure.sql
Programmer Name: Osiame Moloro
Date modified: 07 February 2023
Operating system: SQL Server
Description: This file creates a send letter procedure that allows us to prints out a letter 
for each account, indicating how much time they have left.
=================================================================*/

USE MMORPG_DB
GO

--This procedure will be used to print out a letter for each account, 
--indicating how much time they have left.
CREATE PROCEDURE spSendLetter
@news TEXT NULL
AS
BEGIN
	--Next we should declare any variables we will need
	DECLARE @personEmail VARCHAR(40)
	DECLARE @personName VARCHAR(40)
	DECLARE @personCountry VARCHAR(50)
	DECLARE @accountName VARCHAR(50)
	DECLARE @accountTimeStatus INT

	--Next we will create a temporary copy of the Person table.
	SELECT *
	INTO #TempPerson
	FROM Person

	--Next we will add a column named Printed.
	ALTER TABLE #TempPerson
	ADD Printed SMALLINT
	
	--Then we set all values to that column to 0.
	UPDATE #TempPerson
	SET Printed = 0

	--Next we will create a while loop that will iterate through all the rows.
	WHILE EXISTS(SELECT * FROM #TempPerson
				 WHERE Printed = 0)
	BEGIN
		SELECT @personEmail = MIN(personEmail) FROM #TempPerson
		WHERE Printed = 0
		--Next we will retreive all the values that we want to print.
		SELECT @personEmail = #TempPerson.personEmail,
			   @personName = #TempPerson.personName,
			   @accountName = Account.accountName,
			   @accountTimeStatus = Account.accountTime
		FROM #TempPerson
		JOIN Account
		ON #TempPerson.personEmail = Account.personEmail
		--Retrieve all repeating data where the specified personEmail and accountTimeStatus match.
		WHERE @personEmail = #TempPerson.personEmail

		--Next we will print the letter starting with the heading.
		PRINT '========================================================='
		PRINT 'Massive Multiplayer Online Role Playing Game'
		PRINT 'Topic: Time Left Notice'
		PRINT '========================================================='
		
		PRINT 'Greetings, ' + @personName
		PRINT 'We have sent this letter to inform you that your account '+@accountName+
			  ' is set to expire in '+CAST(@accountTimeStatus AS VARCHAR)+' days.'
		PRINT 'Regard, Customer Care'

		--Next we print the news if they are there.
		IF NOT(@news IS NULL)
		BEGIN
			PRINT @news
		END

		--Next we will change the value of Printed to 1 where the specified personEmail match to indicate 
		--that it has been printed and does not need to be read again.
		UPDATE #TempPerson
		SET Printed = 1
		WHERE @personEmail = #TempPerson.personEmail
	END
END
GO

--Now lets test our newly created procedure.
EXEC spSendLetter 'Version 16.1 is out now, update now!'
GO