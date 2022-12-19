------------- SQLite3 Dump File -------------

-- ------------------------------------------
-- Dump of "ApplicationProperty"
-- ------------------------------------------

CREATE TABLE "ApplicationProperty"(
	"Name" Text NOT NULL PRIMARY KEY,
	"Value" Text );


-- ------------------------------------------
-- Dump of "Barcode"
-- ------------------------------------------

CREATE TABLE "Barcode"(
	"Id" Integer PRIMARY KEY AUTOINCREMENT,
	"ProductId" Integer NOT NULL,
	"Value" Text NOT NULL,
	CONSTRAINT "Barcode_Product_CASCADE_NO ACTION_ProductId_Id_0" FOREIGN KEY ( "ProductId" ) REFERENCES "Product"( "Id" )
		ON DELETE Cascade
 );

CREATE INDEX "IX_Barcode_Product" ON "Barcode"( "ProductId" );

-- ------------------------------------------
-- Dump of "Company"
-- ------------------------------------------

CREATE TABLE "Company"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL,
	"Address" Text,
	"PostalCode" Text,
	"City" Text,
	"CountryId" Integer NOT NULL,
	"TaxNumber" Text,
	"Email" Text,
	"PhoneNumber" Text,
	"Logo" BLOB,
	"BankAccountNumber" Text,
	"BankDetails" Text,
	CONSTRAINT "Company_Country_NO ACTION_NO ACTION_CountryId_Id_0" FOREIGN KEY ( "CountryId" ) REFERENCES "Country"( "Id" )
 );


-- ------------------------------------------
-- Dump of "Counter"
-- ------------------------------------------

CREATE TABLE "Counter"(
	"Name" Text NOT NULL PRIMARY KEY,
	"Value" Integer NOT NULL );


-- ------------------------------------------
-- Dump of "Country"
-- ------------------------------------------

CREATE TABLE "Country"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL,
	"Code" Text );


-- ------------------------------------------
-- Dump of "Currency"
-- ------------------------------------------

CREATE TABLE "Currency"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL,
	"Code" Text );


-- ------------------------------------------
-- Dump of "Customer"
-- ------------------------------------------

CREATE TABLE "Customer"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Code" Text,
	"Name" Text NOT NULL,
	"TaxNumber" Text,
	"Address" Text,
	"PostalCode" Text,
	"City" Text,
	"CountryId" Integer,
	"DateCreated" DateTime NOT NULL DEFAULT (DATETIME('now')),
	"DateUpdated" DateTime NOT NULL DEFAULT (DATETIME('now')),
	"Email" Text,
	"PhoneNumber" Text,
	"IsEnabled" Integer NOT NULL DEFAULT 1,
	"IsCustomer" Integer NOT NULL DEFAULT 1,
	"IsSupplier" Integer NOT NULL DEFAULT 1,
	"DueDatePeriod" Integer NOT NULL DEFAULT (0),
	CONSTRAINT "Customer_Country_NO ACTION_NO ACTION_CountryId_Id_0" FOREIGN KEY ( "CountryId" ) REFERENCES "Country"( "Id" )
 );


-- ------------------------------------------
-- Dump of "CustomerDiscount"
-- ------------------------------------------

CREATE TABLE "CustomerDiscount"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"CustomerId" Integer NOT NULL,
	"Type" Integer NOT NULL DEFAULT (0),
	"Uid" Integer,
	"Value" Real NOT NULL DEFAULT (0),
	CONSTRAINT "CustomerDiscount_Customer_CASCADE_NO ACTION_CustomerId_Id_0" FOREIGN KEY ( "CustomerId" ) REFERENCES "Customer"( "Id" )
		ON DELETE Cascade
,
CONSTRAINT "UK_CustomerDiscount" UNIQUE ( "CustomerId", "Type", "Uid" ) );

CREATE INDEX "IX_CustomerDiscount_CustomerId" ON "CustomerDiscount"( "CustomerId" );

-- ------------------------------------------
-- Dump of "Document"
-- ------------------------------------------

