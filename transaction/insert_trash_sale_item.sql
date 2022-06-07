CREATE OR ALTER PROCEDURE insert_trash_sale_item @trash_sale_id INT, @trash_type_id INT, @total_weight_kg FLOAT
AS
    BEGIN TRANSACTION

    DECLARE @price DECIMAL(8);
    SET @price = (SELECT dbo.get_price_by_kg(@trash_type_id, @total_weight_kg));

    INSERT INTO TrashSaleItems
    VALUES(@trash_sale_id, @trash_type_id, @total_weight_kg, @price);

    UPDATE TrashSales
    SET total_price = total_price + @price, total_weight_kg = total_weight_kg + @total_weight_kg
    WHERE id = @trash_sale_id;

    COMMIT TRANSACTION
GO;
