ALTER TABLE DocumentCategory ADD COLUMN LanguageKey TEXT;
ALTER TABLE DocumentType ADD COLUMN LanguageKey TEXT;

UPDATE DocumentCategory SET LanguageKey='Document.Category.Expenses' WHERE Id=1;
UPDATE DocumentCategory SET LanguageKey='Document.Category.Sales' WHERE Id=2;
UPDATE DocumentCategory SET LanguageKey='Document.Category.Inventory' WHERE Id=3;
UPDATE DocumentCategory SET LanguageKey='Document.Category.Loss' WHERE Id=4;

UPDATE DocumentType SET LanguageKey='Document.Category.Expenses.Purchase' WHERE Code='100';
UPDATE DocumentType SET LanguageKey='Document.Category.Expenses.StockReturn' WHERE Code='120';

UPDATE DocumentType SET LanguageKey='Document.Category.Sales.Sales' WHERE Code='200';
UPDATE DocumentType SET LanguageKey='Document.Category.Sales.Refund' WHERE Code='220';
UPDATE DocumentType SET LanguageKey='Document.Category.Sales.Proforma' WHERE Code='230';

UPDATE DocumentType SET LanguageKey='Document.Category.Inventory.InventoryCount' WHERE Code='300';

UPDATE DocumentType SET LanguageKey='Document.Category.Loss.LossAndDamage' WHERE Code='400';