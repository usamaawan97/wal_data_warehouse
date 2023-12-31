/****** Object:  Table [dbo].[DimensionSetEntry]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimensionSetEntry](
	[DimensionSetID] [int] NOT NULL,
	[DimensionCode] [nvarchar](20) NOT NULL,
	[CompanyCode] [nvarchar](10) NOT NULL,
	[DimensionValueCode] [nvarchar](100) NULL,
	[DimensionValueID] [int] NULL,
	[DimensionName] [nvarchar](100) NULL,
	[DimensionValueName] [nvarchar](100) NULL,
	[SystemCreatedDate] [datetime2](7) NULL,
	[SystemModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_DimensionSetEntry] PRIMARY KEY CLUSTERED 
(
	[DimensionSetID] ASC,
	[DimensionCode] ASC,
	[CompanyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
