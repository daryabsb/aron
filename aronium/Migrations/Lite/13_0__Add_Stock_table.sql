DROP TABLE IF EXISTS Stock;

CREATE TABLE Stock
(
	Id INTEGER PRIMARY KEY AUTOINCREMENT, 
	ProductId INTEGER REFERENCES Product (Id) ON DELETE CASCADE NOT NULL,
	WarehouseId INTEGER REFERENCES Warehouse (Id) ON DELETE CASCADE NOT NULL, 
	Quantity NUMERIC NOT NULL
);

INSERT INTO Stock (ProductId, WarehouseId, Quantity) SELECT DI.ProductId, D.WarehouseId, SUM(-DI.Quantity) FROM Document D INNER JOIN DocumentItem AS DI ON DI.DocumentId = D.Id GROUP BY DI.ProductId, D.WarehouseId