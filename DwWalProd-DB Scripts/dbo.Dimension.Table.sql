/****** Object:  Table [dbo].[Dimension]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimension](
	[Code] [nvarchar](20) NOT NULL,
	[CompanyCode] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CodeCaption] [nvarchar](100) NULL,
	[FilterCaption] [nvarchar](100) NULL,
	[Description] [nvarchar](100) NULL,
	[Blocked] [bit] NULL,
	[ConsolidationCode] [nvarchar](100) NULL,
	[MaptoICDimensionCode] [nvarchar](100) NULL,
	[LastModifiedDateTime] [datetime] NULL,
	[Id] [nvarchar](100) NULL,
 CONSTRAINT [PK_Dimension] PRIMARY KEY CLUSTERED 
(
	[Code] ASC,
	[CompanyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
