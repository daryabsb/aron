CREATE TABLE Barcode (Id INTEGER PRIMARY KEY AUTOINCREMENT, ProductId INTEGER NOT NULL REFERENCES Product (Id) ON DELETE CASCADE, Value TEXT NOT NULL);

CREATE INDEX IX_Barcode_Product ON Barcode (ProductId);

INSERT INTO Barcode (ProductId, Value) SELECT Id, Barcode FROM Product WHERE Barcode IS NOT NULL AND Barcode <> ''; 