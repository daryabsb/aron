ALTER TABLE OrderItem ADD COLUMN DiscountType INT NOT NULL DEFAULT (0);
ALTER TABLE DocumentItem ADD COLUMN DiscountType INT NOT NULL DEFAULT (0);