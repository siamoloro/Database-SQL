/*=================================================================
FileName: Create_Triggers.sql
Programmer Name: Osiame Moloro
Date modified: 07 February 2023
Operating system: SQL Server
Description: This file creates two triggers for the Account table and the Player table.
=================================================================*/

USE MMORPG_DB
GO

--Now let us create two triggers for the Account table.
--This trigger displays a message after a new record is added to the Account table.
CREATE TRIGGER tr_account
ON Account
AFTER INSERT
AS
BEGIN
	PRINT 'A new account record has been entered.'
END
GO

--This trigger displays a message after a record has been updated in the Account table.
CREATE TRIGGER tr_accountUpdate
ON Account
AFTER UPDATE
AS
BEGIN
	PRINT 'A record has been updated in the Account table.'
END
GO

--Next let us create two triggers for the Player table.
--This trigger displays a message after a new record is added to the Player table.
CREATE TRIGGER tr_player
ON Player
AFTER INSERT
AS
BEGIN
	PRINT 'A new player record has been entered.'
END
GO

--This trigger displays a message after a record has been updated in the Player table.
CREATE TRIGGER tr_playerUpdate
ON Player
AFTER UPDATE
AS
BEGIN
	PRINT 'A record has been updated in the Player table.'
END
GO

--This trigger displays a message after a record has been added in the Inventory table.
CREATE TRIGGER tr_Inventory
ON Inventory
AFTER INSERT
AS
BEGIN
	PRINT 'A record has been added in the Inventory table.'
END
GO

--This trigger displays a message after a record has been added in the ErrorLog table.
CREATE TRIGGER tr_errorLog
ON ErrorLog
AFTER INSERT
AS
BEGIN
	PRINT 'A record has been added in the ErrorLog table.'
END
GO

--Now lets test our newly created triggers.
INSERT INTO Account
VALUES('acc45119', 'Molefe887', 12, 'Open', 'thabiso559@gmail.com')
GO

UPDATE Account
SET accountTime = accountTime + 12
WHERE accountName = 'acc45119'
GO

INSERT INTO Player
VALUES('Fighter', 'Death Team', 1, 'acc45119')
GO

UPDATE Player
SET playerSkillLevel = playerSkillLevel + 1
WHERE playerName = 'Fighter'
GO

INSERT INTO Inventory
VALUES('John Wick', 3, 10)
GO

INSERT INTO ErrorLog
VALUES('Display', 'Screen resolution selected iS not supported')
GO
