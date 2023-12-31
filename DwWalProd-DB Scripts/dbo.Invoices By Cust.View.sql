/****** Object:  View [dbo].[Invoices By Cust]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[Invoices By Cust]
AS
SELECT C.[No] AS [Customer Number], C.[Name] AS Code
, Case ISNULL(C.ChainName,'') WHEN '' THEN C.No ELSE ChainName END AS [Cust Code],
SearchName AS Name /*, SUM(SL.GBP) AS [Total Amount]*/  from dbo.Customer  C
INNER JOIN dbo.[Sales Lines] SL ON C.[No] = SL.SelltoCustomerNo
GO
