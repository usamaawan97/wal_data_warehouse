/****** Object:  View [dbo].[GL Budget Entries]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [dbo].[GL Budget Entries]
as
SELECT DISTINCT
	   --GLBE.[EntryNo]
    --  ,
	  GLBE.[CompanyCode]

      ,GLBE.[Amount]
	  , ISNULL(GLBER.BudgetExchageRateUSD,1) as ExchangeRate
	  , GLS.LCYCode as CompanyCurrencyCode 
	  --, CASE WHEN C.CurrencyCode = '' THEN GLS.LCYCode ELSE C.CurrencyCode  end As CustomerCurrCode
	  

	  ,  CASE GLS.LCYCode WHEN 'GBP' THEN 'USD' 
					 WHEN 'USD' THEN 'GBP'
		END As AlternateCurrency
	
		,  Case ISNULL(C.ChainName,'') WHEN '' THEN C.CountryRegionCode ELSE CG.Country END AS CountryCode
		,  CASE ISNULL(C.ChainName,'') WHEN '' THEN  
											CASE C.CurrencyCode WHEN '' THEN GLS.LCYCode ELSE C.CurrencyCode END
									   ELSE CG.Currency END  AS Currency 

		--CASE GLS.LCYCode WHEN 'GBP' THEN dbo.GetExchangeRate(GLBE.CompanyCode,GLBE.[Date],'USD') 
		--			 WHEN 'USD' THEN dbo.GetExchangeRate(GLBE.CompanyCode,GLBE.[Date],'GBP') 
		--END As AlternateExRate,
	  

		, GLBER.BudgetExchageRateUSD as AlternateExRate,

		CASE WHEN GLS.LCYCode <> C.CurrencyCode  
			THEN 
			     CASE WHEN GLBER.BudgetExchageRateUSD <> 0 THEN ROUND(GLBE.Amount / ISNULL(GLBER.BudgetExchageRateUSD,1),2)  ELSE GLBE.Amount END 
			ELSE GLBE.Amount 
		END as AmountBCY
     , GLBE.[BudgetDimension1Code]
      ,GLBE.[BudgetDimension2Code]
      ,GLBE.[BudgetDimension3Code]
      ,GLBE.[BudgetDimension4Code]
	  , GLBE.BudgetName
      ,[BusinessUnitCode]
      ,[Date]
	  , datepart(mm, GLBE.[Date]) as [Month No]
	  , MONTH(GLBE.[Date]) as [Month]
	  , YEAR(GLBE.[Date]) as [Year]
	  , CONCAT(datepart(mm, GLBE.[Date]),YEAR(GLBE.[Date])) AS [MMYYYY]
      ,GLBE.[Description]
      ,[DimensionSetID]
      ,[GLAccountNo]
	  --, C.No
	  , Case ISNULL(C.ChainName,'') WHEN '' THEN C.No ELSE ChainName END AS [Cust Code]
	  , Case ISNULL(C.ChainName,'') WHEN '' THEN C.Name ELSE C.ChainName END AS [Cust Name]
	  --, C.Name
      ,GLBE.[GlobalDimension1Code]
      ,GLBE.[GlobalDimension2Code]
	  ,CONCAT(GLBE.CompanyCode, GLBE.BudgetName) as CCBudgetKey
      ,CONCAT(GLBE.CompanyCode, Case ISNULL(C.ChainName,'') WHEN '' THEN C.No ELSE ChainName END) as CCCustNoKey
      ,CONCAT(GLBE.CompanyCode, Case ISNULL(C.ChainName,'') WHEN '' THEN C.No ELSE ChainName END, GLBE.GlobalDimension1Code, CONCAT(datepart(mm, GLBE.[Date]),YEAR(GLBE.[Date]))) as CCCustNoDimDateKey
	  ,CONCAT(GLBE.CompanyCode, Case ISNULL(C.ChainName,'') WHEN '' THEN C.No ELSE ChainName END, GLBE.GlobalDimension1Code) as CCCustChainDimKey
  FROM [dbo].[GLBudgetEntry] GLBE WITH(NOLOCK) 
	INNER JOIN dbo.GLSetup GLS ON  GLS.CompanyCode = GLBE.CompanyCode
	INNER JOIN dbo.[Customer Dimensions] CD ON CD.CompanyCode = GLBE.CompanyCode AND CD.DimensionValueCode = GLBE.BudgetDimension2Code AND CD.DimensionCode = 'CUSTOMER' 
	INNER JOIN dbo.[Customer] C ON C.No = CD.[Cust Code] and C.CompanyCode = GLBE.CompanyCode
	INNER JOIN dbo.[GLBudgetName] GLBN ON GLBE.CompanyCode = GLBN.CompanyCode and GLBE.BudgetName = GLBN.Name 
	LEFT JOIN dbo.CustomerGroup CG WITH(NOLOCK) ON C.CompanyCode = CG.CompanyCode AND C.ChainName = CG.GroupCode
    --LEFT  JOIN dbo.CurrencyExchangeRate CER ON C.CurrencyCode = CER.CurrencyCode AND GLBE.CompanyCode = CER.CompanyCode
	LEFT JOIN dbo.GLBudgetExchangeRate GLBER ON GLBE.CompanyCode = GLBER.CompanyCode AND GLBE.BudgetName = GLBER.GLBudgetName
	AND  GLBER.[Month] = MONTH(GLBE.Date) AND GLBER.[Year] = YEAR(GLBE.[Date])
  WHERE 
	  GLBN.Include_in_Reports = 1 AND
	  --BudgetName IN( 'SALES 9+3' )  and 
	  GLBE.GLAccountNo = 10110 AND 
	  [Date] >= '20200101'
GO
