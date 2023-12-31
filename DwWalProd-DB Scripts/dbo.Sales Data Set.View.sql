/****** Object:  View [dbo].[Sales Data Set]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[Sales Data Set]
AS

SELECT DISTINCT
	  Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END AS [Cust Code]
	, Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.Name ELSE C.CustomerGroup END AS [Cust Name]
	, SIH.No as DocumentNo
	, 'Posted Invoice' as DocumentType
	, SIL.[LineNo]
	, SIH.PostingDate
	
	--SIH.SelltoCustomerNo, 
	--SIH.SelltoCustomerName,
	--SIH.SelltoAddress, SIH.SelltoAddress2, SIH.SelltoCity,
	--SIH.SelltoCounty, SIH.SelltoPostCode ,SIH.SelltoCountryRegionCode, SIH.ShiptoName, SIH.ShiptoAddress, SIH.ShiptoAddress2, SIH.ShiptoCity, SIH.ShiptoCounty,
	--SIH.ShiptoCountryRegionCode, SIH.ShiptoPostCode, 
	, [Type]
	, SIL.[No]
	, [Description]
	, SIL.LocationCode
	, SIL.ShortcutDimension1Code as BrandCode 
	, SIL.ShortcutDimension2Code AS GeographyCode 
	, case SIH.ShiptoCountryRegionCode  WHEN 'US' THEN 'US'  WHEN 'CA' THEN 'US' WHEN 'CANADA' THEN 'US'  WHEN '' THEN 
			CASE SIH.SelltoCountryRegionCode WHEN 'US' THEN 'US' WHEN 'CA' THEN 'US' WHEN '' THEN SIL.ShortcutDimension2Code ELSE SIH.SelltoCountryRegionCode  END
			ELSE 'UK' end as HeadOfSales 
	, case SIH.ShiptoCountryRegionCode 
		WHEN 'US' THEN 'US' 
		WHEN 'AU' THEN 'AU'
		WHEN 'GB' THEN 'UK'
		WHEN 'CA' THEN 'CA'
		WHEN 'CH' THEN 'ROW'
		WHEN 'MX' THEN 'ROW'
		WHEN 'NO' THEN 'ROW'
		WHEN 'NZ' THEN 'ROW'
		WHEN 'PH' THEN 'ROW'
		WHEN 'UA' THEN 'ROW'
		WHEN 'HK' THEN 'ROW'
		WHEN '' THEN 'UK'
		ELSE
			'EU'
	End as Country,
	
	0 as [O/S Qty]
	, SIL.ResponsibilityCenter AS ResponsibilityCenter
	, Quantity
	, UnitCost
	, UnitCostLCY
	, UnitofMeasureCode
	, GLS.LCYCode as CompanyCurrencyCode
	, CASE WHEN SIH.CurrencyCode = '' THEN GLS.LCYCode ELSE SIH.CurrencyCode  end As DocCurrencyCode
	, ISNULL(CER.ExchangeRateAmount,1) as ExchangeRate
	, CASE GLS.LCYCode WHEN 'GBP' THEN 'USD' WHEN 'USD' THEN 'GBP' END As AlternateCurrency
	, CASE GLS.LCYCode WHEN 'GBP' THEN dbo.GetExchangeRate(SIH.CompanyCode,SIH.ShipmentDate,'USD') WHEN 'USD' THEN dbo.GetExchangeRate(SIH.CompanyCode,SIH.ShipmentDate,'GBP') END As AlternateExRate
	, UnitPrice 
	, LineAmount AS LineAmtExTax,
	CASE WHEN GLS.LCYCode <> SIH.CurrencyCode THEN ROUND(LineAmount / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE LineAmount END as LineAmtExTaxBCY,
	SIL.AmountIncludingVAT as LineAmtIncTax ,
	CASE WHEN GLS.LCYCode <> SIH.CurrencyCode THEN ROUND(SIL.AmountIncludingVAT / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE LineAmount END as LineAmtIncTaxBCY,
	SIL.VATBaseAmount as TaxBaseAmount,
	CASE WHEN GLS.LCYCode <> SIH.CurrencyCode THEN ROUND(SIL.VATBaseAmount / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE LineAmount END as TaxBaseAmountBCY,
	SIL.Amount,
	CASE WHEN GLS.LCYCode <> SIH.CurrencyCode THEN ROUND(SIL.Amount / ISNULL(CER.ExchangeRateAmount,1) ,2) ELSE LineAmount END as AmountBCY,
	SIL.LineDiscountAmount,
	CASE WHEN GLS.LCYCode <> SIH.CurrencyCode THEN ROUND(SIL.LineDiscountAmount / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE LineAmount END as LineDiscountAmountBCY,
	SIL.ShipmentDate, 
	DATEADD(day,-1,CAST(SIL.ShipmentDate AS date )) AS AdjustedShipDate ,
    datepart(mm, SIL.ShipmentDate) as [Shipment Month No],
	MONTH (SIL.ShipmentDate ) AS [Shipment Month],
	YEAR(SIL.ShipmentDate) AS [Shipment Year],
	concat(datepart(mm, SIL.ShipmentDate),year(SIL.ShipmentDate)) as ShipmentMMYYYY,
	C.[Name] AS [Customer Name] ,
	SIL.DimensionSetID,
	0 as OutstandingQuantity,
	SIH.CurrencyCode,

	SIL.AmountIncludingVAT,
	SIL.VATBaseAmount,
	SIL.CompanyCode, 

	0  as ExpectedOrderAmt,
	0 as RiskOrderAmt,
	0 as Expected_Order_Amt,
	0 as Risk_Amount

	, CONCAT(SIL.CompanyCode , SIL.DimensionSetID)  as CCDimSetIDKey
	, CONCAT(SIH.CompanyCode , SIH.No , SIL.No ) as CCDocItemNoKey
	--, CONCAT(SIH.CompanyCode , SIH.SelltoCustomerNo )as CCCustNoKey
	, CONCAT(SIH.CompanyCode , Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END  )as CCCustNoKey
	, CONCAT(SIH.CompanyCode, SIL.DimensionSetID, SIL.DocumentNo , SIL.[LineNo] ) as CCDocKey
    --, CONCAT(SIH.CompanyCode, SIH.SelltoCustomerNo , SIL.ShortcutDimension1Code,CONCAT(datepart(mm, SIL.ShipmentDate),YEAR(SIL.ShipmentDate))) as CCCustNoDimDateKey
	, CONCAT(SIH.CompanyCode, Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END   , 
		SIL.ShortcutDimension1Code,CONCAT(datepart(mm, SIL.ShipmentDate),YEAR(SIL.ShipmentDate))) as CCCustNoDimDateKey
	--, CONCAT(SIH.CompanyCode, SIH.SelltoCustomerNo , CONCAT(datepart(mm, SIL.ShipmentDate),YEAR(SIL.ShipmentDate))) as CCCustNoDateKey
	, CONCAT(SIH.CompanyCode, Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END  , CONCAT(datepart(mm, SIL.ShipmentDate),YEAR(SIL.ShipmentDate))) as CCCustNoDateKey
    --, CONCAT(SIH.CompanyCode, SIH.SelltoCustomerNo , SIL.ShortcutDimension1Code) as CCCustNoDimKey
	, CONCAT(SIH.CompanyCode, Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END   , SIL.ShortcutDimension1Code) as CCCustNoDimKey
    , CONCAT(SIH.CompanyCode, SIL.DimensionSetID,'Posted Invoice',SIL.DocumentNo , SIL.[LineNo]) as CCDimSetKey
	, 0 as 'Direct Entry'
   --Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END  
FROM 
dbo.SalesInvoiceHeader	SIH WITH(NOLOCK)
INNER JOIN dbo.SalesInvoiceLine SIL WITH(NOLOCK) ON SIL.DocumentNo = SIH.No
AND SIL.CompanyCode = SIH.CompanyCode
INNER JOIN dbo.Customer C WITH(NOLOCK) ON SIL.SelltoCustomerNo = C.[No]  AND C.CompanyCode = SIL.CompanyCode
INNER JOIN dbo.GLSetup GLS WITH(NOLOCK) ON  GLS.CompanyCode = C.CompanyCode
LEFT  JOIN dbo.CurrencyExchangeRate CER WITH(NOLOCK) ON SIH.CurrencyCode = CER.CurrencyCode AND SIH.CompanyCode = CER.CompanyCode
	AND MONTH (CER.StartingDate) = MONTH(SIL.ShipmentDate) AND YEAR(CER.StartingDate) = YEAR(SIL.ShipmentDate)

WHERE Type <> ''  AND SIL.ShipmentDate >= '2000-01-01' 
UNION 
SELECT   
	Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END AS [Cust Code],
	Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.Name ELSE C.CustomerGroup END AS [Cust Name],
	 SCMH.No as DocumentNo,  'Posted Credit' as DocumentType,SCL.[LineNo], SCMH.PostingDate,
	-- SCMH.SelltoCustomerNo, SCMH.SelltoCustomerName,SCMH.SelltoAddress, SCMH.SelltoAddress2, SCMH.SelltoCity,
	--SCMH.SelltoCounty, SCMH.SelltoPostCode ,SCMH.SelltoCountryRegionCode, SCMH.ShiptoName, SCMH.ShiptoAddress, SCMH.ShiptoAddress2, SCMH.ShiptoCity, SCMH.ShiptoCounty,
	--SCMH.ShiptoCountryRegionCode, SCMH.ShiptoPostCode, 
	[Type], SCL.[No], [Description], SCL.LocationCode, SCL.ShortcutDimension1Code as BrandCode , 
	SCL.ShortcutDimension2Code AS GeographyCode ,
	case SCMH.ShiptoCountryRegionCode 
		WHEN 'US' THEN 'US'  WHEN 'CA' THEN 'US' WHEN 'CANADA' THEN 'US'
		WHEN '' THEN CASE SCMH.SelltoCountryRegionCode WHEN 'US' THEN 'US' WHEN 'CA' THEN 'US' WHEN '' THEN SCL.ShortcutDimension2Code ELSE SCMH.SelltoCountryRegionCode END
	ELSE 'UK' end as  HeadOfSales ,
	
	case SCMH.ShiptoCountryRegionCode 
		WHEN 'US' THEN 'US' 
		WHEN 'AU' THEN 'AU'
		WHEN 'GB' THEN 'UK'
		WHEN 'CA' THEN 'CA'
		WHEN 'CH' THEN 'ROW'
		WHEN 'MX' THEN 'ROW'
		WHEN 'NO' THEN 'ROW'
		WHEN 'NZ' THEN 'ROW'
		WHEN 'PH' THEN 'ROW'
		WHEN 'UA' THEN 'ROW'
		WHEN 'HK' THEN 'ROW'
		WHEN '' THEN 'UK'
		ELSE
			'EU'
	End as Country,
	0 as [O/S Qty],
	SCL.ResponsibilityCenter AS ResponsibilityCenter, Quantity, UnitCost, UnitCostLCY, UnitofMeasureCode,
	GLS.LCYCode as CompanyCurrencyCode, 
	CASE WHEN SCMH.CurrencyCode = '' THEN GLS.LCYCode ELSE SCMH.CurrencyCode  end As DocCurrencyCode,
	ISNULL(CER.ExchangeRateAmount,1) as ExchangeRate,
	
	CASE GLS.LCYCode WHEN 'GBP' THEN 'USD' 
					 WHEN 'USD' THEN 'GBP'
	END As AlternateCurrency,

	CASE GLS.LCYCode WHEN 'GBP' THEN dbo.GetExchangeRate(SCMH.CompanyCode,SCMH.ShipmentDate,'USD') 
					 WHEN 'USD' THEN dbo.GetExchangeRate(SCMH.CompanyCode,SCMH.ShipmentDate,'GBP') 
	END As AlternateExRate,

	--dbo.GetExchangeRate(SIH.CompanyCode,SIH.ShipmentDate,'GBP') As GBPExRate,
	--dbo.GetExchangeRate(SIH.CompanyCode,SIH.ShipmentDate,'AUD') As AUDExRate,
	--dbo.GetExchangeRate(SIH.CompanyCode,SIH.ShipmentDate,'EUR') As EURExRate,
	--dbo.GetExchangeRate(SIH.CompanyCode,SIH.ShipmentDate,'CAD') As CADExRate,
	UnitPrice , 
	LineAmount AS LineAmtExTax,
	CASE WHEN GLS.LCYCode <> SCMH.CurrencyCode THEN ROUND(LineAmount / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE LineAmount END as LineAmtExTaxBCY,
	
	SCL.AmountIncludingVAT as LineAmtIncTax ,
	CASE WHEN GLS.LCYCode <> SCMH.CurrencyCode THEN ROUND(SCL.AmountIncludingVAT / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE LineAmount END as LineAmtIncTaxBCY,
	SCL.VATBaseAmount as TaxBaseAmount,
	CASE WHEN GLS.LCYCode <> SCMH.CurrencyCode THEN ROUND(SCL.VATBaseAmount / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE LineAmount END as TaxBaseAmountBCY,
	SCL.Amount,
	CASE WHEN GLS.LCYCode <> SCMH.CurrencyCode THEN ROUND(SCL.Amount / ISNULL(CER.ExchangeRateAmount,1) ,2) ELSE LineAmount END as AmountBCY,
	SCL.LineDiscountAmount,
	CASE WHEN GLS.LCYCode <> SCMH.CurrencyCode THEN ROUND(SCL.LineDiscountAmount / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE LineAmount END as LineDiscountAmountBCY,
	SCL.ShipmentDate, 
	DATEADD(day,-1,CAST(SCL.ShipmentDate AS date )) AS AdjustedShipDate ,
	datepart(mm, SCL.ShipmentDate) as [Shipment Month No],
	MONTH(SCL.ShipmentDate) AS [Shipment Month],
	YEAR (SCL.ShipmentDate) AS [Shipment Year],
	concat(datepart(mm, SCL.ShipmentDate),year(SCL.ShipmentDate)) as ShipmentMMYYYY,
	C.SearchName AS [Customer Name] ,
	SCL.DimensionSetID
	,0 as OutstandingQuantity,
	SCMH.CurrencyCode,

	SCL.AmountIncludingVAT,
	SCL.VATBaseAmount,
	SCL.CompanyCode, 

	0  as ExpectedOrderAmt,
	0 as RiskOrderAmt,
	0 as Expected_Order_Amt,
	0 as Risk_Amount

	, CONCAT(SCL.CompanyCode , SCL.DimensionSetID) as CCDimSetIDKey
	, CONCAT(SCMH.CompanyCode , SCMH.No ,SCL.No ) as CCDocItemNoKey
	--, CONCAT(SCMH.CompanyCode , SCMH.SelltoCustomerNo ) as CCCustNoKey
	, CONCAT(SCMH.CompanyCode ,Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END ) as CCCustNoKey
	, CONCAT(SCMH.CompanyCode ,SCL.DimensionSetID , SCL.DocumentNo,  SCL.[LineNo] ) as CCDocKey
	--, CONCAT(SCMH.CompanyCode, SCMH.SelltoCustomerNo,SCL.ShortcutDimension1Code ,CONCAT(datepart(mm, SCL.ShipmentDate),YEAR(SCL.ShipmentDate))) as CCCustNoDimDateKey
	, CONCAT(SCMH.CompanyCode, Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END,SCL.ShortcutDimension1Code ,CONCAT(datepart(mm, SCL.ShipmentDate),YEAR(SCL.ShipmentDate))) as CCCustNoDimDateKey
    --, CONCAT(SCMH.CompanyCode, SCMH.SelltoCustomerNo , CONCAT(datepart(mm, SCL.ShipmentDate),YEAR(SCL.ShipmentDate))) as CCCustNoDateKey
	, CONCAT(SCMH.CompanyCode, Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END, CONCAT(datepart(mm, SCL.ShipmentDate),YEAR(SCL.ShipmentDate))) as CCCustNoDateKey
 	--, CONCAT(SCMH.CompanyCode, SCMH.SelltoCustomerNo , SCL.ShortcutDimension1Code) as CCCustNoDimKey
	, CONCAT(SCMH.CompanyCode, Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END , SCL.ShortcutDimension1Code) as CCCustNoDimKey
	, CONCAT(SCMH.CompanyCode, SCL.DimensionSetID,'Posted Credit',SCL.DocumentNo , SCL.[LineNo]) as CCDimSetKey

	, 0 as 'Direct Entry'
FROM 
dbo.SalesCrMemoHeader	SCMH WITH(NOLOCK)
INNER JOIN dbo.SalesCrMemoLine SCL WITH(NOLOCK) ON SCL.DocumentNo = SCMH.No
AND SCL.CompanyCode = SCMH.CompanyCode
INNER JOIN dbo.Customer C WITH(NOLOCK) ON SCL.SelltoCustomerNo = C.[No]  AND C.CompanyCode = SCL.CompanyCode
INNER JOIN dbo.GLSetup GLS WITH(NOLOCK) ON  GLS.CompanyCode = C.CompanyCode
LEFT  JOIN dbo.CurrencyExchangeRate CER WITH(NOLOCK) ON SCMH.CurrencyCode = CER.CurrencyCode AND SCMH.CompanyCode = CER.CompanyCode
	AND MONTH (CER.StartingDate) = MONTH(SCL.ShipmentDate) AND YEAR(CER.StartingDate) = YEAR(SCL.ShipmentDate)

WHERE Type <> ''  AND SCL.ShipmentDate >= '2000-01-01' 


UNION


SELECT  
	Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END AS [Cust Code],
	Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.Name ELSE C.CustomerGroup END AS [Cust Name],
	 SIH.No as DocumentNo, SIH.DocumentType, SIL.[LineNo], SIH.PostingDate,
	-- SIH.SelltoCustomerNo, SIH.SelltoCustomerName,SIH.SelltoAddress, SIH.SelltoAddress2, SIH.SelltoCity,
	--SIH.SelltoCounty, SIH.SelltoPostCode ,SIH.SelltoCountryRegionCode, SIH.ShiptoName, SIH.ShiptoAddress, SIH.ShiptoAddress2, SIH.ShiptoCity, SIH.ShiptoCounty,
	--SIH.ShiptoCountryRegionCode,  SIH.ShiptoPostCode, 
	[Type], SIL.[No], [Description], SIL.LocationCode, SIL.ShortcutDimension1Code as BrandCode , 
	SIL.ShortcutDimension2Code AS GeographyCode ,
	case SIH.ShiptoCountryRegionCode 
		WHEN 'US' THEN 'US'  WHEN 'CA' THEN 'US' WHEN 'CANADA' THEN 'US'
		WHEN '' THEN 
			CASE SIH.SelltoCountryRegionCode WHEN 'US' THEN 'US' WHEN 'CA' THEN 'US' WHEN '' THEN SIL.ShortcutDimension2Code ELSE SIH.SelltoCountryRegionCode  END
	ELSE 'UK' end as HeadOfSales ,

		case SIH.ShiptoCountryRegionCode 
		WHEN 'US' THEN 'US' 
		WHEN 'AU' THEN 'AU'
		WHEN 'GB' THEN 'UK'
		WHEN 'CA' THEN 'CA'
		WHEN 'CH' THEN 'ROW'
		WHEN 'MX' THEN 'ROW'
		WHEN 'NO' THEN 'ROW'
		WHEN 'NZ' THEN 'ROW'
		WHEN 'PH' THEN 'ROW'
		WHEN 'UA' THEN 'ROW'
		WHEN 'HK' THEN 'ROW'
		WHEN '' THEN 'UK'
		ELSE
			'EU'
	End as Country,

	(SIL.OutstandingQuantity - SIL.Quantity) AS [O/S Qty],
	SIL.ResponsibilityCenter AS ResponsibilityCenter, Quantity,SIL.UnitCost, SIL.UnitCostLCY,   UnitofMeasureCode,
	GLS.LCYCode as CompanyCurrencyCode, 
	 CASE WHEN SIH.CurrencyCode = '' THEN GLS.LCYCode ELSE SIH.CurrencyCode  end As DocCurrencyCode,
	 	ISNULL(CER.ExchangeRateAmount,1) as ExchangeRate,

	CASE GLS.LCYCode WHEN 'GBP' THEN 'USD' 
					 WHEN 'USD' THEN 'GBP'
	END As AlternateCurrency,

	CASE GLS.LCYCode WHEN 'GBP' THEN dbo.GetExchangeRate(SIH.CompanyCode,SIH.ShipmentDate,'USD') 
					 WHEN 'USD' THEN dbo.GetExchangeRate(SIH.CompanyCode,SIH.ShipmentDate,'GBP') 
	END As AlternateExRate,
	SIL.UnitPrice,
	LineAmount AS LineAmtExTax,
	
	CASE WHEN GLS.LCYCode <> SIH.CurrencyCode THEN ROUND(LineAmount / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE LineAmount END as LineAmtExTaxBCY,
	
	SIL.AmountIncludingVAT as LineAmtIncTax ,
	CASE WHEN GLS.LCYCode <> SIH.CurrencyCode THEN ROUND(SIL.AmountIncludingVAT / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE LineAmount END as LineAmtIncTaxBCY,
	SIL.VATBaseAmount as TaxBaseAmount,
	CASE WHEN GLS.LCYCode <> SIH.CurrencyCode THEN ROUND(SIL.VATBaseAmount / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE LineAmount END as TaxBaseAmountBCY,
	SIL.Amount,
	CASE WHEN GLS.LCYCode <> SIH.CurrencyCode THEN ROUND(SIL.Amount / ISNULL(CER.ExchangeRateAmount,1) ,2) ELSE LineAmount END as AmountBCY,
	SIL.LineDiscountAmount,
	CASE WHEN GLS.LCYCode <> SIH.CurrencyCode THEN ROUND(SIL.LineDiscountAmount / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE LineAmount END as LineDiscountAmountBCY,


	SIL.ShipmentDate, 
	DATEADD(day,-1,CAST(SIL.ShipmentDate AS date )) AS AdjustedShipDate ,
    datepart(mm, SIL.ShipmentDate) as [Shipment Month No],
	MONTH (SIL.ShipmentDate) AS [Shipment Month],
	YEAR(SIL.ShipmentDate ) AS [Shipment Year],
	concat(datepart(mm, SIL.ShipmentDate),year(SIL.ShipmentDate)) as ShipmentMMYYYY,
	C.SearchName AS [Customer Name] ,
	SIL.DimensionSetID,
	SIL.OutstandingQuantity,
	SIL.CurrencyCode
	 ,	SIL.AmountIncludingVAT, SIL.VATBaseAmount,
	 SIL.CompanyCode, 


	SIL.LineAmount/NULLIF(MT.MonthTotalAmt,0) * 	CEO.Expected_Order_Amt  as ExpectedOrderAmt,
	SIL.LineAmount/NULLIF(MT.MonthTotalAmt,0) * 	CEO.Risk_Amount as RiskOrderAmt,
	CEO.Expected_Order_Amt,
	CEO.Risk_Amount
	
	, CONCAT(SIL.CompanyCode , SIL.DimensionSetID)  as CCDimSetIDKey
	, CONCAT(SIH.CompanyCode , SIH.No , SIL.No ) as CCDocItemNoKey
	--, CONCAT(SIH.CompanyCode , SIH.SelltoCustomerNo )as CCCustNoKey
	, CONCAT(SIH.CompanyCode , Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END )as CCCustNoKey
	, CONCAT(SIH.CompanyCode, SIL.DimensionSetID, SIL.DocumentNo , SIL.[LineNo] ) as CCDocKey
    --, CONCAT(SIH.CompanyCode, SIH.SelltoCustomerNo , SIL.ShortcutDimension1Code,CONCAT(datepart(mm, SIL.ShipmentDate),YEAR(SIL.ShipmentDate))) as CCCustNoDimDateKey
	, CONCAT(SIH.CompanyCode, Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END, SIL.ShortcutDimension1Code,CONCAT(datepart(mm, SIL.ShipmentDate),YEAR(SIL.ShipmentDate))) as CCCustNoDimDateKey
    --, CONCAT(SIH.CompanyCode, SIH.SelltoCustomerNo , CONCAT(datepart(mm, SIL.ShipmentDate),YEAR(SIL.ShipmentDate))) as CCCustNoDateKey
	, CONCAT(SIH.CompanyCode, Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END , CONCAT(datepart(mm, SIL.ShipmentDate),YEAR(SIL.ShipmentDate))) as CCCustNoDateKey
	--, CONCAT(SIH.CompanyCode, SIH.SelltoCustomerNo , SIL.ShortcutDimension1Code) as CCCustNoDimKey
	, CONCAT(SIH.CompanyCode, Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END , SIL.ShortcutDimension1Code) as CCCustNoDimKey
    , CONCAT(SIH.CompanyCode, SIL.DimensionSetID,SIH.DocumentType, SIL.DocumentNo , SIL.[LineNo]) as CCDimSetKey

	, 0 as 'Direct Entry'
FROM 
	dbo.SalesHeader	SIH  WITH(NOLOCK)
	INNER JOIN dbo.SalesLine SIL WITH(NOLOCK) ON SIL.DocumentNo = SIH.No
	AND SIL.CompanyCode = SIH.CompanyCode
	INNER JOIN dbo.Customer C WITH(NOLOCK) ON SIL.SelltoCustomerNo = C.[No]  AND C.CompanyCode = SIL.CompanyCode
	INNER JOIN dbo.GLSetup GLS WITH(NOLOCK) ON  GLS.CompanyCode = C.CompanyCode
	LEFT  JOIN dbo.CurrencyExchangeRate CER WITH(NOLOCK) ON SIH.CurrencyCode = CER.CurrencyCode AND SIH.CompanyCode = CER.CompanyCode
		AND MONTH (CER.StartingDate) = MONTH(SIL.ShipmentDate) AND YEAR(CER.StartingDate) = YEAR(SIL.ShipmentDate)
	INNER JOIN (	
		SELECT  
			CONCAT(SL.CompanyCode, SL.SelltoCustomerNo , SL.ShortcutDimension1Code) as  CCCustNoDimKey,
			datepart(mm, SL.ShipmentDate) as [Shipment Month No],
			YEAR(SL.ShipmentDate) as [Shipment Year],  
			sum(SL.LineAmount) As MonthTotalAmt
		FROM 
		dbo.[SalesLine] SL WITH(NOLOCK)
		group by CONCAT(SL.CompanyCode, SL.SelltoCustomerNo , SL.ShortcutDimension1Code),datepart(mm, SL.ShipmentDate) , YEAR(SL.ShipmentDate) 
		) AS MT
		ON MT.CCCustNoDimKey = CONCAT(SIH.CompanyCode, SIH.SelltoCustomerNo , SIL.ShortcutDimension1Code)
		AND MT.[Shipment Month No] = datepart(mm, SIL.ShipmentDate)  
		AND MT.[Shipment Year] = year(SIL.ShipmentDate) 
	LEFT JOIN dbo.[Customer Expected Orders] CEO WITH(NOLOCK) ON
		CEO.CCCustNoDimKey = CONCAT(SIH.CompanyCode, SIH.SelltoCustomerNo , SIL.ShortcutDimension1Code)

WHERE Type <> ''  AND SIL.ShipmentDate >= '2000-01-01'  
--AND SIH.DocumentType in ('Order','Return Order')

UNION 

select 
	--DocumentType, SourceNo, SourceType , SourceCode, DimensionSetID, DebitAmount , CreditAmount, GlobalDimension1Code, GlobalDimension2Code , DocumentNo, CompanyCode,*
	GLE.SourceNo as [Cust Code]
	, '' as [Cust Name]
	, GLE.DocumentNo 
	, CASE GLE.DocumentType WHEN 'INVOICE' THEN 'Posted Invoice' ELSE 'Posted Credit'  END AS DocumentType
	, 0 as [LineNo]
	, GLE.PostingDate
	, 'Direct' as [Type]
	, '' as [No]
	, GLE.[Description]
	, '' As LocationCode
	, GLE.GlobalDimension1Code as BrandCode
	, GLE.GlobalDimension2Code as GeographyCOde
	, CASE C.CountryRegionCode WHEN 'US' THEN 'US'  WHEN 'CA' THEN 'US' WHEN 'CANADA' THEN 'US' ELSE 'UK' end as HeadOfSales
	, case C.CountryRegionCode 
		WHEN 'US' THEN 'US' 
		WHEN 'AU' THEN 'AU'
		WHEN 'GB' THEN 'UK'
		WHEN 'CA' THEN 'CA'
		WHEN 'CH' THEN 'ROW'
		WHEN 'MX' THEN 'ROW'
		WHEN 'NO' THEN 'ROW'
		WHEN 'NZ' THEN 'ROW'
		WHEN 'PH' THEN 'ROW'
		WHEN 'UA' THEN 'ROW'
		WHEN 'HK' THEN 'ROW'
		WHEN '' THEN 'UK'
		ELSE 'EU'
	  End as Country  
	, 0 as [O/S Qty]
	, C.ResponsibilityCenter As ResponsibilityCenter
	, 1 as Quantity
	, 0 as UnitCost
	, 0 as UnitCostLCY
	, '' as UnitOfMeasure
	, GLS.LCYCode as CompanyCurrencyCode
	, GLs.LCYCode as DocCurrencyCode
	, ISNULL(CER.ExchangeRateAmount,1) as ExchangeRate
	, CASE GLS.LCYCode WHEN 'GBP' THEN 'USD' WHEN 'USD' THEN 'GBP' END As AlternateCurrency
	, CASE GLS.LCYCode WHEN 'GBP' THEN dbo.GetExchangeRate(C.CompanyCode,GLE.PostingDate,'USD') WHEN 'USD' THEN dbo.GetExchangeRate(C.CompanyCode,GLE.PostingDate,'GBP') END As AlternateExRate
	--, CASE WHEN GLS.LCYCode <> C.CurrencyCode THEN ROUND((GLE.Amount *-1) / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE GLE.Amount *-1 END as UnitPrice
	--, CASE WHEN GLS.LCYCode <> GLE.CurrencyCode THEN ROUND((GLE.Amount *-1) / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE GLE.Amount *-1 END as LineAmtExTax
	--, CASE WHEN GLS.LCYCode <> GLE.CurrencyCode THEN ROUND((GLE.Amount *-1) / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE GLE.Amount *-1 END as LineAmtExTaxBCY
	--, CASE WHEN GLS.LCYCode <> GLE.CurrencyCode THEN ROUND((GLE.Amount *-1) / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE GLE.Amount *-1 END as LineAmtIncTax
	--, CASE WHEN GLS.LCYCode <> GLE.CurrencyCode THEN ROUND((GLE.Amount *-1) / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE GLE.Amount *-1 END as LineAmtIncTaxBCY
	--, CASE WHEN GLS.LCYCode <> GLE.CurrencyCode THEN ROUND((GLE.Amount *-1) / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE GLE.Amount *-1 END as TaxBaseAmount
	--, CASE WHEN GLS.LCYCode <> GLE.CurrencyCode THEN ROUND((GLE.Amount *-1) / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE GLE.Amount *-1 END as TaxBaseAmountBCY
	--, CASE WHEN GLS.LCYCode <> GLE.CurrencyCode THEN ROUND((GLE.Amount *-1) / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE GLE.Amount *-1 END as Amount
	--, CASE WHEN GLS.LCYCode <> GLE.CurrencyCode THEN ROUND((GLE.Amount *-1) / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE GLE.Amount *-1 END as AmountBCY
	, GLE.Amount *-1 AS UnitPrice
	, GLE.Amount *-1 AS LineAmtExTax
	, GLE.Amount *-1 AS LineAmtExTaxBCY
	, GLE.Amount *-1 AS LineAmtIncTax
	, GLE.Amount *-1 AS LineAmtIncTaxBCY
	, GLE.Amount *-1 AS TaxBaseAmount
	, GLE.Amount *-1 AS TaxBaseAmountBCY
	, GLE.Amount *-1 AS Amount
	, GLE.Amount *-1 AS AmountBCY
	, 0 as LineDiscountAmount
	, 0 as LineDiscountAmountBCY
	, GLE.PostingDate as ShipmentDate
	, DATEADD(day,-1,CAST( GLE.PostingDate AS date )) AS AdjustedShipDate
	, datepart(mm, GLE.PostingDate) AS [Shipment Month No] 
	, Month( GLE.PostingDate) as [Shipment Month]
	, Year ( GLE.PostingDate) as [Shipment Year]
	, CONCAT(datepart(mm, GLE.PostingDate), Year ( GLE.PostingDate)) as ShipmentMMYYYY
	, C.[Name] as [Customer Name]
	, GLE.DimensionSetID
	, 0 as [OutstandingQuantity]
	, GLS.LCYCode as CurrencyCode
	, GLE.Amount *-1 AS AmountIncludingVAT
	, GLE.Amount *-1 AS VATBaseAmount
	, GLE.CompanyCode
	, 0 as ExpectedOrderAmt
	, 0 as RiskOrderAmt
	, 0 as Expected_Order_Amt
	, 0 as Risk_Amount
	, CONCAT(GLE.CompanyCode,GLE.SourceNo, GLE.DimensionSetID) as CCDimSetIDKey
	, CONCAT(GLE.CompanyCode,DocumentNo, '') as CCDocItemNoKey
	, CONCAT(GLE.CompanyCode , Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END  )as CCCustNoKey
	, CONCAT(GLE.CompanyCode,GLE.DocumentNo) as CCDocKey
	, CONCAT(GLE.CompanyCode, Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END ,
		GLE.GlobalDimension1Code, CONCAT(datepart(mm, GLE.PostingDate),YEAR(GLE.PostingDate))) As CCCustNoDimDateKey
	, CONCAT(GLE.CompanyCode, Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END ) as CCCustNoDateKey
	, CONCAT(GLE.CompanyCode, Case ISNULL(C.CustomerGroup,'') WHEN '' THEN C.No ELSE CustomerGroup END ,GLE.GlobalDimension1Code) as CCCustNoDimKey
	, CONCAT(GLE.CompanyCode,GLE.DimensionSetID, CASE GLE.DocumentType WHEN 'INVOICE' THEN 'Posted Invoice' ELSE 'Posted Credit'  END , GLE.DocumentNo) as CCDimsetKey
	, 1 as [Direct Entry]
from dbo.GLEntry GLE WITH(NOLOCK)
INNER JOIN dbo.Customer C WITH(NOLOCK) ON GLE.SourceNo = C.[No]  AND C.CompanyCode = GLE.CompanyCode
INNER JOIN dbo.GLSetup GLS WITH(NOLOCK) ON  GLS.CompanyCode = C.CompanyCode
LEFT  JOIN dbo.CurrencyExchangeRate CER WITH(NOLOCK) ON GLS.LCYCode = CER.CurrencyCode AND C.CompanyCode = CER.CompanyCode
	AND MONTH (CER.StartingDate) = MONTH(GLE.PostingDate) AND YEAR(CER.StartingDate) = YEAR(GLE.PostingDate)
where GLAccountNo = '10110'  
and DocumentNo not in ( 
		select DISTINCT DocumentNo from dbo.[SalesInvoiceHeader] WITH(NOLOCK)
		UNION
		select DISTINCT DocumentNo from dbo.[SalesCrMemoHeader] WITH(NOLOCK)
		UNION
		select DISTINCT DocumentNo from dbo.[SalesHeader] WITH(NOLOCK)
		)



--select Top 10 *  from dbo.[Sales Data Set]
GO
