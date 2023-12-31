/****** Object:  UserDefinedFunction [dbo].[GetExchangeRate]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      SHEHZAD, Kamran
-- Create Date: 11/5/21
-- Description: FOR DW
-- =============================================
CREATE FUNCTION [dbo].[GetExchangeRate]
(
    -- Add the parameters for the function here
   @CompCode nvarchar(10),
   @Date date,
   @OutCurrencyCode nvarchar(4)
)
RETURNS decimal(18,6)
AS
BEGIN
    -- Declare the return variable here
    DECLARE @retVal decimal(18,6)

    -- Add the T-SQL statements to compute the return value here
    SELECT 
		@retVal = isnull(ExchangeRateAmount,1) FROM CurrencyExchangeRate
	WHERE 
		CompanyCode = @CompCode  
		AND CurrencyCode = @OutCurrencyCode
		AND MONTH (StartingDate) = MONTH(@Date) AND YEAR(StartingDate) = YEAR(@Date)


    -- Return the result of the function
    RETURN @retVal
END
GO
