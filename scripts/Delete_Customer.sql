SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Delete_Customer]
	@CustomerID INT 

	AS
		BEGIN
		DELETE FROM Customer
		WHERE ID=@CustomerID
		END
	GO