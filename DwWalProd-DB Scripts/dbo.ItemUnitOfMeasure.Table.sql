/****** Object:  Table [dbo].[ItemUnitOfMeasure]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemUnitOfMeasure](
	[ItemNo] [nvarchar](20) NOT NULL,
	[Code] [nvarchar](10) NOT NULL,
	[CompanyCode] [nvarchar](10) NOT NULL,
	[Cubage] [decimal](18, 10) NULL,
	[Height] [decimal](18, 10) NULL,
	[Length] [decimal](18, 10) NULL,
	[QtyperUnitofMeasure] [decimal](18, 10) NULL,
	[Weight] [decimal](18, 10) NULL,
	[Width] [decimal](18, 10) NULL,
 CONSTRAINT [PK_ItemUnitOfMeasure] PRIMARY KEY CLUSTERED 
(
	[ItemNo] ASC,
	[Code] ASC,
	[CompanyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
