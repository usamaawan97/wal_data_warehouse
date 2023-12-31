/****** Object:  Table [dbo].[Currency]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[Code] [nvarchar](10) NOT NULL,
	[CompanyCode] [nvarchar](10) NOT NULL,
	[ISOCode] [nvarchar](100) NULL,
	[ISONumericCode] [nvarchar](100) NULL,
	[Description] [nvarchar](100) NULL,
	[EMUCurrency] [bit] NULL,
	[CurrencyFactor] [decimal](38, 10) NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[Code] ASC,
	[CompanyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
