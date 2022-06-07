CREATE OR ALTER FUNCTION get_price_by_kg (
    @trash_type INT,
    @weight_kg INT
)
RETURNS DECIMAL(8)
AS
BEGIN
    DECLARE @price DECIMAL(8);

    SET @price = (SELECT @weight_kg * price_per_kg FROM TrashTypes WHERE id = @trash_type)

    RETURN @price
END;
