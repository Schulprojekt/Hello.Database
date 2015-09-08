CREATE PROCEDURE [dbo].[usp_Message_Create]
	@Sender uniqueIdentifier,
	@Receiver uniqueidentifier,
	@Message NVARCHAR (MAX),
	@Attchment BINARY (50)
AS

BEGIN
	INSERT INTO Message (Sender, Receiver, Message, Attchment, Timestamp, MessageRead) VALUES (@Sender,@Receiver, @Message, @Attchment, GETDATE(), 0)
END
