/****** Object:  View [dbo].[Brand List]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE View [dbo].[Brand List]
as 
	SELECT DISTINCT
		DimensionValueCode as [Brand Code]
	FROM 
		DimensionSetEntry
	WHERE 
		DimensionCode = 'BRAND' AND DimensionValueCode <> 'BRAND CODE'
GO
