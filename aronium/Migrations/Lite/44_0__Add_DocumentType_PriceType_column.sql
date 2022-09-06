ALTER TABLE DocumentType ADD COLUMN PriceType INT NOT NULL DEFAULT (0);
UPDATE DocumentType SET PriceType = 1 WHERE DocumentCategoryId = 2;