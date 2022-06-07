-- INSERT TRANSACTION ITEM
CREATE OR ALTER PROCEDURE insert_transaction_item @transaction INT, @trash_type INT, @total_weight_g FLOAT
AS
    BEGIN TRANSACTION

    DECLARE @cost DECIMAL(8);
    SET @cost = (SELECT dbo.get_price_by_g(@trash_type, @total_weight_g));

    INSERT INTO TransactionItems
    VALUES(@transaction, @trash_type, @total_weight_g, @cost);

    UPDATE Transactions
    SET total_cost = total_cost + @cost, total_weight_g = total_weight_g + @total_weight_g
    WHERE id = @transaction;

    UPDATE Customers
    SET balance = balance + @cost
    WHERE id = (SELECT customer_id FROM Transactions WHERE id = @transaction);

    COMMIT TRANSACTION
GO
