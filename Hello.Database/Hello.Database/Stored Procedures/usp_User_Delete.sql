CREATE PROCEDURE [dbo].[usp_User_Delete]
	@AccountName NVARCHAR(100)
AS
Begin
	Delete  FROM Users
	WHERE AccountName = @AccountName
End