CREATE TABLE "Document"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Number" Text NOT NULL,
	"UserId" Integer NOT NULL,
	"CustomerId" Integer,
	"OrderNumber" Text,
	"Date" Date NOT NULL,
	"StockDate" DateTime NOT NULL,
	"Total" Numeric NOT NULL,
	"IsClockedOut" Integer NOT NULL DEFAULT (0),
	"DocumentTypeId" Integer NOT NULL,
	"WarehouseId" Integer NOT NULL,
	"ReferenceDocumentNumber" Text,
	"DateCreated" DateTime NOT NULL DEFAULT (datetime('now', 'localtime')),
	"DateUpdated" DateTime NOT NULL DEFAULT (datetime('now', 'localtime')),
	"InternalNote" Text,
	"Note" Text,
	"DueDate" Date,
	"Discount" Numeric NOT NULL DEFAULT (0),
	"DiscountType" Integer NOT NULL DEFAULT (0),
	"PaidStatus" Integer NOT NULL DEFAULT 0,
	"DiscountApplyRule" Integer NOT NULL DEFAULT (0),
	CONSTRAINT "Document_User_NO ACTION_NO ACTION_UserId_Id_0" FOREIGN KEY ( "UserId" ) REFERENCES "User"( "Id" ),
	CONSTRAINT "Document_Customer_NO ACTION_NO ACTION_CustomerId_Id_0" FOREIGN KEY ( "CustomerId" ) REFERENCES "Customer"( "Id" ),
	CONSTRAINT "Document_DocumentType_NO ACTION_NO ACTION_DocumentTypeId_Id_0" FOREIGN KEY ( "DocumentTypeId" ) REFERENCES "DocumentType"( "Id" ),
	CONSTRAINT "Document_Warehouse_NO ACTION_NO ACTION_WarehouseId_Id_0" FOREIGN KEY ( "WarehouseId" ) REFERENCES "Warehouse"( "Id" )
 );


-- ------------------------------------------
-- Dump of "DocumentCategory"
-- ------------------------------------------

CREATE TABLE "DocumentCategory"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL,
	"LanguageKey" Text );


-- ------------------------------------------
-- Dump of "DocumentItem"
-- ------------------------------------------

CREATE TABLE "DocumentItem"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"DocumentId" Integer NOT NULL,
	"ProductId" Integer NOT NULL,
	"Quantity" Numeric NOT NULL DEFAULT (0),
	"ExpectedQuantity" Numeric NOT NULL DEFAULT (0),
	"PriceBeforeTax" Numeric NOT NULL DEFAULT (0),
	"Price" Numeric NOT NULL,
	"Discount" Numeric NOT NULL DEFAULT (0),
	"DiscountType" Integer NOT NULL DEFAULT (0),
	"ProductCost" Numeric NOT NULL DEFAULT 0,
	"PriceBeforeTaxAfterDiscount" Numeric NOT NULL DEFAULT (0),
	"PriceAfterDiscount" Numeric NOT NULL DEFAULT (0),
	"Total" Numeric NOT NULL DEFAULT (0),
	"TotalAfterDocumentDiscount" Numeric NOT NULL DEFAULT (0),
	"DiscountApplyRule" Integer NOT NULL DEFAULT (0),
	CONSTRAINT "DocumentItem_Document_CASCADE_NO ACTION_DocumentId_Id_0" FOREIGN KEY ( "DocumentId" ) REFERENCES "Document"( "Id" )
		ON DELETE Cascade,
	CONSTRAINT "DocumentItem_Product_NO ACTION_NO ACTION_ProductId_Id_0" FOREIGN KEY ( "ProductId" ) REFERENCES "Product"( "Id" )
 );


-- ------------------------------------------
-- Dump of "DocumentItemTax"
-- ------------------------------------------

CREATE TABLE "DocumentItemTax"(
	"DocumentItemId" Integer NOT NULL,
	"TaxId" Integer NOT NULL,
	"Amount" Real NOT NULL DEFAULT 0,
	CONSTRAINT "DocumentItemTax_DocumentItem_CASCADE_NO ACTION_DocumentItemId_Id_0" FOREIGN KEY ( "DocumentItemId" ) REFERENCES "DocumentItem"( "Id" )
		ON DELETE Cascade,
	CONSTRAINT "DocumentItemTax_Tax_NO ACTION_NO ACTION_TaxId_Id_0" FOREIGN KEY ( "TaxId" ) REFERENCES "Tax"( "Id" )
,
PRIMARY KEY ( "DocumentItemId", "TaxId" ) );


