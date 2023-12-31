/****** Object:  View [dbo].[Sales Invoice Line]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[Sales Invoice Line]
AS

SELECT DISTINCT
	 SIH.No as DocumentNo, 'Invoice' as DocumentType, SIL.[LineNo], SIH.PostingDate, SIH.SelltoCustomerNo, SIH.SelltoCustomerName,SIH.SelltoAddress, SIH.SelltoAddress2, SIH.SelltoCity,
	SIH.SelltoCounty, SIH.SelltoPostCode ,SIH.SelltoCountryRegionCode, SIH.ShiptoName, SIH.ShiptoAddress, SIH.ShiptoAddress2, SIH.ShiptoCity, SIH.ShiptoCounty,
	SIH.ShiptoCountryRegionCode, SIH.ShiptoPostCode,  [Type], SIL.[No], [Description], SIL.LocationCode, SIL.ShortcutDimension1Code as BrandCode , 
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

	SIL.ResponsibilityCenter AS ResponsibilityCenter, Quantity, UnitCost, UnitCostLCY, UnitofMeasureCode,
	GLS.LCYCode as CompanyCurrencyCode, 
	CASE WHEN SIH.CurrencyCode = '' THEN GLS.LCYCode ELSE SIH.CurrencyCode  end As DocCurrencyCode,
	ISNULL(CER.ExchangeRateAmount,1) as ExchangeRate,
	
	CASE GLS.LCYCode WHEN 'GBP' THEN 'USD' 
					 WHEN 'USD' THEN 'GBP'
	END As AlternateCurrency,

	CASE GLS.LCYCode WHEN 'GBP' THEN dbo.GetExchangeRate(SIH.CompanyCode,SIH.ShipmentDate,'USD') 
					 WHEN 'USD' THEN dbo.GetExchangeRate(SIH.CompanyCode,SIH.ShipmentDate,'GBP') 
	END As AlternateExRate,

	--dbo.GetExchangeRate(SIH.CompanyCode,SIH.ShipmentDate,'GBP') As GBPExRate,
	--dbo.GetExchangeRate(SIH.CompanyCode,SIH.ShipmentDate,'AUD') As AUDExRate,
	--dbo.GetExchangeRate(SIH.CompanyCode,SIH.ShipmentDate,'EUR') As EURExRate,
	--dbo.GetExchangeRate(SIH.CompanyCode,SIH.ShipmentDate,'CAD') As CADExRate,
	UnitPrice , 
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
	MONTH (SIL.ShipmentDate ) AS [Shipment Month],
	YEAR(SIL.ShipmentDate) AS [Shipment Year],
	concat(year(SIL.ShipmentDate),datepart(mm, SIL.ShipmentDate)) as ShipmentMMYYYY,
	C.SearchName AS [Customer Name] ,
	SIL.DimensionSetID
	,CONCAT(SIL.CompanyCode , SIL.DimensionSetID)  as CCDimSetIDKey
	--CAST(SIL.DimensionSetID as nvarchar) as CCDimSetIDKey
	, CONCAT(SIH.CompanyCode , SIH.No , SIL.No ) as CCDocItemNoKey
	--, SIH.CompanyCode + SIH.No + SIL.No as CCDocItemNoKey
	, CONCAT(SIH.CompanyCode , SIH.SelltoCustomerNo )as CCCustNoKey
	,CONCAT(SIH.CompanyCode, SIL.DimensionSetID, SIL.DocumentNo , SIL.[LineNo] ) as CCDocKey
	--, SIH.CompanyCode + CAST(SIL.DimensionSetID as nvarchar) + SIL.DocumentNo + CAST( SIL.[LineNo] as nvarchar) as CCDocKey
    ,CONCAT(SIH.CompanyCode, SIH.SelltoCustomerNo , SIL.ShortcutDimension1Code,CONCAT(datepart(mm, SIL.ShipmentDate),YEAR(SIL.ShipmentDate))) as CCCustNoDimDateKey
	,CONCAT(SIH.CompanyCode, SIH.SelltoCustomerNo , CONCAT(datepart(mm, SIL.ShipmentDate),YEAR(SIL.ShipmentDate))) as CCCustNoDateKey
	,CONCAT(SIH.CompanyCode, SIH.SelltoCustomerNo , SIL.ShortcutDimension1Code) as CCCustNoDimKey
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
SELECT  /*Top 7639*/
	 SCMH.No as DocumentNo,  'Credit Memo' as DocumentType,SCL.[LineNo], SCMH.PostingDate, SCMH.SelltoCustomerNo, SCMH.SelltoCustomerName,SCMH.SelltoAddress, SCMH.SelltoAddress2, SCMH.SelltoCity,
	SCMH.SelltoCounty, SCMH.SelltoPostCode ,SCMH.SelltoCountryRegionCode, SCMH.ShiptoName, SCMH.ShiptoAddress, SCMH.ShiptoAddress2, SCMH.ShiptoCity, SCMH.ShiptoCounty,
	SCMH.ShiptoCountryRegionCode, SCMH.ShiptoPostCode,  [Type], SCL.[No], [Description], SCL.LocationCode, SCL.ShortcutDimension1Code as BrandCode , 
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
	concat(year(SCL.ShipmentDate),datepart(mm, SCL.ShipmentDate)) as ShipmentMMYYYY,
	C.SearchName AS [Customer Name] ,
	SCL.DimensionSetID
	--,SCL.CompanyCode + CAST(SCL.DimensionSetID as nvarchar) as CCDimSetIDKey
	, CONCAT(SCL.CompanyCode , SCL.DimensionSetID) as CCDimSetIDKey
	, CONCAT(SCMH.CompanyCode , SCMH.No ,SCL.No ) as CCDocItemNoKey
		--, SCMH.CompanyCode + SCMH.No + SCL.No as CCDocItemNoKey
	, CONCAT(SCMH.CompanyCode , SCMH.SelltoCustomerNo ) as CCCustNoKey
	 --,SCMH.CompanyCode + SCMH.SelltoCustomerNo as CCCustNoKey
	, CONCAT(SCMH.CompanyCode ,SCL.DimensionSetID , SCL.DocumentNo,  SCL.[LineNo] ) as CCDocKey
	--, SCMH.CompanyCode + CAST(SCL.DimensionSetID as nvarchar) + SCL.DocumentNo + CAST( SCL.[LineNo] as nvarchar) as CCDocKey
	 ,CONCAT(SCMH.CompanyCode, SCMH.SelltoCustomerNo,SCL.ShortcutDimension1Code ,CONCAT(datepart(mm, SCL.ShipmentDate),YEAR(SCL.ShipmentDate))) as CCCustNoDimDateKey
     ,CONCAT(SCMH.CompanyCode, SCMH.SelltoCustomerNo , CONCAT(datepart(mm, SCL.ShipmentDate),YEAR(SCL.ShipmentDate))) as CCCustNoDateKey
	,CONCAT(SCMH.CompanyCode, SCMH.SelltoCustomerNo , SCL.ShortcutDimension1Code) as CCCustNoDimKey
FROM 
dbo.SalesCrMemoHeader	SCMH WITH(NOLOCK)
INNER JOIN dbo.SalesCrMemoLine SCL WITH(NOLOCK) ON SCL.DocumentNo = SCMH.No
AND SCL.CompanyCode = SCMH.CompanyCode
INNER JOIN dbo.Customer C WITH(NOLOCK) ON SCL.SelltoCustomerNo = C.[No]  AND C.CompanyCode = SCL.CompanyCode
INNER JOIN dbo.GLSetup GLS WITH(NOLOCK) ON  GLS.CompanyCode = C.CompanyCode
LEFT  JOIN dbo.CurrencyExchangeRate CER WITH(NOLOCK) ON SCMH.CurrencyCode = CER.CurrencyCode AND SCMH.CompanyCode = CER.CompanyCode
	AND MONTH (CER.StartingDate) = MONTH(SCL.ShipmentDate) AND YEAR(CER.StartingDate) = YEAR(SCL.ShipmentDate)

WHERE Type <> ''  AND SCL.ShipmentDate >= '2000-01-01' 

GO
