CREATE PROCEDURE [dbo].[usp_User_Create]
	@UserId uniqueidentifier,
	@FirstName NVARCHAR(100),
	@LastName NVARCHAR(100),
	@AccountName NVARCHAR(100)
AS
Begin
	INSERT INTO Users (UserId,FirstName,LastName,AccountName) Values(@UserId,@FirstName,@LastName,@AccountName)
End
