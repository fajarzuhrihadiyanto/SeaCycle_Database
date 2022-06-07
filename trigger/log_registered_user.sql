CREATE OR ALTER TRIGGER log_registered_user ON Customers AFTER INSERT
AS
    BEGIN
       SET NOCOUNT ON;

       DECLARE @username VARCHAR(32);
       SELECT @username = INSERTED.username FROM INSERTED;

       INSERT INTO RegistrationLog VALUES (GETDATE(), @username);
    END;
