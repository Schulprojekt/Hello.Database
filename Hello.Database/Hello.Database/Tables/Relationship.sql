CREATE TABLE [dbo].[Relationship]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [UserId] UNIQUEIDENTIFIER NOT NULL, 
    [FriendsId] UNIQUEIDENTIFIER NOT NULL

	foreign key (UserId) references Users (UserId)
)
