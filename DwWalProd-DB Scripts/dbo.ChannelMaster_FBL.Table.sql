/****** Object:  Table [dbo].[ChannelMaster_FBL]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChannelMaster_FBL](
	[DimSetID] [int] NOT NULL,
	[DimCode] [nchar](10) NULL,
	[DimValue] [nchar](25) NULL,
 CONSTRAINT [PK_ChannelMaster_FBL] PRIMARY KEY CLUSTERED 
(
	[DimSetID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
