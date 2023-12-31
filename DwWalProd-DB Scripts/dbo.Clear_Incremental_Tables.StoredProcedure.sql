/****** Object:  StoredProcedure [dbo].[Clear_Incremental_Tables]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:      Usama Awan
-- Create Date: 29-Sep-2021
-- Description: To empty incremental tables
-- =============================================

-- EXEC  [dbo].[Clear_Incremental_Tables]

CREATE PROCEDURE [dbo].[Clear_Incremental_Tables]
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON
	
	TRUNCATE TABLE dbo.ValueEntry
	TRUNCATE TABLE dbo.GLEntry
	TRUNCATE TABLE dbo.WarehouseEntry
	TRUNCATE TABLE dbo.ItemLedgerEntry
	TRUNCATE TABLE dbo.CustLedgerEntry
	TRUNCATE TABLE dbo.VendorLedgerEntry
	TRUNCATE TABLE dbo.DetailedCustomerLedgerEntry
	TRUNCATE TABLE dbo.DetailedVendorLedgerEntry
	TRUNCATE TABLE dbo.DimensionSetEntry
	TRUNCATE TABLE dbo.GLItemLedgerRelation
	TRUNCATE TABLE dbo.PurchaseInvoiceLine
	TRUNCATE TABLE dbo.SalesInvoiceHeader
	TRUNCATE TABLE dbo.SalesInvoiceLine
	TRUNCATE TABLE dbo.SalesShipmentHeader
	TRUNCATE TABLE dbo.SalesShipmentLine
	TRUNCATE TABLE dbo.PurchaseReceiptLine
	


END
GO
