/*=================================================================
FileName: Create_AddTime_Procedure.sql
Programmer Name: Osiame Moloro
Date modified: 07 February 2023
Operating system: SQL Server
Description: This file creates an add time procedure that allows us to add time to the specfied account.
=================================================================*/


USE MMORPG_DB
GO

--This procedure will be used to add the specified time in Days to the specified account.
CREATE PROCEDURE spAddTime
@AccountName VARCHAR(50),
@AccountDays INT
AS
BEGIN
	--Check to ensure that the account exists.
	IF EXISTS(SELECT accountName FROM Account
			  WHERE accountName = @AccountName)
	BEGIN
		UPDATE Account
		--Note that the accountStatus will be changed to Open after adding time in case it was Blocked.
		SET accountTime = accountTime + @AccountDays, accountStatus = 'Open'
		WHERE accountName = @AccountName
	END
	ELSE
		BEGIN
			PRINT 'The account does not exist, please enter an account name that exists.'
			INSERT INTO ErrorLog
			VALUES('Adding Time', 'User entered an account name that did not exist.')
		END
END
GO

--Now lets test our newly created procedure.
EXEC spAddTime 'acc29210', 7
GO

--Note that the account name in this query does not exist so it should give you an error message and add the error details to the ErrorLog table.
EXEC spAddTime 'acc29410', 7
GO

--Now lets see if the time has been added to the accountTime column of the specified account in the Account table.
SELECT *
FROM Account
GO

--Now lets see if the error details has been added to the ErrorLog table.
SELECT *
FROM ErrorLog
GO