-- ------------------------------------------
-- Dump of "DocumentType"
-- ------------------------------------------

CREATE TABLE "DocumentType"(
	"Id" Integer PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL,
	"Code" Text NOT NULL,
	"DocumentCategoryId" Integer NOT NULL,
	"WarehouseId" Integer NOT NULL,
	"StockDirection" Integer NOT NULL DEFAULT (0),
	"EditorType" Integer NOT NULL DEFAULT (0),
	"PrintTemplate" Text,
	"PriceType" Integer NOT NULL DEFAULT (0),
	"LanguageKey" Text,
	CONSTRAINT "DocumentType_DocumentCategory_NO ACTION_NO ACTION_DocumentCategoryId_Id_0" FOREIGN KEY ( "DocumentCategoryId" ) REFERENCES "DocumentCategory"( "Id" ),
	CONSTRAINT "DocumentType_Warehouse_NO ACTION_NO ACTION_WarehouseId_Id_0" FOREIGN KEY ( "WarehouseId" ) REFERENCES "Warehouse"( "Id" )
 );


-- ------------------------------------------
-- Dump of "FiscalItem"
-- ------------------------------------------

CREATE TABLE "FiscalItem"(
	"PLU" Integer NOT NULL PRIMARY KEY,
	"Name" Text NOT NULL,
	"VAT" Text NOT NULL );


-- ------------------------------------------
-- Dump of "FloorPlan"
-- ------------------------------------------

CREATE TABLE "FloorPlan"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL,
	"Color" Text NOT NULL DEFAULT 'Transparent' );


-- ------------------------------------------
-- Dump of "FloorPlanTable"
-- ------------------------------------------

CREATE TABLE "FloorPlanTable"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL,
	"FloorPlanId" Integer NOT NULL,
	"PositionX" Real NOT NULL DEFAULT (0),
	"PositionY" Real NOT NULL DEFAULT (0),
	"Width" Real NOT NULL,
	"Height" Real NOT NULL,
	"IsRound" Integer NOT NULL DEFAULT (0),
	CONSTRAINT "FloorPlanTable_FloorPlan_CASCADE_NO ACTION_FloorPlanId_Id_0" FOREIGN KEY ( "FloorPlanId" ) REFERENCES "FloorPlan"( "Id" )
		ON DELETE Cascade
 );


-- ------------------------------------------
-- Dump of "LoyaltyCard"
-- ------------------------------------------

CREATE TABLE "LoyaltyCard"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"CustomerId" Integer NOT NULL,
	"CardNumber" Text,
	CONSTRAINT "LoyaltyCard_Customer_CASCADE_NO ACTION_CustomerId_Id_0" FOREIGN KEY ( "CustomerId" ) REFERENCES "Customer"( "Id" )
		ON DELETE Cascade
 );

CREATE INDEX "IX_LoyaltyCard_CustomerId" ON "LoyaltyCard"( "CustomerId" );

-- ------------------------------------------
-- Dump of "Migration"
-- ------------------------------------------

CREATE TABLE "Migration"(
	"ID" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Version" Text NOT NULL,
	"Description" Text,
	"FileName" Text NOT NULL,
	"Module" Text,
	"Date" DateTime );


-- ------------------------------------------
-- Dump of "Payment"
-- ------------------------------------------

CREATE TABLE "Payment"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"DocumentId" Integer NOT NULL,
	"PaymentTypeId" Integer NOT NULL,
	"Amount" Numeric NOT NULL DEFAULT (0),
	"Date" Date,
	CONSTRAINT "Payment_Document_CASCADE_NO ACTION_DocumentId_Id_0" FOREIGN KEY ( "DocumentId" ) REFERENCES "Document"( "Id" )
		ON DELETE Cascade,
	CONSTRAINT "Payment_PaymentType_NO ACTION_NO ACTION_PaymentTypeId_Id_0" FOREIGN KEY ( "PaymentTypeId" ) REFERENCES "PaymentType"( "Id" )
 );


-- ------------------------------------------
-- Dump of "PaymentType"
-- ------------------------------------------

