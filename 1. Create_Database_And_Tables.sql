 /*=============================================================
Filename: Create_Database_And_Tables.sql
Programmer: Osiame Moloro
Date modified: 07 February 2023
Operating system: SQL Server
Description: This file will create the database and tables with the necessary constraints.
=============================================================*/

USE master
GO

--If this database already exists, we will delete it first.
IF EXISTS(SELECT name FROM master.dbo.sysdatabases
	       WHERE name = 'MMORPG_DB')
BEGIN
	DROP DATABASE MMORPG_DB
	PRINT 'The database has been deleted'
END

--Now we will create the databse.
--PLEASE NOTE, that a file named MMORPG must be created in the hard drive before this query is executed!
CREATE DATABASE MMORPG_DB
ON PRIMARY
(
	NAME = 'mmorpg_db',
	FILENAME = 'C:\MMORPG\mmorpg_db.mdf',
	SIZE = 5MB,
	FILEGROWTH = 10% 
)
LOG ON
(
	NAME = 'mmorpg_db_log',
	FILENAME = 'C:\MMORPG\mmorpg_db_log.ldf',
	SIZE = 5MB,
	FILEGROWTH = 10% 
)
GO

PRINT 'Database created successfully.'
GO

--Next we will create the filegoup for the datafiles.
--We will also create the secondary data file as it is needed when creating the filegroup.
--A filegroup makes the readability of information faster.

ALTER DATABASE MMORPG_DB
ADD FILEGROUP mmorpg_db_filegroup
GO

PRINT 'Filegroup created successfully.'
GO

ALTER DATABASE MMORPG_DB
ADD FILE
(
	NAME = 'mmorpg_db_secondary',
	FILENAME = 'C:\MMORPG\mmorpg_db_secondary.ndf',
	SIZE = 5MB,
	FILEGROWTH = 10% 
)
TO FILEGROUP mmorpg_db_filegroup
GO

PRINT 'Secondary file created and added to filegroup successfully.'
GO

--Next we will create the tables and should be done within the same script files as creating the database.
--It is a good programming habit to put keywords in capital letters.
--Please note when creating tables, we start with the parent tables.
--When you have to drop tables, we start from the child tables.

USE MMORPG_DB
GO

CREATE TABLE Person(
	personEmail VARCHAR(40) NOT NULL,
	personName VARCHAR(40) NOT NULL,
	personCountry VARCHAR(50) NULL,
	CONSTRAINT personEmail_PK PRIMARY KEY(personEmail)
)
GO

PRINT 'Person table created successfully.'
GO

CREATE TABLE Account(
	accountName VARCHAR(50) NOT NULL,
	accountPassword VARCHAR(30) NOT NULL,
	accountTime INT NOT NULL,
	accountStatus VARCHAR(10) NOT NULL,
	personEmail VARCHAR(40) NOT NULL,
	CONSTRAINT accountName_PK PRIMARY KEY(accountName),
	CONSTRAINT accountName_UNIQUE UNIQUE(accountName),--Unique constraint use to ensure the account name is unique.
	CONSTRAINT accountTime_CHECK CHECK(accountTime >=0),--Check constraint to ensure the accountTime in Days is a positive number.
	CONSTRAINT accountStatus_CHECK CHECK(accountStatus = 'Blocked' OR accountStatus = 'Open'),--Check constraint to ensure the accountStatus values are either blocked or open.
	CONSTRAINT personEmail_FK FOREIGN KEY(personEmail) REFERENCES Person(personEmail)
	ON DELETE CASCADE--On delete cascade to ensure that during deletion the rows in all dependent tables are deleted.
)
GO

PRINT 'Account table created successfully.'
GO
 
CREATE TABLE Player(
	playerName VARCHAR(30) NOT NULL,
	playerTeam VARCHAR(30) NOT NULL,
	playerSkillLevel INT DEFAULT(1) NOT NULL,--Default sets playerSkillLevel to 1.
	accountName VARCHAR(50) NOT NULL,
	CONSTRAINT playerName_PK PRIMARY KEY(playerName),
	CONSTRAINT accountName_FK FOREIGN KEY(accountName) REFERENCES Account(accountName)
	ON DELETE CASCADE--On delete cascade to ensure that during deletion the rows in all dependent tables are deleted.
)
GO

PRINT 'Player table created successfully.'
GO

CREATE TABLE Item(
	itemNum INT IDENTITY NOT NULL,
	itemName VARCHAR(30) NOT NULL,
	itemDescription VARCHAR(50) NULL,
	CONSTRAINT itemNum_PK PRIMARY KEY(itemNum)
)
GO

PRINT 'Item table created successfully.'
GO

CREATE TABLE Inventory(	
	playerName VARCHAR(30) NOT NULL,
	itemNum INT NOT NULL,
	quantity INT NOT NULL,
	PRIMARY KEY(playerName ,itemNum),--Creating a composite primary key for an intersection table.
	CONSTRAINT playerName_FK FOREIGN KEY(playerName) REFERENCES Player(playerName),
	CONSTRAINT itemNum_FK FOREIGN KEY(itemNum) REFERENCES Item(itemNum)
	ON DELETE CASCADE--On delete cascade to ensure that during deletion the rows in all dependent tables are deleted.
)
GO

PRINT 'Inventory table created successfully.'
GO

CREATE TABLE ErrorLog(
	errorNum INT IDENTITY NOT NULL,
	errorType VARCHAR(20) NOT NULL,
	errorDescription VARCHAR(50) NOT NULL,
	CONSTRAINT errorNum_PK PRIMARY KEY(errorNum)
)
GO

PRINT 'Error table created successfully.'
GO