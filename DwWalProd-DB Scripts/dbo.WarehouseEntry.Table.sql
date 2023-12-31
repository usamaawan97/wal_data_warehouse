/****** Object:  Table [dbo].[WarehouseEntry]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseEntry](
	[EntryNo] [bigint] NOT NULL,
	[CompanyCode] [nvarchar](10) NOT NULL,
	[BinCode] [nvarchar](150) NULL,
	[BinTypeCode] [nvarchar](150) NULL,
	[Cubage] [decimal](38, 10) NULL,
	[Dedicated] [bit] NULL,
	[Description] [nvarchar](150) NULL,
	[EntryType] [nvarchar](150) NULL,
	[ExpirationDate] [date] NULL,
	[ItemNo] [nvarchar](150) NULL,
	[JournalBatchName] [nvarchar](150) NULL,
	[JournalTemplateName] [nvarchar](150) NULL,
	[LineNo] [bigint] NULL,
	[LocationCode] [nvarchar](150) NULL,
	[LotNo] [nvarchar](150) NULL,
	[NoSeries] [nvarchar](150) NULL,
	[PackageNo] [nvarchar](150) NULL,
	[PhysInvtCountingPeriodCode] [nvarchar](150) NULL,
	[PhysInvtCountingPeriodType] [nvarchar](150) NULL,
	[QtyBase] [decimal](38, 10) NULL,
	[QtyperUnitofMeasure] [decimal](38, 10) NULL,
	[Quantity] [decimal](38, 10) NULL,
	[ReasonCode] [nvarchar](150) NULL,
	[ReferenceDocument] [nvarchar](150) NULL,
	[ReferenceNo] [nvarchar](150) NULL,
	[RegisteringDate] [date] NULL,
	[SerialNo] [nvarchar](150) NULL,
	[SourceCode] [nvarchar](150) NULL,
	[SourceDocument] [nvarchar](150) NULL,
	[SourceLineNo] [bigint] NULL,
	[SourceNo] [nvarchar](150) NULL,
	[SourceSublineNo] [bigint] NULL,
	[SourceSubtype] [nvarchar](150) NULL,
	[SourceType] [decimal](38, 10) NULL,
	[SystemCreatedAt] [nvarchar](150) NULL,
	[SystemCreatedBy] [nvarchar](150) NULL,
	[SystemId] [nvarchar](150) NULL,
	[SystemModifiedAt] [nvarchar](150) NULL,
	[SystemModifiedBy] [nvarchar](150) NULL,
	[UnitofMeasureCode] [nvarchar](150) NULL,
	[UserID] [nvarchar](150) NULL,
	[VariantCode] [nvarchar](150) NULL,
	[WarrantyDate] [date] NULL,
	[Weight] [decimal](38, 10) NULL,
	[WhseDocumentLineNo] [bigint] NULL,
	[WhseDocumentNo] [nvarchar](150) NULL,
	[WhseDocumentType] [nvarchar](150) NULL,
	[ZoneCode] [nvarchar](150) NULL,
	[SystemCreatedDate] [datetime2](7) NULL,
	[SystemModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_WarehouseEntry] PRIMARY KEY CLUSTERED 
(
	[EntryNo] ASC,
	[CompanyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