CREATE TABLE "PaymentType"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL,
	"Code" Text,
	"IsCustomerRequired" Integer NOT NULL DEFAULT (0),
	"IsFiscal" Integer NOT NULL DEFAULT (1),
	"IsSlipRequired" Integer NOT NULL DEFAULT (0),
	"IsChangeAllowed" Integer NOT NULL DEFAULT (1),
	"Ordinal" Integer NOT NULL DEFAULT (0),
	"IsEnabled" Integer NOT NULL DEFAULT (1),
	"IsQuickPayment" Integer NOT NULL DEFAULT (1),
	"OpenCashDrawer" Integer NOT NULL DEFAULT 1,
	"ShortcutKey" Text,
	"MarkAsPaid" Integer NOT NULL DEFAULT 1 );


-- ------------------------------------------
-- Dump of "PosOrder"
-- ------------------------------------------

CREATE TABLE "PosOrder"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"UserId" Integer NOT NULL,
	"Number" Text NOT NULL,
	"Discount" Numeric NOT NULL DEFAULT (0),
	"DiscountType" Integer NOT NULL DEFAULT (0),
	"Total" Numeric,
	CONSTRAINT "PosOrder_User_NO ACTION_NO ACTION_UserId_Id_0" FOREIGN KEY ( "UserId" ) REFERENCES "User"( "Id" )
 );


-- ------------------------------------------
-- Dump of "PosOrderItem"
-- ------------------------------------------

CREATE TABLE "PosOrderItem"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"PosOrderId" Integer NOT NULL,
	"ProductId" Integer NOT NULL,
	"RoundNumber" Integer NOT NULL DEFAULT (0),
	"Quantity" Numeric NOT NULL,
	"Price" Numeric NOT NULL,
	"IsLocked" Integer NOT NULL DEFAULT (0),
	"Discount" Numeric NOT NULL DEFAULT (0),
	"DiscountType" Integer NOT NULL DEFAULT (0),
	"IsFeatured" Integer NOT NULL DEFAULT 0,
	"VoidedBy" Integer,
	"Comment" Text,
	"DateCreated" Date NOT NULL,
	"Bundle" Text,
	CONSTRAINT "PosOrderItem_PosOrder_CASCADE_NO ACTION_PosOrderId_Id_0" FOREIGN KEY ( "PosOrderId" ) REFERENCES "PosOrder"( "Id" )
		ON DELETE Cascade,
	CONSTRAINT "PosOrderItem_Product_NO ACTION_NO ACTION_ProductId_Id_0" FOREIGN KEY ( "ProductId" ) REFERENCES "Product"( "Id" ),
	CONSTRAINT "PosOrderItem_User_NO ACTION_NO ACTION_VoidedBy_Id_0" FOREIGN KEY ( "VoidedBy" ) REFERENCES "User"( "Id" )
 );


-- ------------------------------------------
-- Dump of "PosPrinterSelection"
-- ------------------------------------------

CREATE TABLE "PosPrinterSelection"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Key" Text NOT NULL,
	"PrinterName" Text,
	"IsEnabled" Integer NOT NULL DEFAULT (0),
CONSTRAINT "UK_PrinterKey" UNIQUE ( "Key" ) );


-- ------------------------------------------
-- Dump of "PosPrinterSelectionSettings"
-- ------------------------------------------

CREATE TABLE "PosPrinterSelectionSettings"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"PosPrinterSelectionId" Integer NOT NULL,
	"PaperWidth" Integer NOT NULL DEFAULT (32),
	"Header" Text,
	"Footer" Text,
	"FeedLines" Integer NOT NULL DEFAULT (0),
	"CutPaper" Integer NOT NULL DEFAULT (1),
	"PrintBitmap" Integer NOT NULL DEFAULT (0),
	"OpenCashDrawer" Integer NOT NULL DEFAULT 1,
	"CashDrawerCommand" Text,
	"HeaderAlignment" Integer NOT NULL DEFAULT 0,
	"FooterAlignment" Integer NOT NULL DEFAULT 0,
	"IsFormattingEnabled" Integer NOT NULL DEFAULT 1,
	"PrinterType" Integer NOT NULL DEFAULT 0,
	"NumberOfCopies" Integer NOT NULL DEFAULT 1,
	"CodePage" Integer NOT NULL DEFAULT -1,
	"CharacterSet" Integer NOT NULL DEFAULT -1,
	"Margin" Integer NOT NULL DEFAULT 0,
	"LeftMargin" Numeric NOT NULL DEFAULT 0,
	"TopMargin" Numeric NOT NULL DEFAULT 0,
	"RightMargin" Numeric NOT NULL DEFAULT 0,
	"BottomMargin" Numeric NOT NULL DEFAULT 0,
	"PrintBarcode" Integer NOT NULL DEFAULT 1,
	"FontName" Text,
	"FontSizePercent" Numeric NOT NULL DEFAULT 100.0,
	CONSTRAINT "PosPrinterSelectionSettings_PosPrinterSelection_CASCADE_NO ACTION_PosPrinterSelectionId_Id_0" FOREIGN KEY ( "PosPrinterSelectionId" ) REFERENCES "PosPrinterSelection"( "Id" )
		ON DELETE Cascade
 );


