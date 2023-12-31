/****** Object:  Table [dbo].[PurchaseCrMemoHeader]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseCrMemoHeader](
	[No] [nvarchar](20) NOT NULL,
	[CompanyCode] [nvarchar](10) NOT NULL,
	[AppliestoDocNo] [nvarchar](100) NULL,
	[AppliestoDocType] [nvarchar](100) NULL,
	[Area] [nvarchar](100) NULL,
	[BalAccountNo] [nvarchar](100) NULL,
	[BalAccountType] [nvarchar](100) NULL,
	[BuyfromAddress] [nvarchar](100) NULL,
	[BuyfromAddress2] [nvarchar](100) NULL,
	[BuyfromCity] [nvarchar](100) NULL,
	[BuyfromContact] [nvarchar](100) NULL,
	[BuyfromContactNo] [nvarchar](100) NULL,
	[BuyfromCountryRegionCode] [nvarchar](100) NULL,
	[BuyfromCounty] [nvarchar](100) NULL,
	[BuyfromPostCode] [nvarchar](100) NULL,
	[BuyfromVendorName] [nvarchar](100) NULL,
	[BuyfromVendorName2] [nvarchar](100) NULL,
	[BuyfromVendorNo] [nvarchar](100) NULL,
	[CampaignNo] [nvarchar](100) NULL,
	[Correction] [bit] NULL,
	[CurrencyCode] [nvarchar](100) NULL,
	[CurrencyFactor] [decimal](18, 10) NULL,
	[DimensionSetID] [bigint] NULL,
	[DocumentDate] [date] NULL,
	[DueDate] [date] NULL,
	[EntryPoint] [nvarchar](100) NULL,
	[ExpectedReceiptDate] [date] NULL,
	[GenBusPostingGroup] [nvarchar](100) NULL,
	[InvoiceDiscCode] [nvarchar](100) NULL,
	[LanguageCode] [nvarchar](100) NULL,
	[LocationCode] [nvarchar](100) NULL,
	[NoPrinted] [bigint] NULL,
	[NoSeries] [nvarchar](100) NULL,
	[OnHold] [nvarchar](100) NULL,
	[OrderAddressCode] [nvarchar](100) NULL,
	[PaytoAddress] [nvarchar](100) NULL,
	[PaytoAddress2] [nvarchar](100) NULL,
	[PaytoCity] [nvarchar](100) NULL,
	[PaytoContact] [nvarchar](100) NULL,
	[PaytoContactNo] [nvarchar](100) NULL,
	[PaytoCountryRegionCode] [nvarchar](100) NULL,
	[PaytoCounty] [nvarchar](100) NULL,
	[PaytoName] [nvarchar](100) NULL,
	[PaytoName2] [nvarchar](100) NULL,
	[PaytoPostCode] [nvarchar](100) NULL,
	[PaytoVendorNo] [nvarchar](100) NULL,
	[PaymentDiscount] [decimal](18, 10) NULL,
	[PaymentMethodCode] [nvarchar](100) NULL,
	[PaymentTermsCode] [nvarchar](100) NULL,
	[PmtDiscountDate] [date] NULL,
	[PostingDate] [date] NULL,
	[PostingDescription] [nvarchar](100) NULL,
	[PreAssignedNo] [nvarchar](100) NULL,
	[PreAssignedNoSeries] [nvarchar](100) NULL,
	[PrepaymentCreditMemo] [bit] NULL,
	[PrepaymentOrderNo] [nvarchar](100) NULL,
	[PrepmtCrMemoNoSeries] [nvarchar](100) NULL,
	[PriceCalculationMethod] [nvarchar](100) NULL,
	[PricesIncludingVAT] [bit] NULL,
	[PurchaserCode] [nvarchar](100) NULL,
	[ReasonCode] [nvarchar](100) NULL,
	[ResponsibilityCenter] [nvarchar](100) NULL,
	[ReturnOrderNo] [nvarchar](100) NULL,
	[ReturnOrderNoSeries] [nvarchar](100) NULL,
	[SelltoCustomerNo] [nvarchar](100) NULL,
	[ShiptoAddress] [nvarchar](100) NULL,
	[ShiptoAddress2] [nvarchar](100) NULL,
	[ShiptoCity] [nvarchar](100) NULL,
	[ShiptoCode] [nvarchar](100) NULL,
	[ShiptoContact] [nvarchar](100) NULL,
	[ShiptoCountryRegionCode] [nvarchar](100) NULL,
	[ShiptoCounty] [nvarchar](100) NULL,
	[ShiptoName] [nvarchar](100) NULL,
	[ShiptoName2] [nvarchar](100) NULL,
	[ShiptoPostCode] [nvarchar](100) NULL,
	[ShipmentMethodCode] [nvarchar](100) NULL,
	[ShortcutDimension1Code] [nvarchar](100) NULL,
	[ShortcutDimension2Code] [nvarchar](100) NULL,
	[SourceCode] [nvarchar](100) NULL,
	[SystemCreatedAt] [nvarchar](100) NULL,
	[SystemCreatedBy] [nvarchar](100) NULL,
	[SystemId] [nvarchar](100) NULL,
	[SystemModifiedAt] [nvarchar](100) NULL,
	[SystemModifiedBy] [nvarchar](100) NULL,
	[TaxAreaCode] [nvarchar](100) NULL,
	[TaxLiable] [bit] NULL,
	[TransactionSpecification] [nvarchar](100) NULL,
	[TransactionType] [nvarchar](100) NULL,
	[TransportMethod] [nvarchar](100) NULL,
	[UserID] [nvarchar](100) NULL,
	[VATBaseDiscount] [decimal](18, 10) NULL,
	[VATBusPostingGroup] [nvarchar](100) NULL,
	[VATCountryRegionCode] [nvarchar](100) NULL,
	[VATRegistrationNo] [nvarchar](100) NULL,
	[VendorCrMemoNo] [nvarchar](100) NULL,
	[VendorLedgerEntryNo] [decimal](18, 10) NULL,
	[VendorPostingGroup] [nvarchar](100) NULL,
	[YourReference] [nvarchar](100) NULL,
	[Amount] [decimal](18, 10) NULL,
	[AmountIncludingVAT] [decimal](18, 10) NULL,
	[Cancelled] [bit] NULL,
	[Comment] [bit] NULL,
	[Corrective] [bit] NULL,
	[InvoiceDiscountAmount] [decimal](18, 10) NULL,
	[Paid] [bit] NULL,
	[RemainingAmount] [decimal](18, 10) NULL,
 CONSTRAINT [PK_PurchaseCrMemoHeader] PRIMARY KEY CLUSTERED 
(
	[No] ASC,
	[CompanyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
