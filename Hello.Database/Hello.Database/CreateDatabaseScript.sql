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
    [AliasName] NVARCHAR(100) NULL, 
    [AccountName] NVARCHAR(100) NOT NULL, 
    [AccountState] NVARCHAR(50) NULL, 
    [ExpierencePoints] INT NULL, 
    [Picture] BINARY(50) NULL, 
    [Password] BINARY(50) NOT NULL
);

IF EXISTS(SELECT * 
           FROM   INFORMATION_SCHEMA.TABLES 
           WHERE  TABLE_NAME = 'Relationship')
Begin
DELETE FROM Relationship
End;

CREATE TABLE Relationship
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [UserId] UNIQUEIDENTIFIER NOT NULL, 
    [FriendsId] UNIQUEIDENTIFIER NOT NULL

	foreign key (UserId) references Users (UserId)
);

IF EXISTS(SELECT * 
           FROM   INFORMATION_SCHEMA.TABLES 
           WHERE  TABLE_NAME = 'Message')
Begin
DELETE FROM Message
End;

CREATE TABLE Message
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Sender] UNIQUEIDENTIFIER NOT NULL, 
    [Receiver] UNIQUEIDENTIFIER NOT NULL, 
    [Message] NVARCHAR(MAX) NULL, 
    [Attchment] BINARY(50) NULL, 
    [Timestamp] DATETIME NOT NULL,
	[MessageRead] BIT NULL

	foreign key ( Sender ) references Users (UserId)
	foreign key (Receiver) references Users (UserId)   
);

IF EXISTS (SELECT * FROM  dbo.sysobjects where id = object_id(N'[dbo].[usp_User_Create]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	Drop Procedure [dbo].[usp_User_Create]
END
GO;

CREATE PROCEDURE [dbo].[usp_User_Create]
	@UserId uniqueidentifier,
	@Password binary(50),
	@AccountName NVARCHAR(100)
AS
Begin
	INSERT INTO Users (UserId,Password,AccountName) Values(@UserId,@Password,@AccountName)
End
GO;

IF EXISTS (SELECT * FROM  dbo.sysobjects where id = object_id(N'[dbo].[usp_User_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	Drop Procedure [dbo].[usp_User_Delete]
END
GO;

CREATE PROCEDURE [dbo].[usp_User_Delete]
	@AccountName NVARCHAR(100)
AS
Begin
	Delete  FROM Users
	WHERE AccountName = @AccountName
End
GO;

IF EXISTS (SELECT * FROM  dbo.sysobjects where id = object_id(N'[dbo].[usp_User_Read_AllAccountNames]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	Drop Procedure [dbo].[usp_User_Read_AllAccountNames]
END
GO;

CREATE PROCEDURE [dbo].[usp_User_Read_AllAccountNames]

AS
Begin
SELECT AccountName FROM Users
END
GO;

IF EXISTS (SELECT * FROM  dbo.sysobjects where id = object_id(N'[dbo].[usp_User_Read_ByAccountName]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	Drop Procedure [dbo].[usp_User_Read_ByAccountName]
END
GO;

CREATE PROCEDURE [dbo].[usp_User_Read_ByAccountName]
	@AccountName NVARCHAR(100)
AS
Begin
SELECT * FROM Users
WHERE AccountName = @AccountName
END
GO;

IF EXISTS (SELECT * FROM  dbo.sysobjects where id = object_id(N'[dbo].[usp_User_Update]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	Drop Procedure [dbo].[usp_User_Update]
END
GO;

CREATE PROCEDURE [dbo].[usp_User_Update]
	@UserId uniqueidentifier,
	@AliasName NVARCHAR(100),
	@AccountName NVARCHAR(100),
	@Password binary(50),
	@AccountState NVARCHAR(100),
	@Picture BINARY(50),
	@ExpierencePionts int
AS
BEGIN
	Update Users SET
	AliasName = @AliasName,
	AccountState = @AccountState,
	Picture = @Picture,
	ExpierencePoints = @ExpierencePionts,
	Password = @Password
END
GO;

IF EXISTS (SELECT * FROM  dbo.sysobjects where id = object_id(N'[dbo].[usp_Relationship_Create]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	Drop Procedure [dbo].[usp_Relationship_Create]
END
GO;

CREATE PROCEDURE [dbo].[usp_Relationship_Create]
	@UserId uniqueidentifier,
	@FriendId uniqueidentifier
AS
Begin
	INSERT INTO Relationship (UserId, FriendsId) VALUES (@UserId, @FriendId)
END
GO;

IF EXISTS (SELECT * FROM  dbo.sysobjects where id = object_id(N'[dbo].[usp_Relationship_Delete]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	Drop Procedure [dbo].[usp_Relationship_Delete]
END
GO;

CREATE PROCEDURE [dbo].[usp_Relationship_Delete]
@UserId uniqueidentifier,
@FriendId uniqueidentifier

AS

BEGIN
	DELETE FROM Relationship
	WHERE UserId = @UserId And FriendsId = @FriendId
END
GO;

IF EXISTS (SELECT * FROM  dbo.sysobjects where id = object_id(N'[dbo].[usp_Relationship_Read_AllFriends]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	Drop Procedure [dbo].[usp_Relationship_Read_AllFriends]
END
GO;

CREATE PROCEDURE [dbo].[usp_Relationship_Read_AllFriends]
@UserId uniqueidentifier
AS

BEGIN
	SELECT FriendsId FROM Relationship
	WHERE UserId = @UserId
END
GO;

IF EXISTS (SELECT * FROM  dbo.sysobjects where id = object_id(N'[dbo].[usp_Message_Create]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	Drop Procedure [dbo].[usp_Message_Create]
END
GO;

CREATE PROCEDURE [dbo].[usp_Message_Create]
	@Sender uniqueIdentifier,
	@Receiver uniqueidentifier,
	@Message NVARCHAR (MAX),
	@Attchment BINARY (50)
AS

BEGIN
	INSERT INTO Message (Sender, Receiver, Message, Attchment, Timestamp, MessageRead) VALUES (@Sender,@Receiver, @Message, @Attchment, GETDATE(), 0)
END
GO;

IF EXISTS (SELECT * FROM  dbo.sysobjects where id = object_id(N'[dbo].[usp_Message_Read]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	Drop Procedure [dbo].[usp_Message_Read]
END
GO;

CREATE PROCEDURE [dbo].[usp_Message_Read]
	@Receiver uniqueidentifier
AS

BEGIN
	SELECT * FROM Message
	WHERE Receiver = @Receiver
		AND MessageRead = 0 
END
GO;

IF EXISTS (SELECT * FROM  dbo.sysobjects where id = object_id(N'[dbo].[usp_Message_Readed]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	Drop Procedure [dbo].[usp_Message_Readed]
END
GO;

CREATE PROCEDURE [dbo].[usp_Message_Readed]
	@ID int
AS

BEGIN
	UPDATE Message SET
	MessageRead = 1
	WHERE ID = @ID
END