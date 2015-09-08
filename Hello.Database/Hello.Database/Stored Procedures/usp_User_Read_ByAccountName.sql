CREATE PROCEDURE [dbo].[usp_User_Read_ByAccountName]
	@AccountName NVARCHAR(100)
AS
Begin
SELECT * FROM Users
WHERE AccountName = @AccountName
END

