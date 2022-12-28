DROP TABLE IF EXISTS DocumentType;
DROP TABLE IF EXISTS DocumentCategory;
DROP TABLE IF EXISTS Warehouse;

CREATE TABLE Warehouse (Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, Name TEXT NOT NULL);
CREATE TABLE DocumentCategory (Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, Name TEXT NOT NULL);

CREATE TABLE DocumentType 
(
	Id INTEGER PRIMARY KEY AUTOINCREMENT, 
	Name TEXT NOT NULL, 
	Code TEXT NOT NULL, 
	DocumentCategoryId INTEGER REFERENCES DocumentCategory (Id) NOT NULL,
	WarehouseId INTEGER REFERENCES Warehouse (Id) NOT NULL, 
	StockDirection INTEGER (1) NOT NULL DEFAULT (0),
	EditorType INTEGER NOT NULL DEFAULT (0),
	PrintTemplate TEXT
);

INSERT INTO DocumentCategory (Name) VALUES ('Expenses');
INSERT INTO DocumentCategory (Name) VALUES ('Sales');
INSERT INTO DocumentCategory (Name) VALUES ('Inventory');

INSERT INTO Warehouse (Name) VALUES ('Warehouse');

INSERT INTO DocumentType (Name, Code, DocumentCategoryId, WarehouseId, StockDirection, EditorType, PrintTemplate) VALUES ('Purchase', '100', 1, 1, 1, 0, 'Purchase');
INSERT INTO DocumentType (Name, Code, DocumentCategoryId, WarehouseId, StockDirection, EditorType, PrintTemplate) VALUES ('Sales', '200', 2, 1, 2, 0, 'Invoice');
INSERT INTO DocumentType (Name, Code, DocumentCategoryId, WarehouseId, StockDirection, EditorType, PrintTemplate) VALUES ('Inventory Count', '300', 3, 1, 1, 1, 'InventoryCount');

ALTER TABLE Document ADD COLUMN DocumentTypeId INTEGER REFERENCES DocumentType (Id);
ALTER TABLE Document ADD COLUMN WarehouseId INTEGER REFERENCES Warehouse (Id);

UPDATE Document SET WarehouseId = 1, DocumentTypeId = 2;

UPDATE Counter SET Name = 'Document.200.' || strftime('%Y','now') WHERE Name = 'Document.' || strftime('%Y','now');