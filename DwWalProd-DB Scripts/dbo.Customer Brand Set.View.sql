/****** Object:  View [dbo].[Customer Brand Set]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE view [dbo].[Customer Brand Set]
as
select DISTINCT a.* from (
SELECT DISTINCT
	  --C.No as CustomerNo
	--, 
	--Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END AS [Cust Code]
	C.[Cust Code]
	,C.[Cust Name]
	--, Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.Name ELSE C.CustomerGroup END AS [Cust Name]
	--, C.Name 
	, C.CompanyCode
	--,  CASE ISNULL(C.CustomerGroup,'') WHEN '' THEN  
	--									CASE C.CurrencyCode WHEN '' THEN GLS.LCYCode ELSE C.CurrencyCode END
	--							 ELSE CG.Currency 
	--	END  AS CustCurrencyCode 
	, C.Currency as CustCurrencyCode
	
	--, C.CountryRegionCode as Country
	--,  Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.CountryRegionCode ELSE CG.Country END AS Country
	,C.CountryCode  as Country
	, SIL.ShortcutDimension1Code as BrandCode
	, GLS.LCYCode as CompanyCurrencyCode 
    , CONCAT(C.CompanyCode  ,C.[Cust Code] ) AS CCCustKey
	--, CONCAT(SIH.CompanyCode, SIH.SelltoCustomerNo , SIL.ShortcutDimension1Code) as CCCustNoDimKey
	, CONCAT(SIH.CompanyCode,[Cust Code] , SIL.ShortcutDimension1Code) as CCCustChainDimKey
FROM 
	dbo.SalesInvoiceHeader	SIH WITH(NOLOCK)
	INNER JOIN dbo.SalesInvoiceLine SIL WITH(NOLOCK) ON SIL.DocumentNo = SIH.No
		AND SIL.CompanyCode = SIH.CompanyCode
	--INNER JOIN dbo.Customer C WITH(NOLOCK) ON SIL.SelltoCustomerNo = C.[No]  AND C.CompanyCode = SIL.CompanyCode
	INNER JOIN [Master Customer List] C ON SIL.CompanyCode = C.CompanyCode AND 
		C.[Cust Code] =  SIL.SelltoCustomerNo 
	INNER JOIN dbo.GLSetup GLS WITH(NOLOCK) ON  GLS.CompanyCode = C.CompanyCode
	--LEFT JOIN dbo.CustomerGroup CG WITH(NOLOCK) ON C.CompanyCode = CG.CompanyCode AND C.CustomerGroup = CG.GroupCode
WHERE Type <> ''  AND SIL.ShipmentDate >= '2000-01-01' 

UNION 

SELECT DISTINCT
	--C.No as CustomerNo
	--,
	--Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END AS [Cust Code]
	--, Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.Name ELSE C.CustomerGroup END AS [Cust Name]
	--, C.Name 
	C.[Cust Code]
	,C.[Cust Name]
	, C.CompanyCode
	--, CASE C.CurrencyCode WHEN '' THEN GLS.LCYCode ELSE C.CurrencyCode END as CustCurrencyCode
	, C.Currency as CustCurrencyCode

	--, C.CountryRegionCode as Country

	--,  CASE ISNULL(C.CustomerGroup,'') WHEN '' THEN  
	--									CASE C.CurrencyCode WHEN '' THEN GLS.LCYCode ELSE C.CurrencyCode END
	--							 ELSE CG.Currency 
	--	END  AS CustCurrencyCode 

	--, C.CountryRegionCode as Country
	,C.CountryCode  as Country
	--,  Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.CountryRegionCode ELSE CG.Country END AS Country
	
	, SIL.ShortcutDimension1Code as BrandCode
	, GLS.LCYCode as CompanyCurrencyCode 
	, CONCAT( C.CompanyCode ,C.[Cust Code] ) AS CCCustKey
	--, CONCAT(SIH.CompanyCode, SIH.SelltoCustomerNo , SIL.ShortcutDimension1Code) as CCCustNoDimKey
	 ,CONCAT(SIH.CompanyCode, C.[Cust Code]
		--Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END 
		, SIL.ShortcutDimension1Code) as CCCustChainDimKey
FROM 
	dbo.SalesHeader SIH  WITH(NOLOCK)
	INNER JOIN dbo.SalesLine SIL WITH(NOLOCK) ON SIL.DocumentNo = SIH.No AND SIL.CompanyCode = SIH.CompanyCode
		INNER JOIN [Master Customer List] C ON SIL.CompanyCode = C.CompanyCode AND 
		C.[Cust Code] =  SIL.SelltoCustomerNo 
	--INNER JOIN dbo.Customer C WITH(NOLOCK) ON SIL.SelltoCustomerNo = C.[No]  AND C.CompanyCode = SIL.CompanyCode
	INNER JOIN dbo.GLSetup GLS WITH(NOLOCK) ON  GLS.CompanyCode = C.CompanyCode
	--LEFT JOIN dbo.CustomerGroup CG WITH(NOLOCK) ON C.CompanyCode = CG.CompanyCode AND C.CustomerGroup = CG.GroupCode

WHERE Type <> ''  AND SIL.ShipmentDate >= '2000-01-01'  

UNION
	SELECT DISTINCT
		 --MC.[BC Cust Code] AS CustomerNo
		--, 
		MC.[Cust Code]
		, MC.[Cust Name]
		--, MC.Customer AS [Name] 
		, MC.CompanyCode
		--, CASE C.CurrencyCode WHEN '' THEN GLS.LCYCode ELSE C.CurrencyCode END as CustCurrencyCode
		, MC.Currency as CustCurrencyCode
		--, C.CountryRegionCode as Country
		, MC.CountryCode as Country
		, BL.[Brand Code] as BrandCode
		--, CASE  MC.BrandDim as BrandCode
		, GLS.LCYCode as CompanyCurrencyCode 
		, MC.CCCustKey AS CCCustKey
		--, CONCAT(c.CompanyCode, C.No , BL.[Brand Code]) as CCCustNoDimKey
		,CONCAT(MC.CCCustKey,[Brand Code]) as CCCustChainDimKey
	
	FROM 
		 dbo.[Master Customer List] MC WITH(NOLOCK) 
		LEFT JOIN dbo.Customer C WITH(NOLOCK) ON MC.CompanyCode = C.CompanyCode AND MC.[Cust Code] = C.No
		INNER JOIN dbo.GLSetup GLS WITH(NOLOCK) ON  GLS.CompanyCode = MC.CompanyCode
		CROSS JOIN dbo.[Brand List] BL WITH(NOLOCK) 
	WHERE 
		CONCAT( C.CompanyCode ,MC.[Cust Code] )  NOT IN 
		 (SELECT  DISTINCT CONCAT( CompanyCode ,SelltoCustomerNo )  FROM SalesHeader
		 UNION
		 SELECT  DISTINCT CONCAT( CompanyCode ,SelltoCustomerNo )  FROM SalesInvoiceHeader
		 ) 
	) as a

GO
