/****** Object:  Table [dbo].[CurrencyExchangeRate]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurrencyExchangeRate](
	[CurrencyCode] [nvarchar](10) NOT NULL,
	[StartingDate] [date] NOT NULL,
	[CompanyCode] [nvarchar](10) NOT NULL,
	[ExchangeRateAmount] [decimal](38, 10) NULL,
	[AdjustmentExchRateAmount] [decimal](38, 10) NULL,
	[RelationalCurrencyCode] [nvarchar](100) NULL,
	[RelationalExchRateAmount] [decimal](38, 10) NULL,
	[FixExchangeRateAmount] [nvarchar](40) NULL,
	[RelationalAdjmtExchRateAmt] [decimal](38, 10) NULL,
 CONSTRAINT [PK_CurrencyExchangeRate] PRIMARY KEY CLUSTERED 
(
	[CurrencyCode] ASC,
	[StartingDate] ASC,
	[CompanyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
