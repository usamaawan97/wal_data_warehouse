/****** Object:  Table [dbo].[DW_BC_Service_Setup]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DW_BC_Service_Setup](
	[BCServiceSetupID] [bigint] IDENTITY(1,1) NOT NULL,
	[ServiceCode] [nvarchar](max) NULL,
	[ServiceName] [nvarchar](max) NULL,
	[APIVersion] [nvarchar](max) NULL,
	[IsOdata] [bit] NULL,
	[ODataVersion] [nvarchar](max) NULL,
	[IsReload] [bit] NULL,
	[IsBulkLoad] [bit] NULL,
	[IsSpecificDate] [bit] NULL,
 CONSTRAINT [PK_BCServiceSetup] PRIMARY KEY CLUSTERED 
(
	[BCServiceSetupID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
