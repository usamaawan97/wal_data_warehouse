/****** Object:  Table [dbo].[SalesHeader]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesHeader](
	[DocumentType] [nvarchar](40) NOT NULL,
	[No] [nvarchar](20) NOT NULL,
	[CompanyCode] [nvarchar](10) NOT NULL,
	[SelltoCustomerNo] [nvarchar](100) NULL,
	[BilltoCustomerNo] [nvarchar](100) NULL,
	[BilltoName] [nvarchar](100) NULL,
	[BilltoName2] [nvarchar](100) NULL,
	[BilltoAddress] [nvarchar](100) NULL,
	[BilltoAddress2] [nvarchar](100) NULL,
	[BilltoCity] [nvarchar](100) NULL,
	[BilltoContact] [nvarchar](100) NULL,
	[YourReference] [nvarchar](100) NULL,
	[ShiptoCode] [nvarchar](100) NULL,
	[ShiptoName] [nvarchar](100) NULL,
	[ShiptoName2] [nvarchar](100) NULL,
	[ShiptoAddress] [nvarchar](100) NULL,
	[ShiptoAddress2] [nvarchar](100) NULL,
	[ShiptoCity] [nvarchar](100) NULL,
	[ShiptoContact] [nvarchar](100) NULL,
	[OrderDate] [date] NULL,
	[PostingDate] [date] NULL,
	[ShipmentDate] [date] NULL,
	[PostingDescription] [nvarchar](100) NULL,
	[PaymentTermsCode] [nvarchar](400) NULL,
	[DueDate] [date] NULL,
	[PaymentDiscount] [bigint] NULL,
	[PmtDiscountDate] [date] NULL,
	[ShipmentMethodCode] [nvarchar](400) NULL,
	[LocationCode] [nvarchar](400) NULL,
	[ShortcutDimension1Code] [nvarchar](400) NULL,
	[ShortcutDimension2Code] [nvarchar](400) NULL,
	[CustomerPostingGroup] [nvarchar](400) NULL,
	[CurrencyCode] [nvarchar](400) NULL,
	[CurrencyFactor] [decimal](18, 10) NULL,
	[CustomerPriceGroup] [nvarchar](400) NULL,
	[PricesIncludingVAT] [bit] NULL,
	[InvoiceDiscCode] [nvarchar](400) NULL,
	[CustomerDiscGroup] [nvarchar](400) NULL,
	[LanguageCode] [nvarchar](400) NULL,
	[SalespersonCode] [nvarchar](400) NULL,
	[OrderClass] [nvarchar](400) NULL,
	[NoPrinted] [bigint] NULL,
	[OnHold] [nvarchar](400) NULL,
	[AppliestoDocType] [nvarchar](400) NULL,
	[AppliestoDocNo] [nvarchar](400) NULL,
	[BalAccountNo] [nvarchar](400) NULL,
	[Ship] [bit] NULL,
	[Invoice] [bit] NULL,
	[PrintPostedDocuments] [bit] NULL,
	[VATRegistrationNo] [nvarchar](400) NULL,
	[CombineShipments] [bit] NULL,
	[ReasonCode] [nvarchar](400) NULL,
	[GenBusPostingGroup] [nvarchar](400) NULL,
	[EU3PartyTrade] [bit] NULL,
	[TransactionType] [nvarchar](400) NULL,
	[TransportMethod] [nvarchar](400) NULL,
	[VATCountryRegionCode] [nvarchar](400) NULL,
	[SelltoCustomerName] [nvarchar](400) NULL,
	[SelltoCustomerName2] [nvarchar](400) NULL,
	[SelltoAddress] [nvarchar](400) NULL,
	[SelltoAddress2] [nvarchar](400) NULL,
	[SelltoCity] [nvarchar](400) NULL,
	[SelltoContact] [nvarchar](400) NULL,
	[BilltoPostCode] [nvarchar](400) NULL,
	[BilltoCounty] [nvarchar](400) NULL,
	[BilltoCountryRegionCode] [nvarchar](400) NULL,
	[LastPrepmtCrMemoNo] [nvarchar](400) NULL,
	[SelltoPostCode] [nvarchar](400) NULL,
	[SelltoCounty] [nvarchar](400) NULL,
	[SelltoCountryRegionCode] [nvarchar](400) NULL,
	[ShiptoPostCode] [nvarchar](400) NULL,
	[ShiptoCounty] [nvarchar](400) NULL,
	[ShiptoCountryRegionCode] [nvarchar](400) NULL,
	[BalAccountType] [nvarchar](400) NULL,
	[ExitPoint] [nvarchar](400) NULL,
	[Correction] [bit] NULL,
	[DocumentDate] [date] NULL,
	[ExternalDocumentNo] [nvarchar](400) NULL,
	[Area] [nvarchar](400) NULL,
	[TransactionSpecification] [nvarchar](400) NULL,
	[PaymentMethodCode] [nvarchar](400) NULL,
	[ShippingAgentCode] [nvarchar](400) NULL,
	[PackageTrackingNo] [nvarchar](400) NULL,
	[NoSeries] [nvarchar](400) NULL,
	[PostingNoSeries] [nvarchar](400) NULL,
	[ShippingNoSeries] [nvarchar](400) NULL,
	[TaxAreaCode] [nvarchar](400) NULL,
	[TaxLiable] [bit] NULL,
	[VATBusPostingGroup] [nvarchar](400) NULL,
	[Reserve] [nvarchar](400) NULL,
	[AppliestoID] [nvarchar](400) NULL,
	[VATBaseDiscount] [bigint] NULL,
	[Status] [nvarchar](400) NULL,
	[InvoiceDiscountCalculation] [nvarchar](400) NULL,
	[InvoiceDiscountValue] [bigint] NULL,
	[SendICDocument] [bit] NULL,
	[ICStatus] [nvarchar](400) NULL,
	[SelltoICPartnerCode] [nvarchar](400) NULL,
	[BilltoICPartnerCode] [nvarchar](400) NULL,
	[ICDirection] [nvarchar](400) NULL,
	[Prepayment] [bigint] NULL,
	[PrepaymentNoSeries] [nvarchar](400) NULL,
	[CompressPrepayment] [bit] NULL,
	[PrepaymentDueDate] [date] NULL,
	[PrepmtCrMemoNoSeries] [nvarchar](400) NULL,
	[PrepmtPostingDescription] [nvarchar](400) NULL,
	[PrepmtPmtDiscountDate] [date] NULL,
	[PrepmtPaymentTermsCode] [nvarchar](400) NULL,
	[PrepmtPaymentDiscount] [bigint] NULL,
	[QuoteNo] [nvarchar](400) NULL,
	[QuoteValidUntilDate] [date] NULL,
	[QuoteSenttoCustomer] [nvarchar](400) NULL,
	[QuoteAccepted] [bit] NULL,
	[QuoteAcceptedDate] [date] NULL,
	[JobQueueStatus] [nvarchar](400) NULL,
	[JobQueueEntryID] [nvarchar](400) NULL,
	[IncomingDocumentEntryNo] [bigint] NULL,
	[IsTest] [bit] NULL,
	[SelltoPhoneNo] [nvarchar](400) NULL,
	[SelltoEMail] [nvarchar](400) NULL,
	[WorkDescription@odata.mediaReadLink] [nvarchar](400) NULL,
	[DimensionSetID] [bigint] NULL,
	[PaymentServiceSetID] [bigint] NULL,
	[DirectDebitMandateID] [nvarchar](400) NULL,
	[DocNoOccurrence] [bigint] NULL,
	[CampaignNo] [nvarchar](400) NULL,
	[SelltoContactNo] [nvarchar](400) NULL,
	[BilltoContactNo] [nvarchar](400) NULL,
	[OpportunityNo] [nvarchar](400) NULL,
	[SelltoCustomerTemplCode] [nvarchar](400) NULL,
	[BilltoCustomerTemplCode] [nvarchar](400) NULL,
	[ResponsibilityCenter] [nvarchar](400) NULL,
	[ShippingAdvice] [nvarchar](400) NULL,
	[PostingfromWhseRef] [bigint] NULL,
	[RequestedDeliveryDate] [date] NULL,
	[PromisedDeliveryDate] [date] NULL,
	[ShippingTime] [nvarchar](400) NULL,
	[OutboundWhseHandlingTime] [nvarchar](400) NULL,
	[ShippingAgentServiceCode] [nvarchar](400) NULL,
	[Receive] [bit] NULL,
	[ReturnReceiptNo] [nvarchar](400) NULL,
	[ReturnReceiptNoSeries] [nvarchar](400) NULL,
	[LastReturnReceiptNo] [nvarchar](400) NULL,
	[AllowLineDisc] [bit] NULL,
	[GetShipmentUsed] [bit] NULL,
	[Comment] [bit] NULL,
	[RecalculateInvoiceDisc] [bit] NULL,
	[Amount] [decimal](18, 10) NULL,
	[AmountIncludingVAT] [decimal](18, 10) NULL,
	[LastEmailSentTime] [nvarchar](400) NULL,
	[SentasEmail] [bit] NULL,
	[AmtShipNotInvLCY] [decimal](18, 10) NULL,
	[AmtShipNotInvLCYBase] [decimal](18, 10) NULL,
	[InvoiceDiscountAmount] [bigint] NULL,
	[NoofArchivedVersions] [bigint] NULL,
	[ShippedNotInvoiced] [bit] NULL,
	[CompletelyShipped] [bit] NULL,
	[Shipped] [bit] NULL,
	[LastShipmentDate] [date] NULL,
	[LateOrderShipping] [bit] NULL,
 CONSTRAINT [PK_SalesHeader] PRIMARY KEY CLUSTERED 
(
	[DocumentType] ASC,
	[No] ASC,
	[CompanyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
