/****** Object:  User [LiamBoyle]    Script Date: 10/27/2022 8:34:07 AM ******/
CREATE USER [LiamBoyle] FOR LOGIN [LiamBoyle] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'LiamBoyle'
GO
