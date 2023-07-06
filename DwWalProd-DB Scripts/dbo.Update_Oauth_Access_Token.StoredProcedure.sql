/****** Object:  StoredProcedure [dbo].[Update_Oauth_Access_Token]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:      Usama Awan
-- Create Date: 05-30-22
-- Description: Update Access Token Of SandBoxDev
-- =============================================

--EXEC [dbo].[Update_Oauth_Access_Token] 'abc'

CREATE PROCEDURE [dbo].[Update_Oauth_Access_Token]
@AccessToken NVARCHAR(MAX)
AS
BEGIN
    
	SET NOCOUNT ON;

    UPDATE dbo.DW_Oauth_Access_Token
   SET 
      AccessToken = @AccessToken;
      
END
GO
