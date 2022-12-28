CREATE TABLE PosPrinterSelectionSettings (
  Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
  PosPrinterSelectionId INTEGER REFERENCES PosPrinterSelection (Id) ON DELETE CASCADE NOT NULL, 
  PaperWidth INTEGER (5) NOT NULL DEFAULT (32), 
  Header TEXT, 
  Footer TEXT, 
  FeedLines INTEGER (3) NOT NULL DEFAULT (0), 
  CutPaper INTEGER (1) NOT NULL DEFAULT (1), 
  PrintBitmap INTEGER (1) NOT NULL DEFAULT (0), 
  OpenCashDrawer INT (1) NOT NULL DEFAULT 1, 
  CashDrawerCommand TEXT, 
  HeaderAlignment INT (1) NOT NULL DEFAULT 0, 
  FooterAlignment INT (1) NOT NULL DEFAULT 0, 
  IsFormattingEnabled INT (1) NOT NULL DEFAULT 1, 
  PrinterType INT (1) NOT NULL DEFAULT 0, 
  NumberOfCopies INT (1) NOT NULL DEFAULT 1, 
  CodePage INTEGER NOT NULL DEFAULT -1, 
  CharacterSet INTEGER NOT NULL DEFAULT -1,
  Margin INTEGER NOT NULL DEFAULT 0
);

INSERT INTO PosPrinterSelectionSettings (
  PosPrinterSelectionId,
  PaperWidth,
  Header,
  Footer,
  FeedLines,
  CutPaper,
  PrintBitmap,
  OpenCashDrawer,
  CashDrawerCommand,
  HeaderAlignment,
  FooterAlignment,
  IsFormattingEnabled,
  PrinterType,
  NumberOfCopies,
  CodePage,
  CharacterSet
) 
SELECT 
  S.Id, 
  PaperWidth, 
  Header, 
  Footer, 
  FeedLines, 
  CutPaper, 
  PrintBitmap, 
  OpenCashDrawer, 
  CashDrawerCommand, 
  HeaderAlignment, 
  FooterAlignment, 
  IsFormattingEnabled, 
  PrinterType, 
  NumberOfCopies, 
  CodePage, 
  CharacterSet 
FROM PosPrinterSettings P INNER JOIN PosPrinterSelection AS S ON P.PrinterName = S.PrinterName;

UPDATE PosPrinterSelectionSettings SET NumberOfCopies = 1, Footer = NULL, Header = NULL
WHERE PosPrinterSelectionId IN (SELECT Id FROM PosPrinterSelection WHERE Key IN ("Estimate", "KitchenTicket", "Service"));