-- ------------------------------------------
-- Dump of "PosPrinterSettings"
-- ------------------------------------------

CREATE TABLE "PosPrinterSettings"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"PrinterName" Text NOT NULL,
	"PaperWidth" Integer NOT NULL DEFAULT (32),
	"Header" Text,
	"Footer" Text,
	"FeedLines" Integer NOT NULL DEFAULT (0),
	"CutPaper" Integer NOT NULL DEFAULT (1),
	"PrintBitmap" Integer NOT NULL DEFAULT (0),
	"OpenCashDrawer" Integer NOT NULL DEFAULT 1,
	"CashDrawerCommand" Text,
	"HeaderAlignment" Integer NOT NULL DEFAULT 0,
	"FooterAlignment" Integer NOT NULL DEFAULT 0,
	"IsFormattingEnabled" Integer NOT NULL DEFAULT 1,
	"PrinterType" Integer NOT NULL DEFAULT 0,
	"NumberOfCopies" Integer NOT NULL DEFAULT 1,
	"CodePage" Integer NOT NULL DEFAULT -1,
	"CharacterSet" Integer NOT NULL DEFAULT -1,
CONSTRAINT "UK_PrinterName" UNIQUE ( "PrinterName" ) );


-- ------------------------------------------
-- Dump of "PrintStation"
-- ------------------------------------------

CREATE TABLE "PrintStation"(
	"Id" Integer PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL );


-- ------------------------------------------
-- Dump of "PrintStationPosPrinterSelection"
-- ------------------------------------------

CREATE TABLE "PrintStationPosPrinterSelection"(
	"PrintStationId" Integer,
	"PosPrinterSelectionId" Integer,
	CONSTRAINT "PrintStationPosPrinterSelection_PrintStation_CASCADE_NO ACTION_PrintStationId_Id_0" FOREIGN KEY ( "PrintStationId" ) REFERENCES "PrintStation"( "Id" )
		ON DELETE Cascade,
	CONSTRAINT "PrintStationPosPrinterSelection_PosPrinterSelection_CASCADE_NO ACTION_PosPrinterSelectionId_Id_0" FOREIGN KEY ( "PosPrinterSelectionId" ) REFERENCES "PosPrinterSelection"( "Id" )
		ON DELETE Cascade
,
PRIMARY KEY ( "PrintStationId", "PosPrinterSelectionId" ) );


-- ------------------------------------------
-- Dump of "Product"
-- ------------------------------------------

CREATE TABLE "Product"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"ProductGroupId" Integer,
	"Name" Text NOT NULL,
	"Code" Text,
	"PLU" Integer,
	"MeasurementUnit" Text,
	"Price" Real NOT NULL DEFAULT 0,
	"IsTaxInclusivePrice" Integer DEFAULT (1),
	"CurrencyId" Integer,
	"IsPriceChangeAllowed" Integer NOT NULL DEFAULT 0,
	"IsService" Integer NOT NULL DEFAULT 0,
	"IsUsingDefaultQuantity" Integer NOT NULL DEFAULT 1,
	"IsEnabled" Integer NOT NULL DEFAULT (1),
	"Description" Text,
	"DateCreated" DateTime NOT NULL DEFAULT (DATETIME ('now','localtime')),
	"DateUpdated" DateTime NOT NULL DEFAULT (DATETIME ('now','localtime')),
	"Cost" Numeric NOT NULL DEFAULT 0,
	"Margin" Numeric NOT NULL DEFAULT 0,
	"Image" BLOB,
	"Color" Text NOT NULL DEFAULT 'Transparent',
	"AgeRestriction" Numeric,
	"LastPurchasePrice" Numeric NOT NULL DEFAULT (0),
	"Rank" Numeric NOT NULL DEFAULT (0),
	CONSTRAINT "Product_ProductGroup_CASCADE_NO ACTION_ProductGroupId_Id_0" FOREIGN KEY ( "ProductGroupId" ) REFERENCES "ProductGroup"( "Id" )
		ON DELETE Cascade,
	CONSTRAINT "Product_Currency_NO ACTION_NO ACTION_CurrencyId_Id_0" FOREIGN KEY ( "CurrencyId" ) REFERENCES "Currency"( "Id" )
 );


