IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CustomerDiscount]') AND name = N'IX_CustomerDiscount_Type_EntityId')
ALTER TABLE [dbo].[CustomerDiscount] DROP CONSTRAINT [IX_CustomerDiscount_Type_EntityId]
GO
ALTER TABLE [dbo].[CustomerDiscount] ADD  CONSTRAINT [IX_CustomerDiscount_Type_EntityId] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[Type] ASC,
	[Uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO