/****** Object:  View [dbo].[Sales Invoice Lines Dim Set]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE View [dbo].[Sales Invoice Lines Dim Set]
as
SELECT DISTINCT
	SIH.CompanyCode
	, SIH.No as DocumentNo
	, SIL.No, SIL.DimensionSetID
	, DS.BRAND as Brand
	, DS.CHANNEL as Channel
	, DS.CUSTOMER as Customer
	, DS.DEPARTMENT as [Geography]
	, DS.DEPARTMENT as [Department]
	, CONCAT(SIH.CompanyCode,SIH.No, SIL.No) as CCDocItemNoKey
	, CONCAT(SIH.CompanyCode, SIL.DimensionSetID ) as CCDimSetIDKey
	, CONCAT(SIH.CompanyCode , SIL.DimensionSetID , SIL.DocumentNo , SIL.[LineNo]) as CCDocKey
FROM 
dbo.SalesInvoiceHeader	SIH WITH(NOLOCK)
INNER JOIN dbo.SalesInvoiceLine SIL WITH(NOLOCK) ON SIL.DocumentNo = SIH.No  AND SIL.CompanyCode = SIH.CompanyCode
INNER JOIN dbo.Customer C WITH(NOLOCK) ON SIL.SelltoCustomerNo = C.[No]  AND C.CompanyCode = SIL.CompanyCode
INNER JOIN (
		select DISTINCT SIH.CompanyCode, DSEB.DimensionSetID 
			, max( CASE DimensionCode WHEN 'BRAND' then DimensionValueCode end) as 'BRAND'
			, max( CASE DimensionCode WHEN 'CHANNEL' then DimensionValueCode end) as 'CHANNEL'
			, max( CASE DimensionCode WHEN 'CUSTOMER' then DimensionValueCode end) as 'CUSTOMER'
			, max( CASE DimensionCode WHEN 'DEPARTMENT' then DimensionValueCode end) as 'DEPARTMENT'
			, max( CASE DimensionCode WHEN 'GEOGRAPHY' then DimensionValueCode end) as 'GEOGRAPHY'
		FRom
		dbo.SalesInvoiceHeader	SIH WITH(NOLOCK)
		INNER JOIN dbo.SalesInvoiceLine SIL WITH(NOLOCK) ON SIL.DocumentNo = SIH.No  AND SIL.CompanyCode = SIH.CompanyCode
		INNER JOIN dbo.Customer C WITH(NOLOCK) ON SIL.SelltoCustomerNo = C.[No]  AND C.CompanyCode = SIL.CompanyCode
		INNER JOIN DimensionSetEntry DSEB WITH(NOLOCK) ON DSEB.CompanyCode =SIL.CompanyCode AND SIL.DimensionSetID = DSEB.DimensionSetID 
		group by SIH.CompanyCode, SIH.No, SIL.[LineNo],DSEB.DimensionSetID 
	) as DS
	ON  DS.CompanyCode =SIL.CompanyCode AND SIL.DimensionSetID = DS.DimensionSetID 
--INNER JOIN DimensionSetEntry DSEB WITH(NOLOCK) ON DSEB.CompanyCode =SIL.CompanyCode AND SIL.DimensionSetID = DSEB.DimensionSetID ANd DSEB.DimensionCode = 'BRAND'
--INNER JOIN DimensionSetEntry DSEC WITH(NOLOCK) ON DSEC.CompanyCode =SIL.CompanyCode AND SIL.DimensionSetID = DSEC.DimensionSetID ANd DSEC.DimensionCode = 'CHANNEL'
--INNER JOIN DimensionSetEntry DSECU WITH(NOLOCK) ON DSECU.CompanyCode =SIL.CompanyCode AND SIL.DimensionSetID = DSECU.DimensionSetID ANd DSECU.DimensionCode = 'CUSTOMER'
--INNER JOIN DimensionSetEntry DSED WITH(NOLOCK) ON DSED.CompanyCode =SIL.CompanyCode AND SIL.DimensionSetID = DSED.DimensionSetID ANd DSED.DimensionCode = 'DEPARTMENT'
--INNER JOIN DimensionSetEntry DSEG WITH(NOLOCK) ON DSEG.CompanyCode =SIL.CompanyCode AND SIL.DimensionSetID = DSEG.DimensionSetID ANd DSEG.DimensionCode = 'GEOGRAPHY'

WHERE Type <> ''
GO
