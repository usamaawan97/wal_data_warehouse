/****** Object:  View [dbo].[Master Customer List]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE VIEW [dbo].[Master Customer List]
AS
     SELECT DISTINCT
		C.CompanyCode as CompanyCode
		--, Case WHEN C.CountryRegionCode <> '' THEN C.CountryRegionCode WHEN C.CompanyCode = 'FBL' THEN 'US' WHEN C.CompanyCode = 'WAL' then 'UK' ELSE C.CompanyCode END AS HeadOfSales
		, Case C.CompanyCode when 'FBL' THEN 'US' WHEN 'WAL' then 'UK' ELSE C.CompanyCode END AS HeadOfSales
		, ResponsibilityCenter AS ResponsibiltyCenter
		--, [No] AS  [BC Cust Code]
		, Case ISNULL(C.CustomerGroup,'') WHEN '' THEN [No] ELSE CustomerGroup END AS [Cust Code]
		, Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.Name ELSE C.CustomerGroup END AS [Cust Name]
		--, [Name] AS Customer 
		,  Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.CountryRegionCode ELSE CG.Country END AS CountryCode
		,  CASE ISNULL(C.CustomerGroup,'') WHEN '' THEN  
											CASE C.CurrencyCode WHEN '' THEN GLS.LCYCode ELSE C.CurrencyCode END
									   ELSE CG.Currency END  AS Currency 
		 --, C.GlobalDimension1Code as BrandDim
		--, C.GlobalDimension2Code as LocationDim
		, CD.DimensionValueCode AS ChannelDim
		--, CRD.DimensionValueCode as CustomerDim
		, DD.DimensionValueCode as DepartmentDim
		--, GD.DimensionValueCode as GeographyDim
		, ISNULL(BD.DimensionValueCode, C.GlobalDimension1Code)  as BrandDim
		--, CONCAT( C.CompanyCode ,C.[No] ) AS CCCustKey
		, CONCAT( C.CompanyCode , Case ISNULL(C.CustomerGroup,'') WHEN '' THEN [No] ELSE CustomerGroup END)  AS CCCustKey
		, C.CustomerGroup as CustomerGroup   
	 FROM dbo.Customer C WITH(NOLOCK)
	 INNER JOIN dbo.GLSetup GLS WITH(NOLOCK) ON  GLS.CompanyCode = C.CompanyCode
	 LEFT JOIN dbo.CustomerGroup CG WITH(NOLOCK) ON C.CompanyCode = CG.CompanyCode AND C.CustomerGroup = CG.GroupCode
	 LEFT JOIN dbo.[Customer Dimensions] CD WITH(NOLOCK) ON CD.[Cust Code] = C.No  AND CD.DimensionCode = 'CHANNEL'
	 --LEFT JOIN dbo.[Customer Dimensions] CDim WITH(NOLOCK) ON CDim.[Cust Code] = C.No  AND CDim.DimensionValueCode = 'OTHER'
	 LEFT JOIN dbo.[Customer Dimensions] CRD WITH(NOLOCK) ON CRD.[Cust Code] = C.No  AND CRD.DimensionCode = 'CUSTOMER'
	 LEFT JOIN dbo.[Customer Dimensions] DD WITH(NOLOCK) ON DD.[Cust Code] = C.No  AND DD.DimensionCode = 'DEPARTMENT'
	 --LEFT JOIN dbo.[Customer Dimensions] GD WITH(NOLOCK) ON GD.BCCustCode = C.No  AND GD.DimensionCode = 'GEOGRAPHY'
	 LEFT JOIN dbo.[Customer Dimensions] BD WITH(NOLOCK) ON BD.[Cust Code] = C.No  AND BD.DimensionCode = 'BRAND'
GO
