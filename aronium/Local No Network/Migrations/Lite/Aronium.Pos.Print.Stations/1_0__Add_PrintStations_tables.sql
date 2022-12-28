CREATE TABLE PrintStation (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT NOT NULL);

CREATE TABLE ProductPrintStation (
    ProductId INTEGER REFERENCES Product (Id) ON DELETE CASCADE,
    PrintStationId INTEGER REFERENCES PrintStation (Id) ON DELETE CASCADE,
    PRIMARY KEY (ProductId, PrintStationId)
);

CREATE TABLE ProductGroupPrintStation (
    ProductGroupId INTEGER REFERENCES ProductGroup (Id) ON DELETE CASCADE,
    PrintStationId INTEGER REFERENCES PrintStation (Id) ON DELETE CASCADE,
    PRIMARY KEY (ProductGroupId, PrintStationId)
);

CREATE TABLE PrintStationPosPrinterSelection (
    PrintStationId INTEGER REFERENCES PrintStation (Id) ON DELETE CASCADE,
    PosPrinterSelectionId INTEGER REFERENCES PosPrinterSelection (Id) ON DELETE CASCADE,
    PRIMARY KEY (PrintStationId, PosPrinterSelectionId)
);