/****** Object:  View [dbo].[Sales Lines Dim Set]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE View [dbo].[Sales Lines Dim Set]
as
SELECT 
	SH.CompanyCode, SH.No as DocumentNo, SL.No, SL.DimensionSetID, DSE.DimensionCode, DSE.DimensionValueCode,
	DSE.DimensionName, DimensionValueName,
	--SH.CompanyCode + SH.No + SL.No as CCDocItemNoKey,
	CONCAT(SH.CompanyCode ,SH.No , SL.No )as CCDocItemNoKey,
	--SH.CompanyCode + CAST(SL.DimensionSetID as nvarchar) as CCDimSetIDKey
	CONCAT(SH.CompanyCode , SL.DimensionSetID) as CCDimSetIDKey
FROM 
dbo.SalesHeader	SH WITH(NOLOCK)
INNER JOIN dbo.SalesLine SL WITH(NOLOCK) ON SL.DocumentNo = SH.No AND SL.DocumentType = SH.DocumentType AND SL.CompanyCode = SH.CompanyCode
INNER JOIN dbo.Customer C WITH(NOLOCK) ON SL.SelltoCustomerNo = C.[No]  AND C.CompanyCode = SL.CompanyCode
INNER JOIN DimensionSetEntry DSE WITH(NOLOCK) ON DSE.CompanyCode =SL.CompanyCode AND SL.DimensionSetID = DSE.DimensionSetID 
WHERE Type <> ''
GO
