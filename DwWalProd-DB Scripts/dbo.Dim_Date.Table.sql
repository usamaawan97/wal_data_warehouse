/****** Object:  Table [dbo].[Dim_Date]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Date](
	[Calendar_Date] [date] NOT NULL,
	[Calendar_Date_String] [varchar](10) NOT NULL,
	[Calendar_Month] [tinyint] NOT NULL,
	[Calendar_Day] [tinyint] NOT NULL,
	[Calendar_Year] [smallint] NOT NULL,
	[Calendar_Quarter] [tinyint] NOT NULL,
	[Day_Name] [varchar](9) NOT NULL,
	[Day_of_Week] [tinyint] NOT NULL,
	[Day_of_Week_in_Month] [tinyint] NOT NULL,
	[Day_of_Week_in_Year] [tinyint] NOT NULL,
	[Day_of_Week_in_Quarter] [tinyint] NOT NULL,
	[Day_of_Quarter] [tinyint] NOT NULL,
	[Day_of_Year] [smallint] NOT NULL,
	[Week_of_Month] [tinyint] NOT NULL,
	[Week_of_Quarter] [tinyint] NOT NULL,
	[Week_of_Year] [tinyint] NOT NULL,
	[Month_Name] [varchar](9) NOT NULL,
	[First_Date_of_Week] [date] NOT NULL,
	[Last_Date_of_Week] [date] NOT NULL,
	[First_Date_of_Month] [date] NOT NULL,
	[Last_Date_of_Month] [date] NOT NULL,
	[First_Date_of_Quarter] [date] NOT NULL,
	[Last_Date_of_Quarter] [date] NOT NULL,
	[First_Date_of_Year] [date] NOT NULL,
	[Last_Date_of_Year] [date] NOT NULL,
	[Is_Holiday] [bit] NOT NULL,
	[Is_Holiday_Season] [bit] NOT NULL,
	[Holiday_Name] [varchar](50) NULL,
	[Holiday_Season_Name] [varchar](50) NULL,
	[Is_Weekday] [bit] NOT NULL,
	[Is_Business_Day] [bit] NOT NULL,
	[Previous_Business_Day] [date] NULL,
	[Next_Business_Day] [date] NULL,
	[Is_Leap_Year] [bit] NOT NULL,
	[Days_in_Month] [tinyint] NOT NULL,
 CONSTRAINT [PK_Dim_Date] PRIMARY KEY CLUSTERED 
(
	[Calendar_Date] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
