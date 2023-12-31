/****** Object:  View [dbo].[Customer Expected Orders]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[Customer Expected Orders]
AS

SELECT  DISTINCT
	CEO.Customer_No
	, Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END AS [Cust Code]
	, CEO.CompanyCode, CEO.[Name]
	, CEO.Expected_Order_Amt
	, CEO.Risk_Amount
	, CEO.Created_Date
	, CEO.Modified_Date 
	, CEO.Shortcut_Dimension_1_Code
	, CONCAT(CEO.CompanyCode, CEO.Customer_No , CEO.Shortcut_Dimension_1_Code) as CCCustNoDimKey
	, CONCAT(CEO.CompanyCode, CEO.Customer_No ) as CCCustNoKey
	, GLS.LCYCode as CompanyCurrencyCode
	, CASE WHEN C.CurrencyCode = '' THEN GLS.LCYCode ELSE C.CurrencyCode  end As CustomerCurrency
	, ISNULL(CER.ExchangeRateAmount,1) as ExchangeRate
	, CASE GLS.LCYCode WHEN 'GBP' THEN 'USD' WHEN 'USD' THEN 'GBP'	END As AlternateCurrency
	, CASE GLS.LCYCode WHEN 'GBP' THEN dbo.GetExchangeRate(CEO.CompanyCode,GETDATE(),'USD') WHEN 'USD' THEN dbo.GetExchangeRate(CEO.CompanyCode,GETDATE(),'GBP') END As AlternateExRate
	 ,CONCAT(CEO.CompanyCode, Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END , CEO.Shortcut_Dimension_1_Code) as CCCustChainDimKey
FROM dbo.CustomerExpectedOrder CEO
	INNER JOIN dbo.Customer C WITH(NOLOCK) ON CEO.Customer_No = C.[No]  AND C.CompanyCode = CEO.CompanyCode
	INNER JOIN dbo.GLSetup GLS WITH(NOLOCK) ON  GLS.CompanyCode = CEO.CompanyCode
LEFT  JOIN dbo.CurrencyExchangeRate CER WITH(NOLOCK) ON C.CurrencyCode = CER.CurrencyCode
	AND CEO.CompanyCode = CER.CompanyCode
	AND MONTH (CER.StartingDate) = MONTH(GETDATE()) AND YEAR(CER.StartingDate) = YEAR(GETDATE())



GO
