CREATE TABLE [dbo].[Message]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Sender] UNIQUEIDENTIFIER NOT NULL, 
    [Receiver] UNIQUEIDENTIFIER NOT NULL, 
    [Message] NVARCHAR(MAX) NULL, 
    [Attchment] BINARY(50) NULL, 
    [Timestamp] DATETIME NOT NULL

	foreign key ( Sender ) references Users (UserId)
	foreign key (Receiver) references Users (UserId), 
    [MessageRead] BIT NULL

)