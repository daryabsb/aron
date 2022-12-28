ALTER TABLE DocumentItem ADD COLUMN PriceAfterDiscount NUMERIC NOT NULL DEFAULT (0);
ALTER TABLE DocumentItem ADD COLUMN Total NUMERIC NOT NULL DEFAULT (0);

UPDATE DocumentItem SET 
       PriceAfterDiscount = ROUND(Price * (1.00 - (Discount / ROUND(100, 2))), 2),
       Total = ROUND(Quantity * ROUND(Price * (1.00 - (Discount / ROUND(100, 2))), 2),2)