ALTER TABLE Document ADD COLUMN DiscountApplyRule INTEGER(1) NOT NULL DEFAULT (0);
ALTER TABLE DocumentItem ADD COLUMN DiscountApplyRule INTEGER(1) NOT NULL DEFAULT (0);