-- ------------------------------------------
-- Dump of "ProductComment"
-- ------------------------------------------

CREATE TABLE "ProductComment"(
	"Id" Integer PRIMARY KEY AUTOINCREMENT,
	"ProductId" Integer NOT NULL,
	"Comment" Text NOT NULL,
	CONSTRAINT "ProductComment_Product_CASCADE_NO ACTION_ProductId_Id_0" FOREIGN KEY ( "ProductId" ) REFERENCES "Product"( "Id" )
		ON DELETE Cascade
 );


-- ------------------------------------------
-- Dump of "ProductGroup"
-- ------------------------------------------

CREATE TABLE "ProductGroup"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL,
	"ParentGroupId" Integer,
	"Color" Text NOT NULL DEFAULT 'Transparent',
	"Image" BLOB,
	"Rank" Integer NOT NULL DEFAULT 0 );


-- ------------------------------------------
-- Dump of "ProductGroupPrintStation"
-- ------------------------------------------

CREATE TABLE "ProductGroupPrintStation"(
	"ProductGroupId" Integer,
	"PrintStationId" Integer,
	CONSTRAINT "ProductGroupPrintStation_ProductGroup_CASCADE_NO ACTION_ProductGroupId_Id_0" FOREIGN KEY ( "ProductGroupId" ) REFERENCES "ProductGroup"( "Id" )
		ON DELETE Cascade,
	CONSTRAINT "ProductGroupPrintStation_PrintStation_CASCADE_NO ACTION_PrintStationId_Id_0" FOREIGN KEY ( "PrintStationId" ) REFERENCES "PrintStation"( "Id" )
		ON DELETE Cascade
,
PRIMARY KEY ( "ProductGroupId", "PrintStationId" ) );


-- ------------------------------------------
-- Dump of "ProductPrintStation"
-- ------------------------------------------

CREATE TABLE "ProductPrintStation"(
	"ProductId" Integer,
	"PrintStationId" Integer,
	CONSTRAINT "ProductPrintStation_Product_CASCADE_NO ACTION_ProductId_Id_0" FOREIGN KEY ( "ProductId" ) REFERENCES "Product"( "Id" )
		ON DELETE Cascade,
	CONSTRAINT "ProductPrintStation_PrintStation_CASCADE_NO ACTION_PrintStationId_Id_0" FOREIGN KEY ( "PrintStationId" ) REFERENCES "PrintStation"( "Id" )
		ON DELETE Cascade
,
PRIMARY KEY ( "ProductId", "PrintStationId" ) );


-- ------------------------------------------
-- Dump of "ProductTax"
-- ------------------------------------------

CREATE TABLE "ProductTax"(
	"ProductId" Integer NOT NULL,
	"TaxId" Integer NOT NULL,
	CONSTRAINT "ProductTax_Product_CASCADE_NO ACTION_ProductId_Id_0" FOREIGN KEY ( "ProductId" ) REFERENCES "Product"( "Id" )
		ON DELETE Cascade,
	CONSTRAINT "ProductTax_Tax_NO ACTION_NO ACTION_TaxId_Id_0" FOREIGN KEY ( "TaxId" ) REFERENCES "Tax"( "Id" )
,
PRIMARY KEY ( "ProductId", "TaxId" ) );


-- ------------------------------------------
-- Dump of "Promotion"
-- ------------------------------------------

CREATE TABLE "Promotion"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL,
	"StartDate" DateTime,
	"StartTime" DateTime,
	"EndDate" DateTime,
	"EndTime" DateTime,
	"DaysOfWeek" Integer NOT NULL,
	"IsEnabled" Integer NOT NULL DEFAULT (1) );


