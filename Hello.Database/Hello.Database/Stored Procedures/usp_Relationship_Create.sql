CREATE PROCEDURE [dbo].[usp_Relationship_Create]
	@UserId uniqueidentifier,
	@FriendId uniqueidentifier
AS
Begin
	INSERT INTO Relationship (UserId, FriendsId) VALUES (@UserId, @FriendId)
END