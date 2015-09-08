CREATE PROCEDURE [dbo].[usp_Message_Read]
	@Receiver uniqueidentifier
AS

BEGIN
	SELECT * FROM Message
	WHERE Receiver = @Receiver
		AND MessageRead = 0 
END