-- ------------------------------------------
-- Dump of "PromotionItem"
-- ------------------------------------------

CREATE TABLE "PromotionItem"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"PromotionId" Integer NOT NULL,
	"Uid" Integer NOT NULL,
	"DiscountType" Integer NOT NULL DEFAULT (0),
	"PriceType" Integer NOT NULL DEFAULT (0),
	"Value" Numeric NOT NULL DEFAULT (0),
	"IsConditional" Integer NOT NULL DEFAULT (1),
	"Quantity" Numeric NOT NULL DEFAULT (0),
	"ConditionType" Integer NOT NULL DEFAULT (0),
	"QuantityLimit" Numeric NOT NULL DEFAULT (0),
	CONSTRAINT "PromotionItem_Promotion_CASCADE_NO ACTION_PromotionId_Id_0" FOREIGN KEY ( "PromotionId" ) REFERENCES "Promotion"( "Id" )
		ON DELETE Cascade
 );


-- ------------------------------------------
-- Dump of "SecurityKey"
-- ------------------------------------------

CREATE TABLE "SecurityKey"(
	"Name" Text PRIMARY KEY,
	"Level" Integer );


-- ------------------------------------------
-- Dump of "StartingCash"
-- ------------------------------------------

CREATE TABLE "StartingCash"(
	"Id" Integer PRIMARY KEY AUTOINCREMENT,
	"UserId" Integer NOT NULL,
	"Amount" Numeric NOT NULL,
	"Description" Text,
	"StartingCashType" Integer NOT NULL DEFAULT (0),
	"ZReportNumber" Integer,
	"DateCreated" DateTime NOT NULL,
	CONSTRAINT "StartingCash_User_NO ACTION_NO ACTION_UserId_Id_0" FOREIGN KEY ( "UserId" ) REFERENCES "User"( "Id" )
,
CONSTRAINT "unique_Id" UNIQUE ( "Id" ) );


-- ------------------------------------------
-- Dump of "Stock"
-- ------------------------------------------

CREATE TABLE "Stock"(
	"Id" Integer PRIMARY KEY AUTOINCREMENT,
	"ProductId" Integer NOT NULL,
	"WarehouseId" Integer NOT NULL,
	"Quantity" Numeric NOT NULL,
	CONSTRAINT "Stock_Product_CASCADE_NO ACTION_ProductId_Id_0" FOREIGN KEY ( "ProductId" ) REFERENCES "Product"( "Id" )
		ON DELETE Cascade,
	CONSTRAINT "Stock_Warehouse_CASCADE_NO ACTION_WarehouseId_Id_0" FOREIGN KEY ( "WarehouseId" ) REFERENCES "Warehouse"( "Id" )
		ON DELETE Cascade
 );

CREATE INDEX "IX_Stock_ProductId" ON "Stock"( "ProductId" );

-- ------------------------------------------
-- Dump of "StockControl"
-- ------------------------------------------

CREATE TABLE "StockControl"(
	"Id" Integer PRIMARY KEY AUTOINCREMENT,
	"ProductId" Integer NOT NULL,
	"CustomerId" Integer,
	"ReorderPoint" Numeric NOT NULL DEFAULT (0),
	"PreferredQuantity" Numeric NOT NULL DEFAULT (0),
	"IsLowStockWarningEnabled" Integer NOT NULL DEFAULT (1),
	"LowStockWarningQuantity" Numeric NOT NULL DEFAULT (0),
	CONSTRAINT "FK_StockControl_Product" FOREIGN KEY ( "ProductId" ) REFERENCES "Product"( "Id" )
		ON DELETE Cascade,
	CONSTRAINT "StockControl_Customer_SET NULL_NO ACTION_CustomerId_Id_0" FOREIGN KEY ( "CustomerId" ) REFERENCES "Customer"( "Id" )
		ON DELETE Set NULL
 );

CREATE UNIQUE INDEX "IX_StockControl_Product" ON "StockControl"( "ProductId" );

-- ------------------------------------------
-- Dump of "Tax"
-- ------------------------------------------

CREATE TABLE "Tax"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL,
	"Rate" Numeric NOT NULL,
	"Code" Text,
	"IsFixed" Integer NOT NULL DEFAULT 0,
	"IsTaxOnTotal" Integer NOT NULL DEFAULT 0,
	"IsEnabled" Integer NOT NULL DEFAULT 1 );


