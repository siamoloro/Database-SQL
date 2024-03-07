/*=================================================================
FileName: Create_AddChar_Procedure.sql
Programmer Name: Osiame Moloro
Date modified: 07 February 2023
Operating system: SQL Server
Description: This file creates an add character procedure that allows us to add a character to the specfied account.
=================================================================*/

USE MMORPG_DB
GO

--This procedure will be used to add a character to a specified account.
CREATE PROCEDURE spAddChar
@playerName VARCHAR(30),
@playerTeam VARCHAR(30),
@playerSkills INT,
@accountName VARCHAR(50)
AS
BEGIN
	--Check to ensure that the Account name exists.
	IF EXISTS(SELECT accountName FROM Account
		      WHERE accountName = @accountName)
	BEGIN
		INSERT INTO Player
		VALUES(@playerName, @playerTeam, @playerSkills, @accountName)
	END
	ELSE
	BEGIN
		PRINT 'Account Name does not exist, please enter an account name that already exists.'
		INSERT INTO ErrorLog
		VALUES('Adding Player', 'User entered an invalid account name.')
	END
END
GO

--Now lets test our newly created procedure.
EXEC spAddChar 'Destoyer', 'Skull Krushers', 1, 'acc59593'
GO

--Note that the account name in this query does not exist so it should give you an error message 
--and add the error details to the ErrorLog table.
EXEC spAddChar 'Flying King', 'Death Team', 1, 'acc46583' 
GO

--Now lets see if the character has been added to the specified account in the Player table.
SELECT *
FROM Player
GO

--Now lets see if the error details has been added to the ErrorLog table.
SELECT *
FROM ErrorLog
GO