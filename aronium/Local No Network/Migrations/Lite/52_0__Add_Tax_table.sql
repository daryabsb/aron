PRAGMA foreign_keys = 0;

CREATE TABLE Tax (Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, Name TEXT NOT NULL, Rate NUMERIC NOT NULL, Code TEXT, IsFixed INTEGER (1) NOT NULL DEFAULT 0, IsTaxOnTotal INTEGER (1) NOT NULL DEFAULT 0, IsEnabled INTEGER (1) NOT NULL DEFAULT 1);
INSERT INTO Tax (Id, Name, Rate, Code) SELECT Id, Name, Rate * 100.00, Code FROM VATRate;

CREATE TABLE ProductTax (ProductId INTEGER REFERENCES Product (Id) ON DELETE CASCADE NOT NULL, TaxId INTEGER NOT NULL REFERENCES Tax (Id), PRIMARY KEY (ProductId, TaxId));
INSERT INTO ProductTax (ProductId, TaxId) SELECT Id, VATRateId FROM Product;
CREATE TABLE DocumentItemTax (DocumentItemId INTEGER REFERENCES  DocumentItem (Id) ON DELETE CASCADE NOT NULL, TaxId INTEGER NOT NULL REFERENCES Tax (Id), Amount REAL NOT NULL DEFAULT 0, PRIMARY KEY (DocumentItemId, TaxId));

INSERT INTO DocumentItemTax (DocumentItemId, TaxId, Amount) 
SELECT  I.Id, 
        I.VATRateId, 
        CASE WHEN I.Quantity <> 0 THEN (I.Quantity * IP.Price) - ((I.Quantity * IP.Price) / (1.00 + V.Rate)) ELSE 0.00 END 
FROM    DocumentItem I 
        INNER JOIN VATRAte AS V ON V.Id = I.VATRateId 
        INNER JOIN DocumentItemPriceView AS IP ON IP.DocumentItemId = I.Id;

CREATE TABLE temp_table AS SELECT * FROM Product;

DROP TABLE Product;

CREATE TABLE Product (
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
	,ProductGroupId INTEGER REFERENCES ProductGroup(Id) ON DELETE CASCADE
	,Name TEXT NOT NULL
	,Code TEXT
	,PLU INTEGER
	,MeasurementUnit TEXT
	,Price REAL NOT NULL DEFAULT 0
	,IsTaxInclusivePrice INTEGER (1) DEFAULT(1)
	,CurrencyId INTEGER REFERENCES Currency(Id)
	,IsPriceChangeAllowed INTEGER (1) NOT NULL DEFAULT 0
	,IsService INTEGER (1) NOT NULL DEFAULT 0
	,IsUsingDefaultQuantity INTEGER (1) NOT NULL DEFAULT 1
	,IsEnabled INTEGER (1) NOT NULL DEFAULT(1)
	,Description TEXT
	,DateCreated DATETIME NOT NULL DEFAULT(DATETIME ('now','localtime'))
	,DateUpdated DATETIME NOT NULL DEFAULT(DATETIME ('now','localtime'))
	,Cost NUMERIC NOT NULL DEFAULT 0
	,Margin NUMERIC NOT NULL DEFAULT 0
	,Image BLOB
	,Color TEXT NOT NULL DEFAULT 'Transparent'
	,FOREIGN KEY (ProductGroupId) REFERENCES ProductGroup(Id) ON DELETE CASCADE
	);

INSERT INTO Product (
	Id
	,ProductGroupId
	,Name
	,Code
	,PLU
	,MeasurementUnit
	,Price
	,IsTaxInclusivePrice
	,CurrencyId
	,IsPriceChangeAllowed
	,IsService
	,IsUsingDefaultQuantity
	,IsEnabled
	,Description
	,DateCreated
	,DateUpdated
	,Cost
	,Margin
	,Image
	,Color
	)
SELECT Id
	,ProductGroupId
	,Name
	,Code
	,PLU
	,MeasurementUnit
	,Price
	,IsVATInclusivePrice
	,CurrencyId
	,IsPriceChangeAllowed
	,IsService
	,IsUsingDefaultQuantity
	,IsEnabled
	,Description
	,DateCreated
	,DateUpdated
	,Cost
	,Margin
	,Image
	,Color
FROM temp_table;

DROP TABLE temp_table;

CREATE TABLE temp_table AS SELECT * FROM DocumentItem;

DROP TABLE DocumentItem;

CREATE TABLE DocumentItem (
	Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL
	,DocumentId INTEGER REFERENCES Document(Id) ON DELETE CASCADE NOT NULL
	,ProductId INTEGER REFERENCES Product(Id) NOT NULL
	,Quantity NUMERIC NOT NULL DEFAULT(0)
	,ExpectedQuantity NUMERIC NOT NULL DEFAULT(0)
	,PriceBeforeTax NUMERIC NOT NULL DEFAULT(0)
	,Price NUMERIC NOT NULL
	,Discount NUMERIC NOT NULL DEFAULT(0)
	,DiscountType INTEGER NOT NULL DEFAULT(0)
	,ProductCost NUMERIC NOT NULL DEFAULT 0
 	,PriceBeforeTaxAfterDiscount NUMERIC NOT NULL DEFAULT(0)
	,PriceAfterDiscount NUMERIC NOT NULL DEFAULT(0)
	,Total NUMERIC NOT NULL DEFAULT(0)
             ,TotalAfterDocumentDiscount NUMERIC NOT NULL DEFAULT(0)
	);

INSERT INTO DocumentItem (
	Id
	,DocumentId
	,ProductId
	,Quantity
	,ExpectedQuantity
	,PriceBeforeTax
	,Discount
	,Price
	,ProductCost
	,DiscountType
	,PriceAfterDiscount
 	,PriceBeforeTaxAfterDiscount
	,Total
	)
SELECT       T.Id
            ,T.DocumentId
            ,T.ProductId
            ,T.Quantity
            ,T.ExpectedQuantity
            ,T.PriceBeforeTax
            ,T.Discount
            ,T.Price
            ,T.ProductCost
            ,T.DiscountType
            ,T.PriceAfterDiscount
            ,T.PriceAfterDiscount / (ROUND(1.00,2) + V.Rate)
            ,T.Total
FROM        temp_table AS T 
            INNER JOIN VATRate AS V ON T.VATRateId = V.Id;

UPDATE DocumentItem SET TotalAfterDocumentDiscount = (SELECT CASE WHEN DocumentItem.Quantity <> 0 THEN Price * DocumentItem.Quantity ELSE 0.00 END FROM DocumentItemPriceView WHERE DocumentItemId = DocumentItem.Id);

DROP TABLE temp_table;

DROP TABLE VATRate;

PRAGMA foreign_keys = 1;
