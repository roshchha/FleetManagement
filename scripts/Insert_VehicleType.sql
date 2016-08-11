SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Insert_VehicleType]
	@Name VARCHAR(200)

	AS
		BEGIN
			INSERT INTO VehicleType
			(Name)
			Values (@Name)
		END

GO
