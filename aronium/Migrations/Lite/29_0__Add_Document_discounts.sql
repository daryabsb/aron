ALTER TABLE Document ADD COLUMN Discount NUMERIC NOT NULL DEFAULT (0);
ALTER TABLE Document ADD COLUMN DiscountType INT NOT NULL DEFAULT (0);