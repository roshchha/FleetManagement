
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Get_Designation]
AS
	BEGIN
	
	SELECT 
	
	DesignationID,
	DesignationName

	FROM Designation

	END
GO