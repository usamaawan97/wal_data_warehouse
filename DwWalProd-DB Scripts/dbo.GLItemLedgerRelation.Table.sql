/****** Object:  Table [dbo].[GLItemLedgerRelation]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GLItemLedgerRelation](
	[GLEntryNo] [int] NOT NULL,
	[CompanyCode] [nvarchar](10) NULL,
	[ValueEntryNo] [int] NULL,
	[GLRegisterNo] [int] NULL,
	[SystemCreatedDate] [datetime2](7) NULL,
	[SystemModifiedDate] [datetime2](7) NULL
) ON [PRIMARY]
GO
