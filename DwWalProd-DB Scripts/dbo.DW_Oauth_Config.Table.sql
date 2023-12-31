/****** Object:  Table [dbo].[DW_Oauth_Config]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DW_Oauth_Config](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceCode] [nvarchar](500) NULL,
	[TenantID] [nvarchar](500) NULL,
	[OauthBaseURL] [nvarchar](500) NULL,
	[OauthVersion] [nvarchar](50) NULL,
	[ContentType] [nvarchar](500) NULL,
	[GrantType] [nvarchar](500) NULL,
	[ClientID] [nvarchar](500) NULL,
	[ClientSecret] [nvarchar](500) NULL,
	[Scope] [nvarchar](600) NULL,
 CONSTRAINT [PK_DW_Oauth_Config] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
