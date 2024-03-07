/*=================================================================
FileName: Create_AddItem_Procedure.sql
Programmer Name: Osiame Moloro
Date modified: 07 February 2023
Operating system: SQL Server
Description: This file creates an add item procedure that allows add items to a character’s inventory.
=================================================================*/

USE MMORPG_DB
GO

--This procedure will used to add items to the character's inventory.
CREATE PROCEDURE spAddItem
@playerName VARCHAR(30),
@itemNum INT,
@numItems INT
AS
BEGIN
	DECLARE @CountItems INT
	--Check to ensure that the player character exists.
	IF EXISTS(SELECT playerName FROM Player
			  WHERE playerName = @playerName)
	BEGIN
		SELECT @CountItems = COUNT(*)
		FROM Inventory
		WHERE playerName = @playerName
		--Check to ensure that there is space before adding the item.
		IF @CountItems <= 8
		BEGIN
			INSERT INTO Inventory
			VALUES(@playerName, @itemNum, @numItems)
		END
		ELSE
		BEGIN
			PRINT 'Too many items exist in this inventory, delete one or more.'
			--Note that the error details will be added to the ErrorLog table.
			INSERT INTO ErrorLog
			VALUES('Item Quant', 'User has no space left in the inventory')
		END
	END
	ELSE
	BEGIN
		PRINT 'Please enter a player name that exists.'
		--Note that the error details will be added to the ErrorLog table.
		INSERT INTO ErrorLog
		VALUES('Item Player', 'User has entered a player name that does not exist.')
	END
END
GO

--Now lets test our newly created procedure.
EXEC spAddItem 'Godfry', 1, 1
GO

--Now lets see if the item has been added to the specified player in the Inventory table.
SELECT *
FROM Inventory
GO

