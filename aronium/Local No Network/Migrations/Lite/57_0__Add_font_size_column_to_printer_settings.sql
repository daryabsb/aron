ALTER TABLE PosPrinterSelectionSettings ADD COLUMN FontName TEXT;
ALTER TABLE PosPrinterSelectionSettings ADD COLUMN FontSizePercent NUMERIC NOT NULL DEFAULT 100.0;