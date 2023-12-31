/****** Object:  StoredProcedure [dbo].[Get_Service_Configuration_For_Incremental]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:      Usama Awan
-- Create Date: 09-23-2021
-- Description: Created to get configuration for services
-- =============================================

--EXEC dbo.[Get_Service_Configuration_For_Incremental] 'FBL' , 'GetSalesInvoiceLine','SalesInvoiceLine'

CREATE PROCEDURE [dbo].[Get_Service_Configuration_For_Incremental]
(
   @CompanyCode NVARCHAR(50),
   @ServiceCode NVARCHAR(80),
   @TableName NVARCHAR(200)
)
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @BCBaseURL NVARCHAR(80)
	DECLARE @CurrEnv NVARCHAR(20)
	DECLARE @TennantID NVARCHAR(40)
	DECLARE @CompanyName NVARCHAR(150)
	DECLARE @ApiVersion NVARCHAR(20)
	DECLARE @ServiceName NVARCHAR(80)
	DECLARE @IsOData BIT
	DECLARE @IsReload BIT
	DECLARE @ODataVersion NVARCHAR(20)
	DECLARE @RelativeURL NVARCHAR(1000)
	DECLARE @FullURL NVARCHAR(1000)
	DECLARE @FilterExpression NVARCHAR(MAX)
	DECLARE @IsBulkLoad BIT
	DECLARE @IsSpecificDate BIT


	SELECT @BCBaseURL = BCBaseURL FROM [dbo].[DW_Interface_Setup] 
	
	SELECT @TennantID = CC.TennantID, @CompanyName =CompanyName,@CurrEnv = ActiveEnvironment FROM [dbo].[DW_Company_Config] CC WHERE CompanyCode = @CompanyCode
	
	SELECT @IsSpecificDate = IsSpecificDate ,@IsBulkLoad = IsBulkLoad,@IsReload = IsReload ,@ApiVersion = APIVersion, @ServiceName = ServiceName , @IsOData = IsOdata, @ODataVersion = ODataVersion
	FROM dbo.[DW_BC_Service_Setup] BCS  WHERE ServiceCode = @ServiceCode

	IF @IsOData= 0 
		  BEGIN 
					--https://api.businesscentral.dynamics.com/v2.0/ac636b3d-2eb0-41e7-b5a6-7e15645731e9/SandboxDev/WS/We%20Are%20Luxe%20-%20Live/Codeunit/MessageMgmt
					SET  @RelativeURL =  @ApiVersion + '/' + @TennantID  +'/'  + @CurrEnv + '/WS/'+ +@CompanyName + '/' + @ServiceName
					SET  @FullURL =  RTRIM( LTRIM(@BCBaseURL))  + @RelativeURL
		  END 
	
	ELSE 
		  BEGIN
					--https://api.businesscentral.dynamics.com/v2.0/ac636b3d-2eb0-41e7-b5a6-7e15645731e9/SandboxDev/ODataV4/Company('Future%20Beauty%20Labs%20US%20Inc')/BinContentQuery
					if @IsReload = 1 AND @IsSpecificDate = 0
						  BEGIN
								SET  @RelativeURL = @ApiVersion + '/' + @TennantID  +'/'  + @CurrEnv + '/' + @ODataVersion + '/Company(''' + @CompanyName + ''')/' + @ServiceName
								SET @FullURL = RTRIM(LTRIM(@BCBaseURL)) + @RelativeURL
						  END 
					ELSE
						  BEGIN
								EXEC dbo.[Get_OData_Filter_Expression] @TableName, @IsBulkLoad , @IsSpecificDate, @CompanyCode, @FilterExpression OUTPUT 
								SET  @RelativeURL = @ApiVersion + '/' + @TennantID  +'/'  + @CurrEnv + '/' + @ODataVersion + '/Company(''' + @CompanyName + ''')/' + @ServiceName + @FilterExpression
								SET @FullURL = RTRIM(LTRIM(@BCBaseURL)) + @RelativeURL
						  END 

		           SELECT @FullURL  AS ServiceURL , @BCBaseURL AS BaseURL , @RelativeURL AS RelativeURL, @FilterExpression AS FilterExpression, @CompanyCode AS CompanyCode
		END
END
GO
