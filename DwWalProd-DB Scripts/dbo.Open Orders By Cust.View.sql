/****** Object:  View [dbo].[Open Orders By Cust]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[Open Orders By Cust]
AS
SELECT DISTINCT SL.SelltoCustomerNo , SL.SelltoCustomerName AS [Customer Name], SL.BrandCode /*, SUM(SL.GBP) AS [Total Amount]*/  from dbo.Customer  C
INNER JOIN dbo.[Sales Lines] SL ON C.[No] = SL.SelltoCustomerNo
GO
