/****** Object:  Table [dbo].[CustomerGroup]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerGroup](
	[GroupCode] [nvarchar](100) NOT NULL,
	[CompanyCode] [nvarchar](10) NOT NULL,
	[Country] [nvarchar](100) NULL,
	[Currency] [nvarchar](100) NULL,
	[SystemCreatedAt] [datetime2](7) NULL,
	[SystemCreatedBy] [nvarchar](100) NULL,
	[SystemId] [nvarchar](100) NULL,
	[SystemModifiedAt] [datetime2](7) NULL,
	[SystemModifiedBy] [nvarchar](100) NULL,
	[Description] [nvarchar](150) NULL,
	[BrandCode] [nvarchar](10) NULL,
 CONSTRAINT [PK_CustomerGroup] PRIMARY KEY CLUSTERED 
(
	[GroupCode] ASC,
	[CompanyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
