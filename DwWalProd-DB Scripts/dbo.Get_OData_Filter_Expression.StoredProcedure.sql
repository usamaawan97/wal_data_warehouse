/****** Object:  StoredProcedure [dbo].[Get_OData_Filter_Expression]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:      Usama Awan
-- Create Date: 09-29-2021
-- Description: Created to get OData Filter Expression
-- =============================================

/*
DECLARE @FilterExpression NVARCHAR(MAX)
EXEC dbo.[Get_OData_Filter_Expression] 'SalesShipmentLine',0,1,'WAL',@FilterExpression  OUTPUT
SELECT  @FilterExpression
*/

CREATE PROCEDURE [dbo].[Get_OData_Filter_Expression]
(
   @TableName NVARCHAR(200),
   @IsBulkLoad BIT,
   @IsSpecificDate BIT,
   @CompanyCode NVARCHAR(150),
   @FilterExpression NVARCHAR(MAX) OUTPUT
   
)
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @EntryNo BIGINT
	DECLARE @DocumentNo NVARCHAR(100)
	DECLARE @LineNo BIGINT
	DECLARE @DimensionSetID INT
	DECLARE @DimensionCode NVARCHAR(100)
	DECLARE @GLEntryNo INT
	DECLARE @No NVARCHAR(100)
	DECLARE @Filter NVARCHAR(50)
	DECLARE @SystemModifiedDate DATETIME2;
	DECLARE @NewSystemModifiedDate NVARCHAR(100)
	DECLARE @StartFromDate NVARCHAR(100)
	DECLARE @LastUpadted DATETIME2;
    DECLARE @NewLastUpdatedDate NVARCHAR(100);
	DECLARE @Rows INT;

	SELECT @LastUpadted = LastUpadted from dbo.DW_Interface_Setup
	SET @NewLastUpdatedDate  = DATEADD(day,-1,@LastUpadted)
	SET @NewLastUpdatedDate = CONCAT(REPLACE(@NewLastUpdatedDate, ' ', 'T'), 'Z')
	SELECT @StartFromDate = StartFromDate from dbo.DW_Interface_Setup
    SET @Filter = '?$filter='


	IF @TableName = 'ValueEntry' 
		BEGIN

				SELECT TOP 1  @EntryNo = EntryNo  FROM dbo.ValueEntry WHERE CompanyCode= @CompanyCode ORDER BY EntryNo DESC;
				SELECT  @Rows = @@ROWCOUNT 
				IF @IsBulkLoad = 1
					BEGIN
							SET @FilterExpression = @Filter +'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))
					END
				
				ELSE
					BEGIN
					        IF @IsSpecificDate = 1
									BEGIN
											IF @Rows =  0 
													BEGIN
															SET @FilterExpression = @Filter + 'SystemModifiedDate gt '+ @StartFromDate
													END
											ELSE 
													BEGIN
															SET @FilterExpression = @Filter +'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @StartFromDate
													END
											
									END
							ELSE
							        BEGIN
											SET @FilterExpression = @Filter +'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @NewLastUpdatedDate
									END
									
					END

		END 

	ELSE IF @TableName = 'GLEntry' 
		BEGIN
				SELECT TOP 1  @EntryNo = EntryNo  FROM dbo.GLEntry WHERE CompanyCode= @CompanyCode  ORDER BY EntryNo DESC;
				SELECT  @Rows = @@ROWCOUNT 
				IF @IsBulkLoad = 1
					BEGIN
							SET @FilterExpression = @Filter +'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))
					END
				
				ELSE
					BEGIN
					        IF @IsSpecificDate = 1
									BEGIN
											IF @Rows =  0 
												BEGIN
														SET @FilterExpression = @Filter + 'SystemModifiedDate gt '+ @StartFromDate
												END
											ELSE 
												BEGIN
														SET @FilterExpression = @Filter +'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @StartFromDate
												END
											
									END
							ELSE
							        BEGIN
											SET @FilterExpression = @Filter +'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @NewLastUpdatedDate
									END
						
							
					END
		END 

	ELSE IF @TableName = 'WarehouseEntry' 
		BEGIN
				SELECT TOP 1  @EntryNo = EntryNo  FROM dbo.WarehouseEntry WHERE CompanyCode= @CompanyCode  ORDER BY EntryNo DESC;
				SELECT  @Rows = @@ROWCOUNT 
				IF @IsBulkLoad = 1
					BEGIN
							SET @FilterExpression = @Filter + 'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))
					END
				
				ELSE
					BEGIN
					        IF @IsSpecificDate = 1
									BEGIN
											IF @Rows =  0 
												BEGIN
														SET @FilterExpression = @Filter + 'SystemModifiedDate gt '+ @StartFromDate
												END
											ELSE 
												BEGIN
														SET @FilterExpression = @Filter + 'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @StartFromDate
												END
											
									END
							ELSE
							        BEGIN
											SET @FilterExpression = @Filter + 'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @NewLastUpdatedDate
									END
						
							
					END
		END 

	ELSE IF @TableName = 'ItemLedgerEntry' 
		BEGIN
				SELECT TOP 1  @EntryNo = EntryNo  FROM dbo.ItemLedgerEntry WHERE CompanyCode= @CompanyCode  ORDER BY EntryNo DESC;
				SELECT  @Rows = @@ROWCOUNT 
				IF @IsBulkLoad = 1
					BEGIN
							SET @FilterExpression = @Filter +'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))
					END
				
				ELSE
					BEGIN
					        IF @IsSpecificDate = 1
									BEGIN
											IF @Rows =  0 
												BEGIN
														SET @FilterExpression = @Filter + 'SystemModifiedDate gt '+ @StartFromDate
												END
											ELSE 
												BEGIN
														SET @FilterExpression = @Filter +'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @StartFromDate
												END
											
									END
							ELSE
							        BEGIN
											SET @FilterExpression = @Filter +'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @NewLastUpdatedDate
									END
						
							
					END
		END 

	ELSE IF @TableName = 'CustLedgerEntry' 
		BEGIN
				SELECT TOP 1  @EntryNo = EntryNo  FROM dbo.CustLedgerEntry WHERE CompanyCode= @CompanyCode  ORDER BY EntryNo DESC;
				SELECT  @Rows =  @@ROWCOUNT 
				IF @IsBulkLoad = 1
					BEGIN
							SET @FilterExpression = @Filter +'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))
					END
				
				ELSE
					BEGIN
					        IF @IsSpecificDate = 1
									BEGIN
											IF @Rows =  0 
												BEGIN
														SET @FilterExpression = @Filter + 'SystemModifiedDate gt '+ @StartFromDate
												END
											ELSE 
												BEGIN
														SET @FilterExpression = @Filter +'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @StartFromDate
												END
											
									END
							ELSE
							        BEGIN
											SET @FilterExpression = @Filter +'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @NewLastUpdatedDate
									END
						
							
					END
		END 

	ELSE IF @TableName = 'VendorLedgerEntry' 
		BEGIN
				SELECT TOP 1  @EntryNo = EntryNo  FROM dbo.VendorLedgerEntry WHERE CompanyCode= @CompanyCode  ORDER BY EntryNo DESC;
				SELECT  @Rows =  @@ROWCOUNT 
				IF @IsBulkLoad = 1
					BEGIN
							SET @FilterExpression = @Filter +'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))
					END
				
				ELSE
					BEGIN
					        IF @IsSpecificDate = 1
									BEGIN
											IF @Rows =  0 
												BEGIN
														SET @FilterExpression = @Filter + 'SystemModifiedDate gt '+ @StartFromDate
												END
											ELSE 
												BEGIN
														SET @FilterExpression = @Filter +'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @StartFromDate
												END
											
									END
							ELSE
							        BEGIN
											SET @FilterExpression = @Filter +'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @NewLastUpdatedDate
									END
						
							
					END
		END 

	ELSE IF @TableName = 'DetailedCustomerLedgerEntry' 
		BEGIN
				SELECT TOP 1  @EntryNo = EntryNo  FROM dbo.DetailedCustomerLedgerEntry WHERE CompanyCode= @CompanyCode  ORDER BY EntryNo DESC;
				SELECT  @Rows =  @@ROWCOUNT 
				IF @IsBulkLoad = 1
					BEGIN
							SET @FilterExpression = @Filter +'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))
					END
				
				ELSE
					BEGIN
					        IF @IsSpecificDate = 1
									BEGIN
											IF @Rows =  0 
												BEGIN
														SET @FilterExpression = @Filter + 'SystemModifiedDate gt '+ @StartFromDate
												END
											ELSE 
												BEGIN
														SET @FilterExpression = @Filter +'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @StartFromDate
												END
											
									END
							ELSE
							        BEGIN
											SET @FilterExpression = @Filter +'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @NewLastUpdatedDate
									END
						
							
					END
		END 

	ELSE IF @TableName = 'DetailedVendorLedgerEntry' 
		BEGIN
				SELECT TOP 1  @EntryNo = EntryNo  FROM dbo.DetailedVendorLedgerEntry WHERE CompanyCode= @CompanyCode  ORDER BY EntryNo DESC;
				SELECT @Rows =  @@ROWCOUNT 
				IF @IsBulkLoad = 1
					BEGIN
							SET @FilterExpression = @Filter +'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))
					END
				
				ELSE
					BEGIN
					        IF @IsSpecificDate = 1
									BEGIN
											IF @Rows =  0 
												BEGIN
														SET @FilterExpression = @Filter + 'SystemModifiedDate gt '+ @StartFromDate
												END
											ELSE 
												BEGIN
														SET @FilterExpression = @Filter +'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @StartFromDate
												END
											
									END
							ELSE
							        BEGIN
											SET @FilterExpression = @Filter +'EntryNo gt '+ CAST(@EntryNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @NewLastUpdatedDate
									END
						
							
					END
		END 

	ELSE IF @TableName = 'DimensionSetEntry' 
		BEGIN
				SELECT TOP 1  @DimensionSetID = DimensionSetID, @DimensionCode = DimensionCode  FROM dbo.DimensionSetEntry WHERE CompanyCode= @CompanyCode  ORDER BY DimensionSetID DESC;
				SELECT  @Rows =  @@ROWCOUNT 
				IF @IsBulkLoad = 1
					BEGIN
							SET @FilterExpression = @Filter +'DimensionCode gt '+''''+ @DimensionCode + ''''+' and '+'DimensionSetID gt ' +CAST(@DimensionSetID AS NVARCHAR(100))
					END
				
				ELSE
					BEGIN
					        IF @IsSpecificDate = 1
									BEGIN
											IF @Rows =  0 
												BEGIN
														SET @FilterExpression = @Filter + 'SystemModifiedDate gt '+ @StartFromDate
												END
											ELSE 
												BEGIN
														SET @FilterExpression = @Filter +'DimensionSetID ge ' +CAST(@DimensionSetID AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @StartFromDate
														--SET @FilterExpression = @Filter +'DimensionCode gt '+''''+ @DimensionCode + ''''+' and '+'DimensionSetID gt ' +CAST(@DimensionSetID AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @StartFromDate
												END
											
									END
							ELSE
							        BEGIN
											SET @FilterExpression = @Filter +'DimensionCode gt '+''''+ @DimensionCode + ''''+' and '+'DimensionSetID gt ' +CAST(@DimensionSetID AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @NewLastUpdatedDate
									END
						
							
					END
		
		END 

	ELSE IF @TableName = 'GLItemLedgerRelation' 
		BEGIN
				SELECT TOP 1  @GLEntryNo = GLEntryNo  FROM dbo.GLItemLedgerRelation WHERE CompanyCode= @CompanyCode  ORDER BY GLEntryNo DESC;
				SELECT  @Rows = @@ROWCOUNT 
				IF @IsBulkLoad = 1
					BEGIN
							SET @FilterExpression = @Filter +'GLEntryNo gt '+ CAST(@GLEntryNo AS NVARCHAR(100))
					END
				
				ELSE
					BEGIN
					        IF @IsSpecificDate = 1
									BEGIN
											IF @Rows =  0 
												BEGIN
														SET @FilterExpression = @Filter + 'SystemModifiedDate gt '+ @StartFromDate
												END
											ELSE 
												BEGIN
														SET @FilterExpression = @Filter +'GLEntryNo gt '+ CAST(@GLEntryNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @StartFromDate
												END
											
									END
							ELSE
							        BEGIN
											SET @FilterExpression = @Filter +'GLEntryNo gt '+ CAST(@GLEntryNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @NewLastUpdatedDate
									END
						
							
					END
		END 

	ELSE IF @TableName = 'PurchaseInvoiceLine' 
		BEGIN
				SELECT TOP 1  @DocumentNo = DocumentNo, @LineNo = [LineNo]  FROM dbo.PurchaseInvoiceLine WHERE CompanyCode= @CompanyCode  ORDER BY DocumentNo DESC;
				SELECT  @Rows = @@ROWCOUNT 
				IF @IsBulkLoad = 1
					BEGIN
							SET @FilterExpression = @Filter +'DocumentNo gt '+''''+ @DocumentNo + ''''+' and '+'LineNo gt ' +CAST(@LineNo AS NVARCHAR(100))
					END
				
		        ELSE
					BEGIN
					        IF @IsSpecificDate = 1
									BEGIN
											IF @Rows =  0 
												BEGIN
														SET @FilterExpression = @Filter + 'SystemModifiedDate gt '+ @StartFromDate
												END
											ELSE 
												BEGIN
														SET @FilterExpression = @Filter +'DocumentNo ge '+''''+ @DocumentNo + ''''+' and '+ 'SystemModifiedDate gt '+ @StartFromDate
														--SET @FilterExpression = @Filter +'DocumentNo gt '+''''+ @DocumentNo + ''''+' and '+'LineNo gt ' +CAST(@LineNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @StartFromDate
												END
											
									END
							ELSE
							        BEGIN
											SET @FilterExpression = @Filter +'DocumentNo gt '+''''+ @DocumentNo + ''''+' and '+'LineNo gt ' +CAST(@LineNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @NewLastUpdatedDate
									END
						
							
					END
		END 

	ELSE IF @TableName = 'PurchaseReceiptLine' 
		BEGIN
				SELECT TOP 1  @DocumentNo = DocumentNo, @LineNo = [LineNo]  FROM dbo.PurchaseReceiptLine WHERE CompanyCode= @CompanyCode  ORDER BY DocumentNo DESC;
				SELECT  @Rows = @@ROWCOUNT 
				IF @IsBulkLoad = 1
					BEGIN
							SET @FilterExpression = @Filter +'DocumentNo gt '+''''+ @DocumentNo + ''''+' and '+'LineNo gt ' +CAST(@LineNo AS NVARCHAR(100))
					END
				
		        ELSE
					BEGIN
					        IF @IsSpecificDate = 1
									BEGIN
											IF @Rows =  0 
												BEGIN
														SET @FilterExpression = @Filter + 'SystemModifiedDate gt '+ @StartFromDate
												END
											ELSE 
												BEGIN
														SET @FilterExpression = @Filter +'DocumentNo ge '+''''+ @DocumentNo + ''''+' and '+ 'SystemModifiedDate gt '+ @StartFromDate
														--SET @FilterExpression = @Filter +'DocumentNo gt '+''''+ @DocumentNo + ''''+' and '+'LineNo gt ' +CAST(@LineNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @StartFromDate
												END
											
									END
							ELSE
							        BEGIN
											SET @FilterExpression = @Filter +'DocumentNo gt '+''''+ @DocumentNo + ''''+' and '+'LineNo gt ' +CAST(@LineNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @NewLastUpdatedDate
									END
						
							
					END
		END 

	ELSE IF @TableName = 'SalesInvoiceHeader' 
		BEGIN
				SELECT TOP 1  @No = [No]  FROM dbo.SalesInvoiceHeader WHERE CompanyCode= @CompanyCode  ORDER BY [No] DESC;
				SELECT  @Rows = @@ROWCOUNT 
				IF @IsBulkLoad = 1
					BEGIN
							SET @FilterExpression = @Filter +'No gt '+''''+ @No + ''''
					END
				
				ELSE
					BEGIN
					        IF @IsSpecificDate = 1
									BEGIN
											IF @Rows =  0 
												BEGIN
														SET @FilterExpression = @Filter + 'SystemModifiedDate gt '+ @StartFromDate
												END
											ELSE 
												BEGIN
														SET @FilterExpression = @Filter +'No gt '+''''+ @No + ''''+' and '+ 'SystemModifiedDate gt '+ @StartFromDate	
												END
											
									END
							ELSE
							        BEGIN
											SET @FilterExpression = @Filter +'No gt '+''''+ @No + ''''+' and '+ 'SystemModifiedDate gt '+ @NewLastUpdatedDate
									END
						
							
					END
		END 

	ELSE IF @TableName = 'SalesInvoiceLine' 
		BEGIN
				SELECT TOP 1  @DocumentNo = DocumentNo, @LineNo = [LineNo]  FROM dbo.SalesInvoiceLine WHERE CompanyCode= @CompanyCode  ORDER BY DocumentNo DESC;
				SELECT @Rows = @@ROWCOUNT 
				IF @IsBulkLoad = 1
					BEGIN
							SET @FilterExpression = @Filter +'DocumentNo gt '+''''+ @DocumentNo + ''''+' and '+'LineNo gt ' +CAST(@LineNo AS NVARCHAR(100))
					END
				
				ELSE
					BEGIN
					        IF @IsSpecificDate = 1
									BEGIN
											IF @Rows =  0 
												BEGIN
														SET @FilterExpression = @Filter + 'SystemModifiedDate gt '+ @StartFromDate
												END
											ELSE 
												BEGIN
														SET @FilterExpression = @Filter +'DocumentNo ge '+''''+ @DocumentNo + ''''+' and '+ 'SystemModifiedDate gt '+ @StartFromDate
														--SET @FilterExpression = @Filter +'DocumentNo gt '+''''+ @DocumentNo + ''''+' and '+'LineNo gt ' +CAST(@LineNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @StartFromDate
												END
											
									END
							ELSE
							        BEGIN
											SET @FilterExpression = @Filter +'DocumentNo gt '+''''+ @DocumentNo + ''''+' and '+'LineNo gt ' +CAST(@LineNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @NewLastUpdatedDate
									END
						
							
					END
		END 


	ELSE IF @TableName = 'SalesShipmentHeader' 
		BEGIN
				SELECT TOP 1  @No = [No]  FROM dbo.SalesShipmentHeader WHERE CompanyCode= @CompanyCode  ORDER BY PostingDate DESC;
				SELECT  @Rows = @@ROWCOUNT 
				IF @IsBulkLoad = 1
					BEGIN
							SET @FilterExpression = @Filter +'No gt '+''''+ @No + ''''
					END
				
				ELSE
					BEGIN
					        IF @IsSpecificDate = 1
									BEGIN
											IF @Rows =  0 
												BEGIN
														SET @FilterExpression = @Filter + 'SystemModifiedDate gt '+ @StartFromDate
												END
											ELSE 
												BEGIN
														/*IF @CompanyCode = 'WAL'
																BEGIN
																		SET @NewSystemModifiedDate  = @SystemModifiedDate
																		SET @NewSystemModifiedDate = CONCAT(REPLACE(@NewSystemModifiedDate, ' ', 'T'), 'Z')
																		SET @FilterExpression = @Filter + 'SystemModifiedDate gt '+ @NewSystemModifiedDate
																END
														ELSE
																BEGIN*/
																		SET @FilterExpression = @Filter +'No gt '+''''+ @No + ''''+' and '+ 'SystemModifiedDate gt '+ @StartFromDate
																/*END*/
														
												END
											
									END
							ELSE
							        BEGIN
											SET @FilterExpression = @Filter +'No gt '+''''+ @No + ''''+' and '+ 'SystemModifiedDate gt '+ @NewLastUpdatedDate
									END
						
							
					END
		END 
	
	ELSE IF @TableName = 'SalesShipmentLine' 
		BEGIN
				SELECT TOP 1  @DocumentNo = DocumentNo, @LineNo = [LineNo]  FROM dbo.SalesShipmentLine WHERE CompanyCode= @CompanyCode  ORDER BY PostingDate DESC;
				SELECT  @Rows = @@ROWCOUNT 
				IF @IsBulkLoad = 1
					BEGIN
							SET @FilterExpression = @Filter +'DocumentNo gt '+''''+ @DocumentNo + ''''+' and '+'LineNo gt ' +CAST(@LineNo AS NVARCHAR(100))
					END
				
				ELSE
					BEGIN
					        IF @IsSpecificDate = 1
									BEGIN
											IF @Rows =  0 
												BEGIN
														SET @FilterExpression = @Filter + 'SystemModifiedDate gt '+ @StartFromDate
												END
											ELSE 
												BEGIN
														SET @FilterExpression = @Filter +'DocumentNo ge '+''''+ @DocumentNo + ''''+' and '+ 'SystemModifiedDate gt '+ @StartFromDate
														--SET @FilterExpression = @Filter +'DocumentNo gt '+''''+ @DocumentNo + ''''+' and '+'LineNo gt ' +CAST(@LineNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @StartFromDate
												END
											
									END
							ELSE
							        BEGIN
											SET @FilterExpression = @Filter +'DocumentNo gt '+''''+ @DocumentNo + ''''+' and '+'LineNo gt ' +CAST(@LineNo AS NVARCHAR(100))+' and '+ 'SystemModifiedDate gt '+ @NewLastUpdatedDate
									END
						
							
					END
		END

END
GO
