CREATE VIEW DocumentItemPriceView AS SELECT 
    DI.Id AS DocumentItemId,
    -- If cart discount exist
    CASE WHEN D.Discount > 0 THEN
        -- Percentage discount on cart
        CASE WHEN D.DiscountType = 0 THEN
            -- Calculate cart percentage discount on previously calculated price with discount
            (DI.PriceAfterDiscount / ROUND(100,2)) * (ROUND(100,2) - D.Discount)
        ELSE 
            -- Cart fixed discount subtracted from price with tax
            DI.PriceAfterDiscount - (((D.Discount * ROUND(DI.Total,2)) / (ROUND(D.Total,2) + D.Discount)) / DI.Quantity)
        END
    ELSE 
        DI.PriceAfterDiscount
    END 
    AS Price
FROM     DocumentItem DI INNER JOIN
         Document D ON D.Id = DI.DocumentId