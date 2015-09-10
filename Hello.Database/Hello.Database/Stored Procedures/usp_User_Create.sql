CREATE PROCEDURE [dbo].[usp_User_Create]
	@UserId uniqueidentifier,
	@AliasName NVARCHAR(100),
	@AccountName NVARCHAR(100)
AS
Begin
	INSERT INTO Users (UserId,AliasName,AccountName) Values(@UserId,@AliasName,@AccountName)
End
