IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PosOrder__Discou__1CBC4616]') AND type = 'D')
BEGIN
	ALTER TABLE [dbo].[PosOrder] DROP CONSTRAINT [DF__PosOrder__Discou__1CBC4616]
END
GO
ALTER TABLE [dbo].PosOrder ALTER COLUMN Discount FLOAT NOT NULL;
GO
ALTER TABLE [dbo].[PosOrder] ADD  CONSTRAINT [DF__PosOrder__Discou__1CBC4616]  DEFAULT ((0)) FOR [Discount];