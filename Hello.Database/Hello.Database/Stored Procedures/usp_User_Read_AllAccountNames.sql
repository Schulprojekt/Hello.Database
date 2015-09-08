CREATE PROCEDURE [dbo].[usp_User_Read_AllAccountNames]

AS
Begin
SELECT AccountName FROM Users
END
