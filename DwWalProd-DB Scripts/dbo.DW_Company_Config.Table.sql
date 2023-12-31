/****** Object:  Table [dbo].[DW_Company_Config]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DW_Company_Config](
	[CompanyCode] [nvarchar](100) NOT NULL,
	[CompanyName] [nvarchar](max) NULL,
	[TennantID] [nvarchar](40) NULL,
	[ActiveEnvironment] [nvarchar](40) NULL,
	[Enabled] [bit] NULL,
 CONSTRAINT [PK_DW_Company_Config] PRIMARY KEY CLUSTERED 
(
	[CompanyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
