/****** Object:  Table [dbo].[Customer]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[No] [nvarchar](20) NOT NULL,
	[CompanyCode] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[SearchName] [nvarchar](100) NULL,
	[Name2] [nvarchar](100) NULL,
	[Address] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[Contact] [nvarchar](100) NULL,
	[PhoneNo] [nvarchar](100) NULL,
	[ShiptoCode] [nvarchar](100) NULL,
	[OurAccountNo] [nvarchar](100) NULL,
	[TerritoryCode] [nvarchar](100) NULL,
	[GlobalDimension1Code] [nvarchar](100) NULL,
	[GlobalDimension2Code] [nvarchar](100) NULL,
	[ChainName] [nvarchar](100) NULL,
	[BudgetedAmount] [decimal](38, 10) NULL,
	[CustomerPostingGroup] [nvarchar](100) NULL,
	[CurrencyCode] [nvarchar](100) NULL,
	[CustomerPriceGroup] [nvarchar](100) NULL,
	[PaymentTermsCode] [nvarchar](100) NULL,
	[FinChargeTermsCode] [nvarchar](100) NULL,
	[SalespersonCode] [nvarchar](100) NULL,
	[ShipmentMethodCode] [nvarchar](100) NULL,
	[ShippingAgentCode] [nvarchar](100) NULL,
	[InvoiceDiscCode] [nvarchar](100) NULL,
	[CustomerDiscGroup] [nvarchar](100) NULL,
	[CountryRegionCode] [nvarchar](100) NULL,
	[CollectionMethod] [nvarchar](100) NULL,
	[Amount] [decimal](38, 10) NULL,
	[Blocked] [nvarchar](40) NULL,
	[BilltoCustomerNo] [nvarchar](100) NULL,
	[PaymentMethodCode] [nvarchar](100) NULL,
	[PricesIncludingVAT] [bit] NULL,
	[LocationCode] [nvarchar](100) NULL,
	[GenBusPostingGroup] [nvarchar](100) NULL,
	[GLN] [nvarchar](100) NULL,
	[County] [nvarchar](100) NULL,
	[EMail] [nvarchar](100) NULL,
	[TaxAreaCode] [nvarchar](100) NULL,
	[TaxLiable] [bit] NULL,
	[VATBusPostingGroup] [nvarchar](100) NULL,
	[ICPartnerCode] [nvarchar](100) NULL,
	[PartnerType] [nvarchar](40) NULL,
	[PrimaryContactNo] [nvarchar](100) NULL,
	[ContactType] [nvarchar](40) NULL,
	[ResponsibilityCenter] [nvarchar](100) NULL,
	[PostCode] [nvarchar](100) NULL,
	[CustomerGroup] [nvarchar](100) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[No] ASC,
	[CompanyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
