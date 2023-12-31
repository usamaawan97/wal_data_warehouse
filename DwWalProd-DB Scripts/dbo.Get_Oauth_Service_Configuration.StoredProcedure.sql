/****** Object:  StoredProcedure [dbo].[Get_Oauth_Service_Configuration]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Usama Awan
-- Create Date: 05-27-2022
-- Description: Created to get configuration for Oauth services
-- =============================================

--EXEC dbo.[Get_Oauth_Service_Configuration] 'GetOauthConfig'

CREATE PROCEDURE [dbo].[Get_Oauth_Service_Configuration]
(
   
   @ServiceCode NVARCHAR(100)
)
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @OauthBaseURL NVARCHAR(500)
	DECLARE @TennantID NVARCHAR(500)
	DECLARE @OauthVersion NVARCHAR(50)
	DECLARE @ContentType NVARCHAR(500)
	DECLARE @GrantType NVARCHAR(500)
	DECLARE @ClientID NVARCHAR(1000)
	DECLARE @ClientSecret NVARCHAR(1000)
	DECLARE @Scope NVARCHAR(1000)
	DECLARE @RelativeURL NVARCHAR(1000)
	DECLARE @FullURL NVARCHAR(1000)
	

	
	SELECT @OauthBaseURL = OC.OauthBaseURL, @TennantID = OC.TenantID , @OauthVersion = OC.OauthVersion,
		   @ContentType = OC.ContentType, @GrantType = OC.GrantType, @ClientID = OC.ClientID,
		   @ClientSecret = OC.ClientSecret, @Scope = OC.Scope
		   FROM [dbo].[DW_Oauth_Config] OC WHERE OC.ServiceCode = @ServiceCode
	 --https://login.microsoftonline.com/ac636b3d-2eb0-41e7-b5a6-7e15645731e9/oauth2/v2.0/token 
	
	SET  @RelativeURL =  @TennantID  +'/'  +'oauth2/'+ @OauthVersion + '/' + 'token'
	SET  @FullURL =   @OauthBaseURL + @RelativeURL
	
	SELECT @FullURL  AS ServiceURL , @RelativeURL AS RelativeURL , @ContentType AS ContentType,
			@GrantType AS GrantType, @ClientID AS ClientID, @ClientSecret AS ClientSecret,
			@Scope AS Scope

END
GO
