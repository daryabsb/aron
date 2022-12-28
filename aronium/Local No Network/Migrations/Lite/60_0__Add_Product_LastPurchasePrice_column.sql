ALTER TABLE Product ADD COLUMN LastPurchasePrice NUMERIC NOT NULL DEFAULT (0);

UPDATE DocumentType SET PriceType = 2 WHERE DocumentCategoryId = 1;