/****** Object:  Table [dbo].[GLBudgetName]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GLBudgetName](
	[Name] [nvarchar](100) NOT NULL,
	[CompanyCode] [nvarchar](10) NOT NULL,
	[Blocked] [bit] NULL,
	[BudgetDimension1Code] [nvarchar](100) NULL,
	[BudgetDimension2Code] [nvarchar](100) NULL,
	[BudgetDimension3Code] [nvarchar](100) NULL,
	[BudgetDimension4Code] [nvarchar](100) NULL,
	[Description] [nvarchar](100) NULL,
	[SystemCreatedAt] [datetime2](7) NULL,
	[SystemCreatedBy] [nvarchar](100) NULL,
	[SystemId] [nvarchar](100) NULL,
	[SystemModifiedAt] [datetime2](7) NULL,
	[SystemModifiedBy] [nvarchar](100) NULL,
	[Include_in_Reports] [bit] NULL,
 CONSTRAINT [PK_GLBudgetName] PRIMARY KEY CLUSTERED 
(
	[Name] ASC,
	[CompanyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
