/****** Object:  View [dbo].[GL Entry Margin Analysis]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











CREATE VIEW [dbo].[GL Entry Margin Analysis]
as
SELECT DISTINCT
	  
	  GLE.[CompanyCode]
	  ,GLE.EntryNo
	  ,GLA.[No] as [GLAccountNo]
	  ,GLA.Name as [GLAccountName]
      ,GLE.CreditAmount
	  ,GLE.DebitAmount
	  ,GLE.Amount *-1  as Amount
	  ,CER.ExchangeRateAmount as ExchangeRate
	  , Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END as [Cust Code]
	  ,GLE.GlobalDimension1Code
	  ,GLE.GlobalDimension2Code
	  ,GLE.SourceNo
	  ,GLE.SourceType
	  ,GLE.SourceCode
	  ,GLA.DirectPosting
	  ,GLS.LCYCode as CompanyCurrencyCode 
	  ,CASE GLS.LCYCode WHEN 'GBP' THEN 'USD' 
					 WHEN 'USD' THEN 'GBP'
		END As AlternateCurrency
	  ,GLE.PostingDate
	  , datepart(mm, GLE.PostingDate) as [Month No]
	  , MONTH(GLE.PostingDate) as [Month]
	  , YEAR(GLE.PostingDate) as [Year]
	  , CONCAT(datepart(mm, GLE.PostingDate),YEAR(GLE.PostingDate)) AS [MMYYYY]
      ,GLE.[Description]
      ,GLE.[DimensionSetID]
	, CONCAT(GLE.CompanyCode,GLE.SourceNo, GLE.DimensionSetID) as CCDimSetIDKey
	, CONCAT(GLE.CompanyCode,DocumentNo, '') as CCDocItemNoKey
	, CONCAT(GLE.CompanyCode , Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END  )as CCCustNoKey
	, CONCAT(GLE.CompanyCode,GLE.DocumentNo) as CCDocKey
	, CONCAT(GLE.CompanyCode, Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END ,
		GLE.GlobalDimension1Code, CONCAT(datepart(mm, GLE.PostingDate),YEAR(GLE.PostingDate))) As CCCustNoDimDateKey
	, CONCAT(GLE.CompanyCode, Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END ,GLE.GlobalDimension1Code) as CCCustNoDimKey
	, CONCAT(GLE.CompanyCode,GLE.DimensionSetID, CASE GLE.DocumentType WHEN 'INVOICE' THEN 'Posted Invoice' ELSE 'Posted Credit'  END , GLE.DocumentNo) as CCDimsetKey

  FROM [dbo].[GLEntry] GLE WITH(NOLOCK) 
	
	INNER JOIN dbo.Customer C WITH(NOLOCK) ON GLE.SourceNo = C.[No]  AND C.CompanyCode = GLE.CompanyCode
	INNER JOIN dbo.GLSetup GLS WITH(NOLOCK) ON  GLS.CompanyCode = C.CompanyCode
	LEFT  JOIN dbo.CurrencyExchangeRate CER WITH(NOLOCK) ON /*GLS.LCYCode = CER.CurrencyCode AND*/ C.CompanyCode = CER.CompanyCode
			AND MONTH (CER.StartingDate) = MONTH(GLE.PostingDate) AND YEAR(CER.StartingDate) = YEAR(GLE.PostingDate)
    INNER JOIN dbo.GLAccount GLA WITH(NOLOCK) ON GLE.CompanyCode = GLA.CompanyCode AND GLA.[No] = GLE.GLAccountNo
	INNER JOIN dbo.DefaultDimension DD WITH(NOLOCK) ON GLE.SourceNo = DD.[No]  AND DD.CompanyCode = GLE.CompanyCode
    
  WHERE 
	 (GLA.No IN ('10110','20280') 
		OR GLA.No BETWEEN '10220' and '10250'
		OR GLA.No BETWEEN '20110' AND'20140' 
		OR GLA.No BETWEEN '20260' and '20270'
		OR GLA.No BETWEEN '20235' and '20238'
		)
	AND  PostingDate >= '20200101' AND (CER.CurrencyCode ='USD' OR CER.CurrencyCode ='GBP')
GO
