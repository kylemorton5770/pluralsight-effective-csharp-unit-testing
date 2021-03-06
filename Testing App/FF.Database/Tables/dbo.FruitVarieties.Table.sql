CREATE TABLE [dbo].[FruitVarieties](
	[FruitVarietyId] [int] IDENTITY(1,1) NOT NULL,
	[FruitId] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Summary] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[WikiLink] [varchar](200) NULL,
	[StockImage] [varbinary](max) NULL,
	[AkaFruitVarietyId] [int] NULL,
	[AddedBy] [int] NOT NULL,
	[AddedWhen] [datetime] NOT NULL CONSTRAINT [DF_FruitVarieties_AddedWhen_1]  DEFAULT (getutcdate()),
	[UpdatedBy] [int] NOT NULL,
	[UpdatedWhen] [datetime] NOT NULL CONSTRAINT [DF_FruitVarieties_UpdatedWhen_1]  DEFAULT (getutcdate()),
	[IsApproved] [bit] NOT NULL CONSTRAINT [DF_FruitVarieties_IsApproved_1]  DEFAULT ((1)),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_FruitVarieties_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_FruitVarieties] PRIMARY KEY CLUSTERED (	[FruitVarietyId] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[FruitVarieties]  WITH CHECK ADD  CONSTRAINT [FK_FruitVarieties_Fruits] FOREIGN KEY([FruitId])REFERENCES [dbo].[Fruits] ([FruitId])
GO
ALTER TABLE [dbo].[FruitVarieties] CHECK CONSTRAINT [FK_FruitVarieties_Fruits]
GO
ALTER TABLE [dbo].[FruitVarieties]  WITH CHECK ADD  CONSTRAINT [FK_FruitVarieties_FruitVarieties] FOREIGN KEY([AkaFruitVarietyId])REFERENCES [dbo].[FruitVarieties] ([FruitVarietyId])
GO
ALTER TABLE [dbo].[FruitVarieties] CHECK CONSTRAINT [FK_FruitVarieties_FruitVarieties]
GO
