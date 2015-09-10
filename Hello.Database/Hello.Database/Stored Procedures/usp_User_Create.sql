CREATE PROCEDURE [dbo].[usp_User_Create]
	@UserId uniqueidentifier,
	@Password binary(50),
	@AccountName NVARCHAR(100)
AS
Begin
	INSERT INTO Users (UserId,Password,AccountName) Values(@UserId,@Password,@AccountName)
End
