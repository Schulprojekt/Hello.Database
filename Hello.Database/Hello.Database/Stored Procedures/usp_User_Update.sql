CREATE PROCEDURE [dbo].[usp_User_Update]
	@UserId uniqueidentifier,
	@FirstName NVARCHAR(100),
	@LastName NVARCHAR(100),
	@AccountName NVARCHAR(100),
	@AccountState NVARCHAR(100),
	@Picture BINARY(50),
	@ExpierencePionts int
AS
BEGIN
	Update Users SET
	FirstName = @FirstName,
	LastName = @LastName,
	AccountState = @AccountState,
	Picture = @Picture,
	ExpierencePoints = @ExpierencePionts
END
