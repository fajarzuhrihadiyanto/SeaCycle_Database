CREATE OR ALTER PROCEDURE insert_withdrawal @date DATETIME2 = NULL, @customer INT, @payment_type INT, @amount DECIMAL(8)
AS
    BEGIN TRANSACTION
    DECLARE @balance DECIMAL(8)
    SET @balance = (SELECT balance FROM Customers WHERE id = @customer)

    IF @amount <= @balance
        BEGIN
           INSERT INTO Withdrawals VALUES(COALESCE(@date, GETDATE()), @customer, @payment_type, @amount)
           UPDATE Customers SET balance = balance - @amount WHERE id = @customer
        END

    IF @@TRANCOUNT > 0
        COMMIT TRANSACTION
GO
