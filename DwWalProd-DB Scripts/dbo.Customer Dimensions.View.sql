/****** Object:  View [dbo].[Customer Dimensions]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[Customer Dimensions]
as
SELECT DISTINCT
	C.CompanyCode  
	--, CASE WHEN C.CustomerGroup <> '' THEN C.CustomerGroup ELSE  C.No END as [Cust Code],  
	, C.No  as [Cust Code]
	, DD.DimensionCode, DD.DimensionValueCode, 
	C.CompanyCode  + C.No as CompCustKey
	--CASE WHEN C.CustomerGroup <> '' THEN C.CustomerGroup ELSE  C.No END as CompCustKey
from 
dbo.[Customer]  C
INNER JOIN dbo.DefaultDimension DD ON
DD.CompanyCode = C.CompanyCode 
--AND DD.TableID = 18 
AND DD.No = C.No
GO
