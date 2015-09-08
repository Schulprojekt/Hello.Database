IF EXISTS(SELECT * 
			FROM INFORMATION_SCHEMA.Databases
			WHERE Database_Name = 'Hello')
BEGIN
DROP Database Hello
END;

CREATE DATABASE Hello;

USE Hello;

IF EXISTS(SELECT * 
           FROM   INFORMATION_SCHEMA.TABLES 
           WHERE  TABLE_NAME = 'Users')
BEGIN
DELETE FROM Users
END;

CREATE TABLE Users
(
	[UserId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, 
    [FirstName] NVARCHAR(100) NULL, 
    [LastName] NVARCHAR(100) NULL, 
    [AccountName] NVARCHAR(100) NULL, 
    [AccountState] NVARCHAR(50) NULL, 
    [ExpierencePoints] INT NULL, 
    [Picture] BINARY(50) NULL
);
