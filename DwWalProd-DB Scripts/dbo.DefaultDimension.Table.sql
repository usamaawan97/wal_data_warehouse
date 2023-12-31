/****** Object:  Table [dbo].[DefaultDimension]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DefaultDimension](
	[TableID] [int] NULL,
	[No] [nvarchar](20) NOT NULL,
	[DimensionCode] [nvarchar](20) NOT NULL,
	[CompanyCode] [nvarchar](10) NULL,
	[DimensionValueCode] [nvarchar](20) NULL,
	[ValuePosting] [nvarchar](40) NULL,
	[TableCaption] [nvarchar](100) NULL,
	[MultiSelectionAction] [nvarchar](40) NULL
) ON [PRIMARY]
GO