-- ------------------------------------------
-- Dump of "User"
-- ------------------------------------------

CREATE TABLE "User"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"FirstName" Text,
	"LastName" Text,
	"Username" Text,
	"Password" Text NOT NULL,
	"AccessLevel" Integer NOT NULL DEFAULT (0),
	"IsEnabled" Integer NOT NULL DEFAULT 1,
	"Email" Text );

CREATE UNIQUE INDEX "UX_UserEmail" ON "User"( "Email" );

-- ------------------------------------------
-- Dump of "Warehouse"
-- ------------------------------------------

CREATE TABLE "Warehouse"(
	"Id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name" Text NOT NULL );


-- ------------------------------------------
-- Dump of "ZReport"
-- ------------------------------------------

CREATE TABLE "ZReport"(
	"Id" Integer PRIMARY KEY AUTOINCREMENT,
	"Number" Integer NOT NULL,
	"FromDocumentId" Integer NOT NULL,
	"ToDocumentId" Integer NOT NULL,
	"DateCreated" DateTime NOT NULL DEFAULT (datetime('now', 'localtime')) );


CREATE VIEW PaymentsView AS SELECT P.DocumentId, GROUP_CONCAT(PT.Name) AS PaymentTypes FROM Payment P INNER JOIN PaymentType PT ON PT.Id = P.PaymentTypeId GROUP BY P.DocumentId;
CREATE VIEW DocumentItemPriceView AS SELECT 
    DI.Id AS DocumentItemId,
    -- If cart discount exist
    CASE WHEN D.Discount > 0 THEN
        -- Percentage discount on cart
        CASE WHEN D.DiscountType = 0 THEN
            -- Calculate cart percentage discount on previously calculated price with discount
            (DI.PriceAfterDiscount / ROUND(100,2)) * (ROUND(100,2) - D.Discount)
        ELSE 
            -- Cart fixed discount subtracted from price with tax
            DI.PriceAfterDiscount - (((D.Discount * ROUND(DI.Total,2)) / (ROUND(D.Total,2) + D.Discount)) / DI.Quantity)
        END
    ELSE 
        DI.PriceAfterDiscount
    END 
    AS Price
FROM     DocumentItem DI INNER JOIN
         Document D ON D.Id = DI.DocumentId;



-- ------------------------------
-- SELECT FOR INVOICE FROM
-- ------------------------------

CREATE VIEW PaymentsView AS
SELECT  
		P.Name,        
		DI.Quantity,        
		P.MeasurementUnit,       
		DI.Price,       
		DI.PriceBeforeTax,        
		DI.PriceBeforeTaxAfterDiscount,       
		DI.Total,     
		Taxes = STUFF((          
			SELECT ',' + CAST(CAST(T.Rate AS FLOAT) AS VARCHAR(10)) + CASE WHEN T.IsFixed = 0 THEN '%' ELSE '' END
			            
FROM DocumentItemTax DIT INNER JOIN Tax T ON T.Id = DIT.TaxId
            
WHERE DIT.DocumentItemId = DI.Id
            
FOR XML PATH(''), TYPE).value('.', 'VARCHAR(50)'), 1, 1, ''),       
	DI.Quantity * DI.PriceBeforeTax AS TotalBeforeTax,       
	DI.Discount,
	DI.DiscountType,       
	DI.TotalAfterDocumentDiscount,     
	DI.TotalAfterDocumentDiscount - SUM(ISNULL(DIT.Amount,0)) 
AS TotalBeforeTaxAfterDocumentDiscount&#13;&#10;
FROM    DocumentItem DI        
INNER JOIN Product P ON P.Id = DI.ProductId       
LEFT JOIN DocumentItemTax DIT ON DIT.DocumentItemId = DI.Id      
LEFT JOIN Tax T ON T.Id = DIT.TaxId
WHERE   DI.DocumentId=@Id
GROUP BY 
	DI.Id, P.Name,       
	DI.Quantity,        
	P.MeasurementUnit,        
	DI.Price,        
	DI.PriceBeforeTax,       
	DI.PriceBeforeTaxAfterDiscount,        
	DI.Total, DI.Discount,        
	DI.DiscountType,         
	TotalAfterDocumentDiscount