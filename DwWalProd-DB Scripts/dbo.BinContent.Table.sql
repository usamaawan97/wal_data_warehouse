/****** Object:  Table [dbo].[BinContent]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinContent](
	[LocationCode] [nvarchar](10) NOT NULL,
	[BinCode] [nvarchar](20) NOT NULL,
	[ItemNo] [nvarchar](20) NOT NULL,
	[VariantCode] [nvarchar](10) NOT NULL,
	[UnitofMeasureCode] [nvarchar](10) NOT NULL,
	[CompanyCode] [nvarchar](10) NOT NULL,
	[BinRanking] [decimal](18, 10) NULL,
	[BinTypeCode] [nvarchar](10) NULL,
	[BlockMovement] [nvarchar](40) NULL,
	[CrossDockBin] [bit] NULL,
	[Dedicated] [bit] NULL,
	[Default] [bit] NULL,
	[Fixed] [bit] NULL,
	[MaxQty] [decimal](18, 10) NULL,
	[MinQty] [decimal](18, 10) NULL,
	[QtyperUnitofMeasure] [decimal](18, 10) NULL,
	[SystemCreatedAt] [nvarchar](50) NULL,
	[SystemCreatedBy] [nvarchar](50) NULL,
	[SystemId] [nvarchar](50) NULL,
	[SystemModifiedAt] [nvarchar](50) NULL,
	[SystemModifiedBy] [nvarchar](50) NULL,
	[WarehouseClassCode] [nvarchar](10) NULL,
	[ZoneCode] [nvarchar](10) NULL,
	[ATOComponentsPickQtyBase] [decimal](18, 10) NULL,
	[ATOComponentsPickQty] [decimal](18, 10) NULL,
	[NegAdjmtQty] [decimal](18, 10) NULL,
	[NegativeAdjmtQtyBase] [decimal](18, 10) NULL,
	[PickQty] [decimal](18, 10) NULL,
	[PickQuantityBase] [decimal](18, 10) NULL,
	[PosAdjmtQty] [decimal](18, 10) NULL,
	[PositiveAdjmtQtyBase] [decimal](18, 10) NULL,
	[PutawayQty] [decimal](18, 10) NULL,
	[PutawayQuantityBase] [decimal](18, 10) NULL,
	[Quantity] [decimal](18, 10) NULL,
	[QuantityBase] [decimal](18, 10) NULL,
 CONSTRAINT [PK_BinContent] PRIMARY KEY CLUSTERED 
(
	[LocationCode] ASC,
	[BinCode] ASC,
	[ItemNo] ASC,
	[VariantCode] ASC,
	[UnitofMeasureCode] ASC,
	[CompanyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
