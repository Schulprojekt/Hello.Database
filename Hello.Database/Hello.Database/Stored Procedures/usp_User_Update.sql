CREATE PROCEDURE [dbo].[usp_User_Update]
	@UserId uniqueidentifier,
	@AliasName NVARCHAR(100),
	@AccountName NVARCHAR(100),
	@AccountState NVARCHAR(100),
	@Picture BINARY(50),
	@ExpierencePionts int
AS
BEGIN
	Update Users SET
	AliasName = @AliasName,
	AccountState = @AccountState,
	Picture = @Picture,
	ExpierencePoints = @ExpierencePionts
END
