CREATE OR ALTER FUNCTION get_price_by_g (
    @trash_type INT,
    @weight_g INT
)
RETURNS DECIMAL(8)
AS
BEGIN
    DECLARE @price DECIMAL(8);

    SET @price = (SELECT @weight_g * price_per_100g / 100 FROM TrashTypes WHERE id = @trash_type)

    RETURN @price
END;
