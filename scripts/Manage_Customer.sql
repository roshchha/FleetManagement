SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Manage_Customer]
	@CustomerID INT = 0,
	@Name VARCHAR(100),
	@Address VARCHAR(100),
	@Phone VARCHAR(20),
	@Email VARCHAR(50),
	@Country VARCHAR(20),
	@State VARCHAR(20),
	@ObjectState INT = 0

AS
	BEGIN
		IF(@ObjectState = 1)
		BEGIN
			INSERT INTO Customer
			(
				Name,
				[Address],
				Phone,
				Email,
				Country,
				[State]
			)
			VALUES(
				@Name,
				@Address,
				@Phone,
				@Email,
				@Country,
				@State
			)
		END
		ELSE IF (@ObjectState = 2)
			BEGIN
				UPDATE Customer
				SET Name = @Name,
				[Address] = @Address,
				Phone = @Phone,
				Email = @Email,
				Country = @Country,
				[State] = @State
				WHERE ID = @CustomerID
			END
	END
GO