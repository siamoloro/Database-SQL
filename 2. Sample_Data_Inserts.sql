/*=================================================================== 
FileName: Sample_Data_Inserts.sql
Programmer: Osiame Moloro
Date modified: 07 February 2023
Operating system: SQL Server
Description: This file will insert sample data into the database.
=====================================================================*/
 
USE MMORPG_DB
GO

INSERT INTO Person(personEmail, personName, personCountry)
VALUES('jones10@live.com', 'Jones', 'Brazil'),
	  ('raymond61@gmail.com', 'Raymond', 'USA'),
	  ('trace12@icloud.com', 'Trace', 'Canada'),
	  ('henrry40@gmail.com', 'Henrry', 'Russia'),
	  ('donald23@live.com', 'Donald', 'RSA'),
	  ('rechard21@icloud.com', 'Rechard', 'USA'),
	  ('thabang44@icloud.com', 'Thabang', 'South Africa'),
	  ('kgomotso65@gmail.com', 'Kgomotso', 'South Africa'),
	  ('thabiso559@gmail.com', 'Thabiso', 'South Africa'),
	  ('mpho69gmail.com', 'Mpho', 'South Africa')
GO
--Please note that when inserting a foreign key value, it must be existing.
INSERT INTO Account(accountName, accountPassword, accountTime, accountStatus, personEmail)
VALUES('acc22432', 'Jones1998', 11, 'Open', 'jones10@live.com'),
      ('acc32345', 'IloveGuns100', 33, 'Open', 'raymond61@gmail.com'),
	  ('acc59593', 'TraceMain309', 0, 'Blocked', 'trace12@icloud.com'),
	  ('acc77065', 'Onlinegames4life', 0, 'Blocked', 'henrry40@gmail.com'),
	  ('acc47674', 'Donny2003', 5, 'Open', 'donald23@live.com'),
	  ('acc03657', 'Rechard2002', 18, 'Open', 'rechard21@icloud.com'),
	  ('acc96943', 'ThabangSetope445', 0, 'Blocked', 'thabang44@icloud.com'),
	  ('acc11023', 'Kgomo3321', 3, 'Open', 'kgomotso65@gmail.com'),
	  ('acc71959', 'thabsT1161', 0, 'Blocked', 'thabiso559@gmail.com'),
	  ('acc29210', 'mphoza4110', 0, 'Blocked', 'mpho69gmail.com')
GO

INSERT INTO Player(playerName, playerTeam, playerSkillLevel, accountName)
VALUES('KillerX', 'Calm Outlaws', 349, 'acc22432'),
      ('John Wick', 'Calm Outlaws', 201, 'acc32345'),
	  ('Sniper', 'The Human Targets', 390, 'acc59593'),
	  ('Hit Man', 'Skull Krushers', 478, 'acc77065'),
	  ('The Slaughter', 'Skull Krushers', 263, 'acc47674'),
	  ('Predator', 'Tiger Commandos', 372, 'acc03657'),
	  ('Master X', 'Death Team', 574, 'acc47674'),
	  ('Plantum', 'Skull Krushers', 773, 'acc96943'),
	  ('Yellow Blood', 'Death Team', 613, 'acc03657'),
	  ('Hero', 'Triger Commandos', 365, 'acc11023'),
	  ('Gimmy Pig', 'Killer Robots', 813, 'acc77065'),
	  ('Hammer', 'Death Team', 319, 'acc11023'),
	  ('Gun Man', 'Team X', 890, 'acc29210'),
	  ('Ranger', 'Killer Robots', 556, 'acc29210'),
	  ('Looter', 'Team X', 611, 'acc71959'),
	  ('4 Slices', 'Killer Robots', 1356, 'acc22432'),
	  ('Trouble Maker', 'Death Team', 1456, 'acc03657'),
	  ('Tiger Hammer', 'Triger Commandos', 1124, 'acc77065'),
	  ('Jimmy Fox', 'Triger Commandos', 1078, 'acc71959'),
	  ('Gun Freak', 'Killer Robots', 891, 'acc71959'),
	  ('Young Killer', 'Death Team', 1134, 'acc96943'),
	  ('Blood Suckers', 'Skull Krushers', 890, 'acc59593'),
	  ('Godfry', 'The Human Targets', 1723, 'acc77065'),
	  ('Young King', 'Calm Outlaws', 820, 'acc47674'),
	  ('Jimmy Rock', 'Calm Outlaws', 771, 'acc11023')
GO

INSERT INTO Item(itemName, itemDescription)
VALUES('Night Googles', 'Helps to increase vision at night.'),
	  ('Drone', 'Allows you to get a visual at enemy bay.'),
	  ('Sniper', 'Kills enemy at long range.'),
	  ('Hunter Killer', 'Locates and destroy enemy.'),
	  ('First Aid', 'Increases life span.'),
	  ('Bullet Proof', 'Reduces bullet impact.'),
	  ('Radio', 'Gives access to communicate with other players.'),
	  ('Gloves of the polar bear','Gives you +40Billion attack power.'),
	  ('Dark helmet','Makes you invisible to any other player.'),
	  ('Cobra Speed', 'Makes you +100 faster.'),
	  ('Serpant boots','Adds 5million agility'),
	  ('parachute', 'Helps hit ground floor.'),
	  ('Yellow Stone', 'Gives you more attack power.'),
	  ('Sword of a thousand truths','Kills all players within a 72million mile radius.'),
	  ('Item Locator', 'Helps locate Items.'),
	  ('Bird Box', 'Helps send a message to other players.'),
	  ('Hammer', 'Helps to open locked item box'),
	  ('Key', 'Helps to open locked houses.'),
	  ('Camo', 'Helps to hide yourself.'),
	  ('Chop sticks', 'Enable you to fight enemy.'),
	  ('Fool Target', 'Helps to hide yourself.')
GO

INSERT INTO Inventory(playerName, itemNum, quantity)
VALUES('KillerX', 11, 14),
      ('John Wick', 4, 5),
	  ('Sniper',6, 12),
	  ('Hit Man', 12, 9),
	  ('The Slaughter', 1, 9),
	  ('Predator', 3, 15),
	  ('Trouble Maker', 7, 4),
	  ('Young Killer', 2, 6),
	  ('Gun Man', 3, 10), 
	  ('Jimmy Fox', 8, 13),
	  ('Blood Suckers', 20, 15),
	  ('4 Slices', 9, 8),
	  ('Gun Man', 9, 25),
	  ('Gimmy Pig', 21, 20),
	  ('Blood Suckers', 1, 16),
	  ('Tiger Hammer', 16, 22),
	  ('The Slaughter', 9, 17),
	  ('Godfry', 13, 18),
	  ('Gun Freak', 18, 24),
	  ('Looter',19, 16),
	  ('Young King', 18, 28),
	  ('Jimmy Fox', 18, 22),
	  ('Trouble Maker', 17, 29),
	  ('Master X', 2, 31),
	  ('Gun Freak', 6, 44),
	  ('Sniper', 15, 35),
	  ('Blood Suckers', 10, 8),
	  ('Yellow Blood', 6, 5),
	  ('Tiger Hammer', 14, 9),
	  ('Hero', 9, 13)
GO

INSERT INTO ErrorLog(errorType, errorDescription)
VALUES('In-game Purchase', 'Insufficient funds from bank.'),
      ('Input Device', 'Input device not connected.'),
	  ('Password', 'Password does not match.'),
	  ('Internet Connection', 'Internet connection lost.'),
	  ('Download', 'Game graphics not downloaded'),
	  ('Account', 'Account blocked')
GO