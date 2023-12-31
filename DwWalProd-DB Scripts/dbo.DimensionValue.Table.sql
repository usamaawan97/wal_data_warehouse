/****** Object:  Table [dbo].[DimensionValue]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimensionValue](
	[DimensionValueID] [int] NOT NULL,
	[CompanyCode] [nvarchar](10) NOT NULL,
	[DimensionCode] [nvarchar](100) NULL,
	[Code] [nvarchar](100) NULL,
	[Name] [nvarchar](100) NULL,
	[DimensionValueType] [nvarchar](40) NULL,
	[Totaling] [nvarchar](100) NULL,
	[Blocked] [bit] NULL,
	[ConsolidationCode] [nvarchar](100) NULL,
	[Indentation] [int] NULL,
	[GlobalDimensionNo] [int] NULL,
	[MapToICDimensionCode] [nvarchar](100) NULL,
	[MapToICDimensionValueCode] [nvarchar](100) NULL,
	[LastModifiedDateTime] [datetime] NULL,
 CONSTRAINT [PK_DimensionValue] PRIMARY KEY CLUSTERED 
(
	[DimensionValueID] ASC,
	[CompanyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
