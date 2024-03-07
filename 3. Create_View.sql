 /*=============================================================
Filename: Create_View.sql
Programmer: Osiame Moloro
Date modified: 07 February 2023
Operating system: SQL Server
Description: This file will be used to create views the Massive Multiplayer Online Role Playing Game (MMORPG).
=============================================================*/

--Take note that before I create a view, I first check if it exist, if it does, I drop it.
--When I have to retrieve information from more than one table,
--I have to join them through their primary and foreign key.

USE MMORPG_DB
GO

--I will first check if the vwBlockedAccounts view exists, if it does, I will drop it
IF EXISTS(SELECT Table_Name FROM INFORMATION_SCHEMA.VIEWS
		  WHERE Table_Name = 'vwBlockedAccounts')
BEGIN
	DROP VIEW vwBlockedAccounts
	PRINT 'vwBlockedAccounts view deleted successfully.'
END
GO

--I will now create a view for all the accounts that are currently blocked.
CREATE VIEW vwBlockedAccounts
AS
SELECT a.accountName 'Account Name', a.accountPassword 'Account Password', a.accountTime 'Account Time' ,a.accountStatus 'Account Status'
FROM Account a
WHERE accountStatus = 'Blocked'
GO

SELECT *
FROM vwBlockedAccounts
GO

--Now I will check if the vwTopSkill view exists, if it does, I will drop it
IF EXISTS(SELECT Table_Name FROM INFORMATION_SCHEMA.VIEWS
		  WHERE Table_Name = 'vwTopSkill')
BEGIN
	DROP VIEW vwTopSkill
	PRINT 'vwTopSkill view deleted successfully.'
END
GO 

--Now I will create a view for the top 20 characters with the highest skill levels and their account details.
CREATE VIEW vwTopSkill
AS
SELECT TOP 20 p.playerName 'Character Name', p.playerTeam 'Character Team', p.playerSkillLevel 'Character Skill Level', a.accountName 'Account Name', a.accountPassword 'Account Password', a.accountTime 'Account Time' ,a.accountStatus 'Account Status'
FROM Player AS p
JOIN Account AS a
ON p.accountName = a.accountName
ORDER BY p.playerSkillLevel DESC
GO

SELECT *
FROM vwTopSkill
GO

--Now I will check if the vwTopStackedItems view exists, if it does, I will drop it
IF EXISTS(SELECT Table_Name FROM INFORMATION_SCHEMA.VIEWS
		  WHERE Table_Name = 'vwTopStackedItems')
BEGIN
	DROP VIEW vwTopStackedItems
	PRINT 'vwTopStackedItems view deleted successfully.'
END
GO 

--Now I will create the view for the 20 items that are stacked most frequently, 
--including the characters whose inventory they are stacked in.
CREATE VIEW vwTopStackedItems
AS
SELECT TOP 20 i.itemName 'Item Name', i.itemDescription 'Item Description', inv.quantity 'Number Of Items', p.playerName 'Character Name', p.playerTeam 'Character Team', p.playerSkillLevel 'Character Skill Level'
FROM Player p
JOIN Inventory inv
ON p.playerName = inv.playerName
JOIN Item i
ON inv.itemNum = i.itemNum
ORDER BY inv.quantity DESC
GO

SELECT * 
FROM vwTopStackedItems
GO

--Now I will check if the vwPopItems view exists, if it does, I will drop it.
IF EXISTS(SELECT Table_Name FROM INFORMATION_SCHEMA.VIEWS
		  WHERE Table_Name = 'vwPopItems')
BEGIN
	DROP VIEW vwPopItems
	PRINT 'vwPopItems view deleted successfully.'
END
GO

--Now I will create the view for the five most popular items that are contained inside the character’s inventory, 
--including the number of characters that have the item.
CREATE VIEW vwPopItems
AS
SELECT TOP 5 i.itemName 'Item Name', COUNT(inv.quantity) 'Popularity', COUNT(inv.playerName) 'Number Of Characters'
FROM Item i
JOIN Inventory inv
ON i.itemNum = inv.itemNum
JOIN Player p
ON inv.playerName = p.playerName
GROUP BY i.itemName
ORDER BY Popularity DESC
GO

SELECT * 
FROM vwPopItems
GO
