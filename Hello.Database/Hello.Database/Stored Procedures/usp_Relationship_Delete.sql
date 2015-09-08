CREATE PROCEDURE [dbo].[usp_Relationship_Delete]
@UserId uniqueidentifier

AS

BEGIN
	DELETE FROM Relationship
	WHERE UserId = @UserId
END