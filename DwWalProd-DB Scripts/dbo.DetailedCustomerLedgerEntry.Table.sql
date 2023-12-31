/****** Object:  Table [dbo].[DetailedCustomerLedgerEntry]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailedCustomerLedgerEntry](
	[EntryNo] [bigint] NOT NULL,
	[CompanyCode] [nvarchar](10) NOT NULL,
	[Amount] [decimal](18, 10) NULL,
	[AmountLCY] [decimal](18, 10) NULL,
	[ApplicationNo] [bigint] NULL,
	[AppliedCustLedgerEntryNo] [bigint] NULL,
	[CreditAmount] [decimal](18, 10) NULL,
	[CreditAmountLCY] [decimal](18, 10) NULL,
	[CurrencyCode] [nvarchar](150) NULL,
	[CustLedgerEntryNo] [bigint] NULL,
	[CustomerNo] [nvarchar](150) NULL,
	[DebitAmount] [decimal](18, 10) NULL,
	[DebitAmountLCY] [decimal](18, 10) NULL,
	[DocumentNo] [nvarchar](150) NULL,
	[DocumentType] [nvarchar](150) NULL,
	[EntryType] [nvarchar](150) NULL,
	[GenBusPostingGroup] [nvarchar](150) NULL,
	[GenProdPostingGroup] [nvarchar](150) NULL,
	[InitialDocumentType] [nvarchar](150) NULL,
	[InitialEntryDueDate] [date] NULL,
	[InitialEntryGlobalDim1] [nvarchar](150) NULL,
	[InitialEntryGlobalDim2] [nvarchar](150) NULL,
	[JournalBatchName] [nvarchar](150) NULL,
	[LedgerEntryAmount] [bit] NULL,
	[MaxPaymentTolerance] [decimal](18, 10) NULL,
	[PostingDate] [date] NULL,
	[ReasonCode] [nvarchar](150) NULL,
	[RemainingPmtDiscPossible] [decimal](18, 10) NULL,
	[SourceCode] [nvarchar](150) NULL,
	[SystemCreatedAt] [nvarchar](150) NULL,
	[SystemCreatedBy] [nvarchar](150) NULL,
	[SystemId] [nvarchar](150) NULL,
	[SystemModifiedAt] [nvarchar](150) NULL,
	[SystemModifiedBy] [nvarchar](150) NULL,
	[TaxJurisdictionCode] [nvarchar](150) NULL,
	[TransactionNo] [bigint] NULL,
	[Unapplied] [bit] NULL,
	[UnappliedbyEntryNo] [bigint] NULL,
	[UseTax] [bit] NULL,
	[UserID] [nvarchar](150) NULL,
	[VATBusPostingGroup] [nvarchar](150) NULL,
	[VATProdPostingGroup] [nvarchar](150) NULL,
	[SystemCreatedDate] [datetime2](7) NULL,
	[SystemModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_DetailedCustomerLedgerEntry] PRIMARY KEY CLUSTERED 
(
	[EntryNo] ASC,
	[CompanyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
