CREATE TABLE StockControl (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    ProductId INTEGER CONSTRAINT FK_StockControl_Product REFERENCES Product (Id) ON DELETE CASCADE NOT NULL,
    CustomerId INTEGER REFERENCES Customer (Id) ON DELETE SET NULL,
    ReorderPoint NUMERIC NOT NULL DEFAULT (0),
    PreferredQuantity NUMERIC NOT NULL DEFAULT (0),
    IsLowStockWarningEnabled INTEGER (1) NOT NULL DEFAULT (1),
    LowStockWarningQuantity NUMERIC NOT NULL DEFAULT (0)
);
CREATE UNIQUE INDEX IX_StockControl_Product ON StockControl (ProductId);