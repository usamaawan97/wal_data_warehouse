/****** Object:  StoredProcedure [dbo].[Clear Reloading Tables]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:      Usama Awan
-- Create Date: 16-Sep-2021
-- Description: To empty reloading tables
-- =============================================

-- EXEC  [dbo].[Clear Reloading Tables]

CREATE PROCEDURE [dbo].[Clear Reloading Tables]
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON
	
	TRUNCATE TABLE dbo.Customer
	TRUNCATE TABLE dbo.Vendor
	TRUNCATE TABLE dbo.Items
	TRUNCATE TABLE dbo.ItemUnitOfMeasure
	TRUNCATE TABLE dbo.DefaultDimension
	TRUNCATE TABLE dbo.SalesHeader
	TRUNCATE TABLE dbo.SalesLine
	TRUNCATE TABLE dbo.DimensionValue
	TRUNCATE TABLE dbo.GLAccount
	TRUNCATE TABLE dbo.PurchaseHeader
	TRUNCATE TABLE dbo.PurchaseLine
	TRUNCATE TABLE dbo.BinContent
	TRUNCATE TABLE dbo.Currency
	TRUNCATE TABLE dbo.CurrencyExchangeRate
	TRUNCATE TABLE dbo.Dimension
	TRUNCATE TABLE dbo.PurchaseCrMemoHeader
	TRUNCATE TABLE dbo.PurchaseCrMemoLine
	TRUNCATE TABLE dbo.PurchaseInvoiceHeader
	TRUNCATE TABLE dbo.PurchaseReceiptHeader
	TRUNCATE TABLE dbo.SalesCrMemoHeader
	TRUNCATE TABLE dbo.SalesCrMemoLine
	TRUNCATE TABLE dbo.GLSetup
	TRUNCATE TABLE dbo.GLBudgetName
	TRUNCATE TABLE dbo.GLBudgetEntry
	TRUNCATE TABLE dbo.CustomerExpectedOrder
	TRUNCATE TABLE dbo.CustomerGroup

	SELECT TOP (1) * FROM dbo.Customer;

END
GO
