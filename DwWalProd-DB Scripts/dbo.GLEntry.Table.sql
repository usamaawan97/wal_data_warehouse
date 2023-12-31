/****** Object:  Table [dbo].[GLEntry]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GLEntry](
	[EntryNo] [bigint] NOT NULL,
	[CompanyCode] [nvarchar](10) NOT NULL,
	[GLAccountNo] [nvarchar](150) NULL,
	[PostingDate] [date] NULL,
	[DocumentType] [nvarchar](40) NULL,
	[DocumentNo] [nvarchar](150) NULL,
	[Description] [nvarchar](150) NULL,
	[BalAccountNo] [nvarchar](150) NULL,
	[Amount] [decimal](18, 0) NULL,
	[GlobalDimension1Code] [nvarchar](150) NULL,
	[GlobalDimension2Code] [nvarchar](150) NULL,
	[UserID] [nvarchar](150) NULL,
	[SourceCode] [nvarchar](150) NULL,
	[SystemCreatedEntry] [bit] NULL,
	[PriorYearEntry] [bit] NULL,
	[JobNo] [nvarchar](150) NULL,
	[Quantity] [decimal](18, 10) NULL,
	[VATAmount] [decimal](18, 10) NULL,
	[BusinessUnitCode] [nvarchar](150) NULL,
	[JournalBatchName] [nvarchar](150) NULL,
	[ReasonCode] [nvarchar](150) NULL,
	[GenPostingType] [nvarchar](40) NULL,
	[GenBusPostingGroup] [nvarchar](150) NULL,
	[GenProdPostingGroup] [nvarchar](150) NULL,
	[BalAccountType] [nvarchar](40) NULL,
	[TransactionNo] [int] NULL,
	[AddCurrencyCreditAmount] [decimal](18, 10) NULL,
	[AddCurrencyDebitAmount] [decimal](18, 10) NULL,
	[AdditionalCurrencyAmount] [decimal](18, 10) NULL,
	[CloseIncomeStatementDimID] [int] NULL,
	[CreditAmount] [decimal](18, 10) NULL,
	[DebitAmount] [decimal](18, 10) NULL,
	[DocumentDate] [date] NULL,
	[DimensionSetID] [int] NULL,
	[ExternalDocumentNo] [nvarchar](150) NULL,
	[FAEntryNo] [int] NULL,
	[FAEntryType] [nvarchar](40) NULL,
	[ICPartnerCode] [nvarchar](150) NULL,
	[LastModifiedDateTime] [datetime] NULL,
	[NoSeries] [nvarchar](150) NULL,
	[ProdOrderNo] [nvarchar](150) NULL,
	[Reversed] [bit] NULL,
	[ReversedEntryNo] [int] NULL,
	[ReversedbyEntryNo] [int] NULL,
	[SourceNo] [nvarchar](150) NULL,
	[SourceType] [nvarchar](40) NULL,
	[TaxAreaCode] [nvarchar](150) NULL,
	[TaxGroupCode] [nvarchar](150) NULL,
	[TaxLiable] [bit] NULL,
	[UseTax] [bit] NULL,
	[VATBusPostingGroup] [nvarchar](150) NULL,
	[VATProdPostingGroup] [nvarchar](150) NULL,
	[GLAccountName] [nvarchar](150) NULL,
	[SystemCreatedDate] [datetime2](7) NULL,
	[SystemModifiedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_GLEntry] PRIMARY KEY CLUSTERED 
(
	[EntryNo] ASC,
	[CompanyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [GLEntry_121321_01]    Script Date: 10/27/2022 8:34:07 AM ******/
CREATE NONCLUSTERED INDEX [GLEntry_121321_01] ON [dbo].[GLEntry]
(
	[GLAccountNo] ASC
)
INCLUDE([PostingDate],[DocumentType],[DocumentNo],[Description],[Amount],[GlobalDimension1Code],[GlobalDimension2Code],[DimensionSetID],[SourceNo]) WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
