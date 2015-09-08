CREATE PROCEDURE [dbo].[usp_Relationship_Read_AllFriends]
@UserId uniqueidentifier
AS

BEGIN
	SELECT FriendsId FROM Relationship
	WHERE UserId = @UserId
END