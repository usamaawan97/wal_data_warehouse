/****** Object:  Table [dbo].[GLBudgetExchangeRate]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GLBudgetExchangeRate](
	[BudgetExchageRateUSD] [decimal](18, 6) NULL,
	[CompanyCode] [nvarchar](10) NULL,
	[GLBudgetName] [nvarchar](100) NULL,
	[Month] [bigint] NULL,
	[Year] [bigint] NULL,
	[SystemCreatedAt] [datetime2](7) NULL,
	[SystemCreatedBy] [nvarchar](100) NULL,
	[SystemId] [nvarchar](100) NULL,
	[SystemModifiedAt] [datetime2](7) NULL,
	[SystemModifiedBy] [nvarchar](100) NULL
) ON [PRIMARY]
GO
