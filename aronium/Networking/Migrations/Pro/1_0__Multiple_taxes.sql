CREATE TABLE [ProductTax](
	[ProductId] [int] NOT NULL,
	[TaxId] [int] NOT NULL,
 CONSTRAINT [PK_ProductTax] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[TaxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ProductTax]  WITH CHECK ADD  CONSTRAINT [FK_ProductTax_Product] FOREIGN KEY([ProductId])
REFERENCES [Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [ProductTax] CHECK CONSTRAINT [FK_ProductTax_Product]
GO
ALTER TABLE [ProductTax]  WITH CHECK ADD  CONSTRAINT [FK_ProductTax_Tax] FOREIGN KEY([TaxId])
REFERENCES [Tax] ([Id])
GO
ALTER TABLE [ProductTax] CHECK CONSTRAINT [FK_ProductTax_Tax]
GO
INSERT INTO ProductTax (ProductId, TaxId) SELECT Id, TaxId FROM Product;
GO
CREATE TABLE [DocumentItemTax](
	[DocumentItemId] [int] NOT NULL,
	[TaxId] [int] NOT NULL,
	[Amount] [float] NOT NULL,
 CONSTRAINT [PK_DocumentItemTax] PRIMARY KEY CLUSTERED 
(
	[DocumentItemId] ASC,
	[TaxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [DocumentItemTax] ADD  CONSTRAINT [DF_DocumentItemTax_Amount]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [DocumentItemTax]  WITH CHECK ADD  CONSTRAINT [FK_DocumentItemTax_Tax] FOREIGN KEY([TaxId]) REFERENCES [Tax] ([Id])
GO
ALTER TABLE [DocumentItemTax] CHECK CONSTRAINT [FK_DocumentItemTax_Tax]
GO
ALTER TABLE [DocumentItemTax]  WITH CHECK ADD  CONSTRAINT [FK_DocumentItemTax_DocumentItem] FOREIGN KEY([DocumentItemId])
REFERENCES [DocumentItem] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [DocumentItemTax] CHECK CONSTRAINT [FK_DocumentItemTax_DocumentItem]
GO
INSERT INTO DocumentItemTax (DocumentItemId, TaxId, Amount) 
SELECT  I.Id, 
		I.TaxId, 
		CASE WHEN I.Quantity <> 0 THEN (I.Quantity * IP.Price) - ((I.Quantity * IP.Price) / (1.00 + T.Rate)) ELSE 0.00 END 
FROM	DocumentItem I 
		INNER JOIN Tax AS T ON T.Id = I.TaxId 
		INNER JOIN DocumentItemPriceView AS IP ON IP.DocumentItemId = I.Id;
GO
ALTER TABLE Tax ALTER COLUMN Rate DECIMAL(18,4);
GO
UPDATE Tax SET Rate = Rate * 100.00;
GO
ALTER TABLE Tax ADD
	IsFixed bit NOT NULL CONSTRAINT DF_Tax_IsFixed DEFAULT 0,
	IsTaxOnTotal bit NOT NULL CONSTRAINT DF_Tax_IsTaxOnTotal DEFAULT 0,
	IsEnabled bit NOT NULL CONSTRAINT DF_Tax_IsEnabled DEFAULT 1,
	Amount float NOT NULL CONSTRAINT DF_Tax_Amount DEFAULT 0
GO
ALTER TABLE DocumentItem ADD
	PriceBeforeTaxAfterDiscount float NOT NULL CONSTRAINT DF_DocumentItem_PriceBeforeTaxAfterDiscount DEFAULT 0,
	TotalAfterDocumentDiscount float NOT NULL CONSTRAINT DF_DocumentItem_TotalAfterDocumentDiscount DEFAULT 0
GO
UPDATE DocumentItem SET TotalAfterDocumentDiscount = (SELECT CASE WHEN DocumentItem.Quantity <> 0 THEN Price * DocumentItem.Quantity ELSE 0.00 END FROM DocumentItemPriceView WHERE DocumentItemId = DocumentItem.Id);
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Product_Tax]') AND parent_object_id = OBJECT_ID(N'[Product]'))
ALTER TABLE [Product] DROP CONSTRAINT [FK_Product_Tax]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_DocumentItem_Tax]') AND parent_object_id = OBJECT_ID(N'[DocumentItem]'))
ALTER TABLE [DocumentItem] DROP CONSTRAINT [FK_DocumentItem_Tax]
GO
ALTER TABLE [DocumentItem] DROP COLUMN [TaxId]
GO
ALTER TABLE [Product] DROP COLUMN [TaxId]

