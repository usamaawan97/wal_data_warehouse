/****** Object:  Table [dbo].[DetailedVendorLedgerEntry]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailedVendorLedgerEntry](
	[EntryNo] [bigint] NOT NULL,
	[CompanyCode] [nvarchar](10) NOT NULL,
	[Amount] [decimal](38, 10) NULL,
	[AmountLCY] [decimal](38, 10) NULL,
	[ApplicationNo] [bigint] NULL,
	[AppliedVendLedgerEntryNo] [bigint] NULL,
	[CreditAmount] [decimal](38, 10) NULL,
	[CreditAmountLCY] [decimal](38, 10) NULL,
	[CurrencyCode] [nvarchar](100) NULL,
	[DebitAmount] [decimal](38, 10) NULL,
	[DebitAmountLCY] [decimal](38, 10) NULL,
	[DocumentNo] [nvarchar](100) NULL,
	[DocumentType] [nvarchar](100) NULL,
	[EntryType] [nvarchar](100) NULL,
	[GenBusPostingGroup] [nvarchar](100) NULL,
	[GenProdPostingGroup] [nvarchar](100) NULL,
	[InitialDocumentType] [nvarchar](100) NULL,
	[InitialEntryDueDate] [date] NULL,
	[InitialEntryGlobalDim1] [nvarchar](100) NULL,
	[InitialEntryGlobalDim2] [nvarchar](100) NULL,
	[JournalBatchName] [nvarchar](100) NULL,
	[LedgerEntryAmount] [bit] NULL,
	[MaxPaymentTolerance] [decimal](38, 10) NULL,
	[PostingDate] [date] NULL,
	[ReasonCode] [nvarchar](100) NULL,
	[RemainingPmtDiscPossible] [decimal](38, 10) NULL,
	[SourceCode] [nvarchar](100) NULL,
	[SystemCreatedAt] [nvarchar](100) NULL,
	[SystemCreatedBy] [nvarchar](100) NULL,
	[SystemId] [nvarchar](100) NULL,
	[SystemModifiedAt] [nvarchar](100) NULL,
	[SystemModifiedBy] [nvarchar](100) NULL,
	[TaxJurisdictionCode] [nvarchar](100) NULL,
	[TransactionNo] [bigint] NULL,
	[Unapplied] [bit] NULL,
	[UnappliedbyEntryNo] [bigint] NULL,
	[UseTax] [bit] NULL,
	[UserID] [nvarchar](100) NULL,
	[VATBusPostingGroup] [nvarchar](100) NULL,
	[VATProdPostingGroup] [nvarchar](100) NULL,
	[VendorLedgerEntryNo] [bigint] NULL,
	[VendorNo] [nvarchar](100) NULL,
	[SystemCreatedDate] [datetime2](7) NULL,
	[SystemModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_DetailedVendorLedgerEntry] PRIMARY KEY CLUSTERED 
(
	[EntryNo] ASC,
	[CompanyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
