ALTER TABLE Document RENAME TO temp_table;

CREATE TABLE Document (Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, Number TEXT NOT NULL, UserId INTEGER REFERENCES User (Id) NOT NULL, CustomerId INTEGER REFERENCES Customer (Id), OrderNumber TEXT, Date DATE NOT NULL, StockDate DATETIME NOT NULL, Total NUMERIC NOT NULL, IsClockedOut INTEGER (1) NOT NULL DEFAULT (0), DocumentTypeId INTEGER REFERENCES DocumentType (Id) NOT NULL, WarehouseId INTEGER REFERENCES Warehouse (Id) NOT NULL, ReferenceDocumentNumber TEXT, DateCreated DATETIME NOT NULL DEFAULT (datetime('now', 'localtime')), DateUpdated DATETIME NOT NULL DEFAULT (datetime('now', 'localtime')));

INSERT INTO Document (Id, Number, UserId, CustomerId, OrderNumber, Date, StockDate, Total, IsClockedOut, DocumentTypeId, WarehouseId, ReferenceDocumentNumber, DateCreated, DateUpdated) SELECT Id, Number, UserId, CustomerId, OrderNumber, Date, DateCreated, Total, IsClockedOut, DocumentTypeId, WarehouseId, ReferenceDocumentNumber, DateCreated, DateUpdated FROM temp_table;

ALTER TABLE DocumentItem RENAME TO temp_table0;

CREATE TABLE DocumentItem (Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, DocumentId INTEGER REFERENCES Document (Id) ON DELETE CASCADE NOT NULL, ProductId INTEGER REFERENCES Product (Id) NOT NULL, Quantity NUMERIC NOT NULL DEFAULT (0), ExpectedQuantity NUMERIC NOT NULL DEFAULT (0), VATRateId INTEGER REFERENCES VATRate (Id) NOT NULL, PriceBeforeTax NUMERIC NOT NULL DEFAULT (0), Discount NUMERIC NOT NULL DEFAULT (0), Price NUMERIC NOT NULL, ProductCost NUMERIC NOT NULL DEFAULT 0);

INSERT INTO DocumentItem (Id, DocumentId, ProductId, Quantity, ExpectedQuantity, VATRateId, PriceBeforeTax, Discount, Price, ProductCost) SELECT Id, DocumentId, ProductId, Quantity, 0, VATRateId, PriceBeforeTax, Discount, Price, ProductCost FROM temp_table0;

DROP TABLE temp_table0;

ALTER TABLE Payment RENAME TO temp_table0;

CREATE TABLE Payment (Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, DocumentId INTEGER REFERENCES Document (Id) ON DELETE CASCADE NOT NULL, PaymentTypeId INTEGER REFERENCES PaymentType (Id) NOT NULL, Amount NUMERIC NOT NULL DEFAULT (0));

INSERT INTO Payment (Id, DocumentId, PaymentTypeId, Amount) SELECT Id, DocumentId, PaymentTypeId, Amount FROM temp_table0;

DROP TABLE temp_table0;

DROP TABLE temp_table;