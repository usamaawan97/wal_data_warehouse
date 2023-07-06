/****** Object:  StoredProcedure [dbo].[Modify_Last_Updated_Date]    Script Date: 10/27/2022 8:34:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:      Usama Awan
-- Create Date: 01-Oct-2021
-- Description: Created to update company code field in every table
-- =============================================

-- EXEC [Modify_Last_Updated_Date]

CREATE PROCEDURE [dbo].[Modify_Last_Updated_Date]

AS
BEGIN
    SET NOCOUNT ON;
	UPDATE dbo.DW_Interface_Setup
	SET LastUpadted = GETDATE();



END
GO
