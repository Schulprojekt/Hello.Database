CREATE PROCEDURE [dbo].[usp_Message_Readed]
	@ID int
AS

BEGIN
	UPDATE Message SET
	MessageRead = 1
	WHERE ID = @ID
END