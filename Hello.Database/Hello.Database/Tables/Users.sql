﻿CREATE TABLE [dbo].[Users]
(
	[UserId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, 
    [AliasName] NVARCHAR(100) NULL, 
    [AccountName] NVARCHAR(100) NOT NULL, 
    [AccountState] NVARCHAR(50) NULL, 
    [ExpierencePoints] INT NULL, 
    [Picture] BINARY(50) NULL, 
    [Password] BINARY(50) NOT NULL
)
