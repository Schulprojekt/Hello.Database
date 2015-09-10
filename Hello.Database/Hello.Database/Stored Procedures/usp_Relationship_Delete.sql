CREATE PROCEDURE [dbo].[usp_Relationship_Delete]
@UserId uniqueidentifier,
@FriendId Uniqueidentifier

AS

BEGIN
	DELETE FROM Relationship
	WHERE UserId = @UserId And FriendsId = @FriendId
END