/****** Object:  Table [dbo].[DW_Interface_Setup]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DW_Interface_Setup](
	[WB_Interface_Setup_Id] [int] IDENTITY(1,1) NOT NULL,
	[BCBaseURL] [nvarchar](1000) NULL,
	[InterfaceSuccessAlertEmails] [nvarchar](max) NULL,
	[InterfaceFailureAlertEmails] [nvarchar](max) NULL,
	[LastUpadted] [datetime2](7) NULL,
	[StartFromDate] [nvarchar](100) NULL,
 CONSTRAINT [PK_WB_Interface_Setup] PRIMARY KEY CLUSTERED 
(
	[WB_Interface_Setup_Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
