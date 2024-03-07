/*=================================================================
FileName: Create_Register_Procedure.sql
Programmer Name: Osiame Moloro
Date modified: 07 February 2023
Oprating System: SQL Server
Description: This file creates a register procedure that allows us to register a new account.
=================================================================*/


USE MMORPG_DB
GO

--This procedure will be used to add more accounts in our Account table.
CREATE PROCEDURE spRegister
--User supplied values.
@name VARCHAR(50),
@password VARCHAR(30),
@accountTime INT,
@accountStatus VARCHAR(10),
@personEmail VARCHAR(40)
AS
BEGIN
	--Checks to ensure that the name does not already exist in the table.
	IF NOT EXISTS(SELECT accountName FROM Account
				  WHERE accountName = @name)
	BEGIN
		--Checks to ensure that the accountTime in Days is a positive number.
		IF @accountTime < 0
			BEGIN
				PRINT 'Please enter a time that is above 0.'
				INSERT INTO ErrorLog
				VALUES('Account Reg', 'User entered a time in days that was below 0.')
				RETURN
			END
		INSERT INTO Account
		VALUES(@name, @password, @accountTime, @accountStatus, @personEmail)
	END
	ELSE
		BEGIN
			PRINT 'That account already exists'
			INSERT INTO ErrorLog
            VALUES('Account Reg', 'User tryed to register with a name that already exists.')
		END
END
GO

--Now lets test our newly created procedure.
--Note that the person email should exist before being entered.
EXEC spRegister 'acc67109', 'captino334', 30, 'Open', 'mpho69gmail.com'
GO

--Note that the accountTime in this query is not a positive number so it should give us an error message and add the error details to the ErrorLog table.
EXEC spRegister 'acc34109', 'Binary1011', -30, 'Blocked', 'trace12@icloud.com'
GO

--Now lets see if the account has been added successfully to the Account table.
SELECT *
FROM Account
GO

--Now lets see if the error details has been added to the ErrorLog table.
SELECT *
FROM ErrorLog
GO