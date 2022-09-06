ALTER TABLE PosPrinterSelectionSettings ADD COLUMN LeftMargin NUMERIC NOT NULL DEFAULT 0;
ALTER TABLE PosPrinterSelectionSettings ADD COLUMN TopMargin NUMERIC NOT NULL DEFAULT 0;
ALTER TABLE PosPrinterSelectionSettings ADD COLUMN RightMargin NUMERIC NOT NULL DEFAULT 0;
ALTER TABLE PosPrinterSelectionSettings ADD COLUMN BottomMargin NUMERIC NOT NULL DEFAULT 0;

UPDATE PosPrinterSelectionSettings SET LeftMargin = Margin, RightMargin = Margin;
