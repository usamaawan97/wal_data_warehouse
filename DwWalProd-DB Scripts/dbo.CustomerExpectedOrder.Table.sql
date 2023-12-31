/****** Object:  Table [dbo].[CustomerExpectedOrder]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerExpectedOrder](
	[Customer_No] [nvarchar](20) NOT NULL,
	[Shortcut_Dimension_1_Code] [nvarchar](50) NOT NULL,
	[CompanyCode] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Expected_Order_Amt] [decimal](18, 10) NULL,
	[Risk_Amount] [decimal](18, 10) NULL,
	[Created_Date] [date] NULL,
	[Modified_Date] [date] NULL,
 CONSTRAINT [PK_CustomerExpectedOrder] PRIMARY KEY CLUSTERED 
(
	[Customer_No] ASC,
	[Shortcut_Dimension_1_Code] ASC,
	[CompanyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
