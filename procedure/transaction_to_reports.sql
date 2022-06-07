CREATE OR ALTER PROCEDURE transaction_to_reports @date DATE, @location INT, @garbage_center INT
AS
    BEGIN
        DECLARE @trash_type INT;
        DECLARE @inserted_report_id INT;
        DECLARE @total_weight_g FLOAT;
        DECLARE @total FLOAT;
        SET @total = 0;

        INSERT INTO Reports VALUES (@date, @location, @garbage_center, 0);
        SET @inserted_report_id = (SELECT SCOPE_IDENTITY())

        DECLARE TRASH_TYPE_CURSOR CURSOR FAST_FORWARD LOCAL FOR
            SELECT id FROM TrashTypes

        OPEN TRASH_TYPE_CURSOR
        FETCH NEXT FROM TRASH_TYPE_CURSOR INTO @trash_type

        WHILE @@FETCH_STATUS = 0
            BEGIN
                SET @total_weight_g = (SELECT SUM(ti.total_weight_g) FROM TransactionItems ti INNER JOIN Transactions T2 on T2.id = ti.transaction_id
                WHERE ti.trash_type_id = @trash_type AND T2.location_id = @location AND T2.datetime >= @date AND T2.datetime < DATEADD(day, 1, @date));

                IF @total_weight_g IS NOT NULL
                    BEGIN
                        SET @total = @total + @total_weight_g;
                        INSERT INTO ReportItems VALUES (@inserted_report_id, @trash_type, @total_weight_g);
                    END

                FETCH NEXT FROM TRASH_TYPE_CURSOR INTO @trash_type
            END

        CLOSE TRASH_TYPE_CURSOR

        UPDATE Reports SET total_weight_g = @total WHERE id = @inserted_report_id
    END
GO

