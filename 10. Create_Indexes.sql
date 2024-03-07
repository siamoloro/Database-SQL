/*=================================================================
FileName: Create_Indexes.sql
Programmer Name: Osiame Moloro
Date modified: 07 February 2023
Operating system: SQL Server
Description: This file creates indexes for the tables in my database.
=================================================================*/

USE MMORPG_DB
GO

--Creating a non-clustered index on the accountStatus column Account table.
CREATE INDEX idx_account
ON Account
(
	accountStatus
)
GO

--Creating a non-clustered index on the personName column Person table.
CREATE INDEX idx_person
ON Person
(
	personName
)
GO

--Creating a non-clustered index on the playerTeam column Player table.
CREATE INDEX idx_player
ON Player
(
	playerTeam
)
GO

--Creating a non-clustered index on the quantity column Inventory table.
CREATE INDEX idx_inventory
ON Inventory
(
	quantity
)
GO

--Creating a non-clustered index on the itemName column in the Item table.
CREATE INDEX idx_item
ON Item
(
	itemName
)
GO

--Creating a non-clustered index on the errorType column in the ErrorLog table.
CREATE INDEX idx_errorLog
ON ErrorLog
(
	errorType
)
GO