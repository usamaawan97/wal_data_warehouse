/****** Object:  Table [dbo].[PurchaseReceiptLine]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseReceiptLine](
	[DocumentNo] [nvarchar](20) NOT NULL,
	[LineNo] [bigint] NOT NULL,
	[CompanyCode] [nvarchar](10) NOT NULL,
	[DocumentId] [nvarchar](100) NOT NULL,
	[AllowInvoiceDisc] [bit] NULL,
	[AppltoItemEntry] [bigint] NULL,
	[Area] [nvarchar](100) NULL,
	[AttachedtoLineNo] [bigint] NULL,
	[BinCode] [nvarchar](100) NULL,
	[BlanketOrderLineNo] [bigint] NULL,
	[BlanketOrderNo] [nvarchar](100) NULL,
	[BudgetedFANo] [nvarchar](100) NULL,
	[BuyfromVendorNo] [nvarchar](100) NULL,
	[Correction] [bit] NULL,
	[CrossReferenceNo] [nvarchar](100) NULL,
	[CrossReferenceType] [nvarchar](100) NULL,
	[CrossReferenceTypeNo] [nvarchar](100) NULL,
	[DeprAcquisitionCost] [bit] NULL,
	[DepruntilFAPostingDate] [bit] NULL,
	[DepreciationBookCode] [nvarchar](100) NULL,
	[Description] [nvarchar](100) NULL,
	[Description2] [nvarchar](100) NULL,
	[DimensionSetID] [bigint] NULL,
	[DirectUnitCost] [decimal](18, 10) NULL,
	[DuplicateinDepreciationBook] [nvarchar](100) NULL,
	[EntryPoint] [nvarchar](100) NULL,
	[ExpectedReceiptDate] [date] NULL,
	[FAPostingDate] [date] NULL,
	[FAPostingType] [nvarchar](100) NULL,
	[GenBusPostingGroup] [nvarchar](100) NULL,
	[GenProdPostingGroup] [nvarchar](100) NULL,
	[GrossWeight] [decimal](18, 10) NULL,
	[ICItemReferenceNo] [nvarchar](100) NULL,
	[ICPartnerRefType] [nvarchar](100) NULL,
	[ICPartnerReference] [nvarchar](100) NULL,
	[InboundWhseHandlingTime] [nvarchar](100) NULL,
	[IndirectCost] [decimal](18, 10) NULL,
	[InsuranceNo] [nvarchar](100) NULL,
	[ItemCategoryCode] [nvarchar](100) NULL,
	[ItemChargeBaseAmount] [decimal](18, 10) NULL,
	[ItemRcptEntryNo] [bigint] NULL,
	[ItemReferenceNo] [nvarchar](100) NULL,
	[ItemReferenceType] [nvarchar](100) NULL,
	[ItemReferenceTypeNo] [nvarchar](100) NULL,
	[ItemReferenceUnitofMeasure] [nvarchar](100) NULL,
	[JobCurrencyCode] [nvarchar](100) NULL,
	[JobCurrencyFactor] [decimal](18, 10) NULL,
	[JobLineAmount] [decimal](18, 10) NULL,
	[JobLineAmountLCY] [decimal](18, 10) NULL,
	[JobLineDiscAmountLCY] [decimal](18, 10) NULL,
	[JobLineDiscount] [decimal](18, 10) NULL,
	[JobLineDiscountAmount] [decimal](18, 10) NULL,
	[JobLineType] [nvarchar](100) NULL,
	[JobNo] [nvarchar](100) NULL,
	[JobTaskNo] [nvarchar](100) NULL,
	[JobTotalPrice] [decimal](18, 10) NULL,
	[JobTotalPriceLCY] [decimal](18, 10) NULL,
	[JobUnitPrice] [decimal](18, 10) NULL,
	[JobUnitPriceLCY] [decimal](18, 10) NULL,
	[LeadTimeCalculation] [nvarchar](100) NULL,
	[LineDiscount] [decimal](18, 10) NULL,
	[LocationCode] [nvarchar](100) NULL,
	[MaintenanceCode] [nvarchar](100) NULL,
	[NetWeight] [decimal](18, 10) NULL,
	[No] [nvarchar](100) NULL,
	[Nonstock] [bit] NULL,
	[OperationNo] [nvarchar](100) NULL,
	[OrderDate] [date] NULL,
	[OrderLineNo] [bigint] NULL,
	[OrderNo] [nvarchar](100) NULL,
	[OverReceiptCode] [nvarchar](100) NULL,
	[OverReceiptCode2] [nvarchar](100) NULL,
	[OverReceiptQuantity] [decimal](18, 10) NULL,
	[OverheadRate] [decimal](18, 10) NULL,
	[PaytoVendorNo] [nvarchar](100) NULL,
	[PlannedReceiptDate] [date] NULL,
	[PostingDate] [date] NULL,
	[PostingGroup] [nvarchar](100) NULL,
	[ProdOrderLineNo] [bigint] NULL,
	[ProdOrderNo] [nvarchar](100) NULL,
	[PromisedReceiptDate] [date] NULL,
	[PurchasingCode] [nvarchar](100) NULL,
	[QtyInvoicedBase] [decimal](18, 10) NULL,
	[QtyRcdNotInvoiced] [decimal](18, 10) NULL,
	[QtyperUnitofMeasure] [decimal](18, 10) NULL,
	[Quantity] [decimal](18, 10) NULL,
	[QuantityBase] [decimal](18, 10) NULL,
	[QuantityInvoiced] [decimal](18, 10) NULL,
	[RequestedReceiptDate] [date] NULL,
	[ResponsibilityCenter] [nvarchar](100) NULL,
	[ReturnReasonCode] [nvarchar](100) NULL,
	[RoutingNo] [nvarchar](100) NULL,
	[RoutingReferenceNo] [bigint] NULL,
	[SalesOrderLineNo] [bigint] NULL,
	[SalesOrderNo] [nvarchar](100) NULL,
	[SalvageValue] [decimal](18, 10) NULL,
	[ShortcutDimension1Code] [nvarchar](100) NULL,
	[ShortcutDimension2Code] [nvarchar](100) NULL,
	[SpecialOrderSalesLineNo] [bigint] NULL,
	[SpecialOrderSalesNo] [nvarchar](100) NULL,
	[SystemCreatedAt] [nvarchar](100) NULL,
	[SystemCreatedBy] [nvarchar](100) NULL,
	[SystemId] [nvarchar](100) NULL,
	[SystemModifiedAt] [nvarchar](100) NULL,
	[SystemModifiedBy] [nvarchar](100) NULL,
	[TaxAreaCode] [nvarchar](100) NULL,
	[TaxGroupCode] [nvarchar](100) NULL,
	[TaxLiable] [bit] NULL,
	[TransactionSpecification] [nvarchar](100) NULL,
	[TransactionType] [nvarchar](100) NULL,
	[TransportMethod] [nvarchar](100) NULL,
	[Type] [nvarchar](100) NULL,
	[UnitCost] [decimal](18, 10) NULL,
	[UnitCostLCY] [decimal](18, 10) NULL,
	[UnitPriceLCY] [decimal](18, 10) NULL,
	[UnitVolume] [decimal](18, 10) NULL,
	[UnitofMeasure] [nvarchar](100) NULL,
	[UnitofMeasureCrossRef] [nvarchar](100) NULL,
	[UnitofMeasureCode] [nvarchar](100) NULL,
	[UnitsperParcel] [decimal](18, 10) NULL,
	[UseDuplicationList] [bit] NULL,
	[UseTax] [bit] NULL,
	[VAT] [decimal](18, 10) NULL,
	[VATBaseAmount] [decimal](18, 10) NULL,
	[VATBusPostingGroup] [nvarchar](100) NULL,
	[VATCalculationType] [nvarchar](100) NULL,
	[VATProdPostingGroup] [nvarchar](100) NULL,
	[VariantCode] [nvarchar](100) NULL,
	[VendorItemNo] [nvarchar](100) NULL,
	[WorkCenterNo] [nvarchar](100) NULL,
	[CurrencyCode] [nvarchar](100) NULL,
	[SystemCreatedDate] [datetime2](7) NULL,
	[SystemModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_PurchaseReceiptLine] PRIMARY KEY CLUSTERED 
(
	[DocumentNo] ASC,
	[LineNo] ASC,
	[CompanyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
