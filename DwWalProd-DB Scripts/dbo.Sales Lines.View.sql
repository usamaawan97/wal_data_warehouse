/****** Object:  View [dbo].[Sales Lines]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO












CREATE VIEW [dbo].[Sales Lines]
AS

SELECT  
	 SIH.No as DocumentNo, SIH.DocumentType, SIL.[LineNo], SIH.PostingDate, SIH.SelltoCustomerNo, SIH.SelltoCustomerName,SIH.SelltoAddress, SIH.SelltoAddress2, SIH.SelltoCity,
	SIH.SelltoCounty, SIH.SelltoPostCode ,SIH.SelltoCountryRegionCode, SIH.ShiptoName, SIH.ShiptoAddress, SIH.ShiptoAddress2, SIH.ShiptoCity, SIH.ShiptoCounty,
	SIH.ShiptoCountryRegionCode, SIL.OutstandingQuantity,SIL.CurrencyCode,CER.ExchangeRateAmount,SIH.ShiptoPostCode,  [Type], SIL.[No], [Description], SIL.LocationCode, SIL.ShortcutDimension1Code as BrandCode , 
	SIL.ShortcutDimension2Code AS GeographyCode ,  (SIL.OutstandingQuantity - SIL.Quantity) AS [O/S Qty],
	SIL.ResponsibilityCenter AS ResponsibilityCenter, Quantity,  UnitofMeasureCode,SIL.AmountIncludingVAT, SIL.VATBaseAmount,SIL.UnitCost,SIL.UnitCostLCY,
	GLS.LCYCode as CompanyCurrencyCode,  SIL.CompanyCode, LineAmount AS LineAmtExTax,
	CASE WHEN SIH.CurrencyCode = '' THEN GLS.LCYCode ELSE SIH.CurrencyCode  end As DocCurrencyCode,
	ISNULL(CER.ExchangeRateAmount,1) as ExchangeRate,
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
	CASE WHEN GLS.LCYCode <> SIH.CurrencyCode THEN ROUND(LineAmount / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE LineAmount END as LineAmtExTaxBCY,
	
	SIL.AmountIncludingVAT as LineAmtIncTax ,
	CASE WHEN GLS.LCYCode <> SIH.CurrencyCode THEN ROUND(SIL.AmountIncludingVAT / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE LineAmount END as LineAmtIncTaxBCY,
	SIL.VATBaseAmount as TaxBaseAmount,
	CASE WHEN GLS.LCYCode <> SIH.CurrencyCode THEN ROUND(SIL.VATBaseAmount / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE LineAmount END as TaxBaseAmountBCY,
	SIL.Amount,
	CASE WHEN GLS.LCYCode <> SIH.CurrencyCode THEN ROUND(SIL.Amount / ISNULL(CER.ExchangeRateAmount,1) ,2) ELSE LineAmount END as AmountBCY,
	SIL.LineDiscountAmount,
	CASE WHEN GLS.LCYCode <> SIH.CurrencyCode THEN ROUND(SIL.LineDiscountAmount / ISNULL(CER.ExchangeRateAmount,1),2)  ELSE LineAmount END as LineDiscountAmountBCY,

	SIL.LineAmount/NULLIF(MT.MonthTotalAmt,0) * 	CEO.Expected_Order_Amt  as ExpectedOrderAmt,
	SIL.LineAmount/NULLIF(MT.MonthTotalAmt,0) * 	CEO.Risk_Amount as RiskOrderAmt,
	CEO.Expected_Order_Amt,
	CEO.Risk_Amount,
	SIL.ShipmentDate, 
	DATEADD(day,-1,CAST(SIL.ShipmentDate AS date )) AS AdjustedShipDate ,
    datepart(mm, SIL.ShipmentDate) as [Shipment Month No],
	MONTH (SIL.ShipmentDate) AS [Shipment Month],
	YEAR(SIL.ShipmentDate ) AS [Shipment Year],
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
GO
