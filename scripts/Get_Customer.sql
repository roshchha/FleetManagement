SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_Customer]
	@CustomerID INT = 0

AS
	BEGIN
		SELECT
		ID,
		Name,
		[Address],
		Phone,
		Email,
		Country,
		[State]
		FROM Customer
		WHERE ID = @CustomerID OR @CustomerID = 0
	END
GO