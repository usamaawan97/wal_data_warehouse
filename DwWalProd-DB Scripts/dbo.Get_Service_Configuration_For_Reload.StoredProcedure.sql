/****** Object:  StoredProcedure [dbo].[Get_Service_Configuration_For_Reload]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:      Usama Awan
-- Create Date: 09-23-2021
-- Description: Created to get configuration for services
-- =============================================

--EXEC dbo.[Get_Service_Configuration_For_Reload] 'WAL' , 'GetBinContent'

CREATE PROCEDURE [dbo].[Get_Service_Configuration_For_Reload]
(
   @CompanyCode nvarchar(50),
   @ServiceCode nvarchar(80)
)
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @BCBaseURL nvarchar(80)
	DECLARE @CurrEnv nvarchar(20)
	DECLARE @TennantID nvarchar(40)
	DECLARE @CompanyName nvarchar(80)
	DECLARE @ApiVersion nvarchar(20)
	DECLARE @ServiceName nvarchar(80)
	DECLARE @IsOData bit
	DECLARE @ODataVersion nvarchar(20)
	DECLARE @RelativeURL nvarchar(1000)
	DECLARE @FullURL nvarchar(1000)

	SELECT @BCBaseURL = BCBaseURL from [dbo].[DW_Interface_Setup] 
	
	SELECT @TennantID = CC.TennantID , @CompanyName = CompanyName, @CurrEnv = ActiveEnvironment FROM [dbo].[DW_Company_Config] CC WHERE CompanyCode = @CompanyCode
	
	SELECT @ApiVersion = APIVersion, @ServiceName = ServiceName , @IsOData = IsOdata, @ODataVersion = ODataVersion
	from dbo.[DW_BC_Service_Setup] BCS  WHERE ServiceCode = @ServiceCode

	if @IsOData= 0 begin 
		--https://api.businesscentral.dynamics.com/v2.0/ac636b3d-2eb0-41e7-b5a6-7e15645731e9/SandboxDev/WS/We%20Are%20Luxe%20-%20Live/Codeunit/MessageMgmt
		SET  @RelativeURL =  @ApiVersion + '/' + @TennantID  +'/'  + @CurrEnv + '/WS/'+ +@CompanyName + '/' + @ServiceName
		
		SET  @FullURL =  RTRIM( LTRIM(@BCBaseURL))  + @RelativeURL
	end else 
		
		SET  @RelativeURL = @ApiVersion + '/' + @TennantID  +'/'  + @CurrEnv + '/' + @ODataVersion + '/Company(''' + @CompanyName + ''')/' + @ServiceName
		SET @FullURL = RTRIM(LTRIM(@BCBaseURL)) + @RelativeURL
		--https://api.businesscentral.dynamics.com/v2.0/ac636b3d-2eb0-41e7-b5a6-7e15645731e9/SandboxDev/ODataV4/Company('Future%20Beauty%20Labs%20US%20Inc')/BinContentQuery

	SELECT @FullURL  as ServiceURL , @BCBaseURL as BaseURL , @RelativeURL as RelativeURL, @CompanyCode AS CompanyCode

END
GO
