/****** Object:  Table [dbo].[CustLedgerEntry]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustLedgerEntry](
	[EntryNo] [bigint] NOT NULL,
	[CompanyCode] [nvarchar](10) NOT NULL,
	[Vendor] [int] NULL,
	[CustomerNo] [nvarchar](150) NULL,
	[PostingDate] [date] NULL,
	[DocumentType] [nvarchar](40) NULL,
	[DocumentNo] [nvarchar](150) NULL,
	[Description] [nvarchar](150) NULL,
	[CustomerName] [nvarchar](150) NULL,
	[CurrencyCode] [nvarchar](150) NULL,
	[SalesLCY] [decimal](38, 10) NULL,
	[ProfitLCY] [decimal](38, 10) NULL,
	[InvDiscountLCY] [decimal](38, 10) NULL,
	[SelltoCustomerNo] [nvarchar](150) NULL,
	[CustomerPostingGroup] [nvarchar](150) NULL,
	[GlobalDimension1Code] [nvarchar](150) NULL,
	[GlobalDimension2Code] [nvarchar](150) NULL,
	[SalespersonCode] [nvarchar](150) NULL,
	[UserID] [nvarchar](150) NULL,
	[SourceCode] [nvarchar](150) NULL,
	[AppliestoDocType] [nvarchar](40) NULL,
	[AppliestoDocNo] [nvarchar](150) NULL,
	[Open] [bit] NULL,
	[DueDate] [date] NULL,
	[PmtDiscountDate] [date] NULL,
	[OriginalPmtDiscPossible] [decimal](38, 10) NULL,
	[PmtDiscGivenLCY] [decimal](38, 10) NULL,
	[Positive] [bit] NULL,
	[ClosedbyEntryNo] [int] NULL,
	[ClosedatDate] [date] NULL,
	[ClosedbyAmount] [decimal](38, 10) NULL,
	[AppliestoID] [nvarchar](150) NULL,
	[JournalBatchName] [nvarchar](150) NULL,
	[ReasonCode] [nvarchar](150) NULL,
	[BalAccountType] [nvarchar](40) NULL,
	[BalAccountNo] [nvarchar](150) NULL,
	[TransactionNo] [int] NULL,
	[ClosedbyAmountLCY] [decimal](38, 10) NULL,
	[DocumentDate] [date] NULL,
	[ExternalDocumentNo] [nvarchar](150) NULL,
	[CalculateInterest] [bit] NULL,
	[ClosingInterestCalculated] [bit] NULL,
	[NoSeries] [nvarchar](150) NULL,
	[ClosedbyCurrencyCode] [nvarchar](150) NULL,
	[ClosedbyCurrencyAmount] [decimal](38, 10) NULL,
	[AdjustedCurrencyFactor] [decimal](38, 10) NULL,
	[OriginalCurrencyFactor] [decimal](38, 10) NULL,
	[RemainingPmtDiscPossible] [decimal](38, 10) NULL,
	[PmtDiscToleranceDate] [date] NULL,
	[MaxPaymentTolerance] [decimal](38, 10) NULL,
	[LastIssuedReminderLevel] [decimal](38, 10) NULL,
	[AcceptedPaymentTolerance] [decimal](38, 10) NULL,
	[AcceptedPmtDiscTolerance] [bit] NULL,
	[PmtToleranceLCY] [decimal](38, 10) NULL,
	[AmounttoApply] [decimal](38, 10) NULL,
	[ICPartnerCode] [nvarchar](150) NULL,
	[ApplyingEntry] [bit] NULL,
	[Reversed] [bit] NULL,
	[ReversedbyEntryNo] [int] NULL,
	[ReversedEntryNo] [int] NULL,
	[Prepayment] [bit] NULL,
	[PaymentMethodCode] [nvarchar](150) NULL,
	[AppliestoExtDocNo] [nvarchar](150) NULL,
	[DimensionSetID] [int] NULL,
	[Amount] [decimal](38, 10) NULL,
	[RemainingAmount] [decimal](38, 10) NULL,
	[OriginalAmtLCY] [decimal](38, 10) NULL,
	[RemainingAmtLCY] [decimal](38, 10) NULL,
	[AmountLCY] [decimal](38, 10) NULL,
	[DebitAmount] [decimal](38, 10) NULL,
	[CreditAmount] [decimal](38, 10) NULL,
	[DebitAmountLCY] [decimal](38, 10) NULL,
	[CreditAmountLCY] [decimal](38, 10) NULL,
	[OriginalAmount] [decimal](38, 10) NULL,
	[SystemCreatedDate] [datetime2](7) NULL,
	[SystemModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_CustLedgerEntry] PRIMARY KEY CLUSTERED 
(
	[EntryNo] ASC,
	[CompanyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
