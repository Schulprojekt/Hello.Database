CREATE PROCEDURE [dbo].[usp_User_Read_ByUserId]
	@UserId uniqueidentifier
AS
Begin
	SELECT * FROM Users
	WHERE UserId = @UserId
END
