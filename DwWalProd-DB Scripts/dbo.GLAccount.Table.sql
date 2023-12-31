/****** Object:  Table [dbo].[GLAccount]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GLAccount](
	[No] [nvarchar](20) NOT NULL,
	[CompanyCode] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[SearchName] [nvarchar](100) NULL,
	[AccountType] [nvarchar](100) NULL,
	[GlobalDimension1Code] [nvarchar](100) NULL,
	[GlobalDimension2Code] [nvarchar](100) NULL,
	[AccountCategory] [nvarchar](100) NULL,
	[IncomeBalance] [nvarchar](100) NULL,
	[DebitCredit] [nvarchar](100) NULL,
	[No2] [nvarchar](100) NULL,
	[Blocked] [bit] NULL,
	[DirectPosting] [bit] NULL,
	[ReconciliationAccount] [bit] NULL,
	[ConsolTranslationMethod] [nvarchar](100) NULL,
	[ConsolDebitAcc] [nvarchar](100) NULL,
	[ConsolCreditAcc] [nvarchar](100) NULL,
	[GenPostingType] [nvarchar](100) NULL,
	[GenBusPostingGroup] [nvarchar](100) NULL,
	[GenProdPostingGroup] [nvarchar](100) NULL,
	[TaxAreaCode] [nvarchar](100) NULL,
	[TaxLiable] [bit] NULL,
	[TaxGroupCode] [nvarchar](100) NULL,
	[VATBusPostingGroup] [nvarchar](100) NULL,
	[VATProdPostingGroup] [nvarchar](100) NULL,
	[ExchangeRateAdjustment] [nvarchar](100) NULL,
	[DefaultICPartnerGLAccNo] [nvarchar](100) NULL,
	[AccountSubcategoryEntryNo] [bigint] NULL,
	[CostTypeNo] [nvarchar](100) NULL,
	[DefaultDeferralTemplateCode] [nvarchar](100) NULL,
	[BudgetatDate] [decimal](38, 10) NULL,
	[DebitAmount] [decimal](38, 10) NULL,
	[CreditAmount] [decimal](38, 10) NULL,
	[BudgetedDebitAmount] [decimal](38, 10) NULL,
	[BudgetedCreditAmount] [decimal](38, 10) NULL,
	[VATAmt] [decimal](38, 10) NULL,
	[AdditionalCurrencyNetChange] [decimal](38, 10) NULL,
	[AddCurrencyBalanceatDate] [decimal](38, 10) NULL,
	[AdditionalCurrencyBalance] [decimal](38, 10) NULL,
	[AddCurrencyDebitAmount] [decimal](38, 10) NULL,
	[AddCurrencyCreditAmount] [decimal](38, 10) NULL,
	[AccountSubcategoryDescript] [nvarchar](100) NULL,
 CONSTRAINT [PK_GLAccount] PRIMARY KEY CLUSTERED 
(
	[No] ASC,
	[CompanyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
