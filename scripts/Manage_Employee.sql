USE [FleetManagement]
GO
/****** Object:  StoredProcedure [dbo].[Insert_Employee]    Script Date: 24-03-2016 07:58:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Manage_Employee]
	@EmpID INT = 0,
	@FirstName VARCHAR(50),
	@LastName VARCHAR(50),
	@DesignationID INT,
	@Salary MONEY,
	@DateOfJoin DATETIME,
	@Qualification VARCHAR(50),
	@DateOfBirth DATETIME,
	@Address VARCHAR(100),
	@Country VARCHAR(50),
	@State VARCHAR(50),
	@Phone VARCHAR(20),
	@EmailID VARCHAR(50),
	@ObjectState INT = 0

AS
	BEGIN
		IF (@ObjectState = 1)
			BEGIN
			INSERT INTO Employee
			(FirstName, 
			LastName, 
			DesignationID, 
			Salary, 
			DateOfJoin, 
			Qualification, 
			DateOfBirth, 
			[Address], 
			Country, 
			[State], 
			Phone, 
			EmailID)

			VALUES(
			@FirstName,
			@LastName,
			@DesignationID,
			@Salary,
			@DateOfJoin,
			@Qualification,
			@DateOfBirth,
			@Address,
			@Country,
			@State,
			@Phone,
			@EmailID
			)
			END
		ELSE IF (@ObjectState = 2)
			BEGIN
			
			UPDATE Employee
			SET FirstName = @FirstName, 
			LastName = @LastName, 
			DesignationID = @DesignationID , 
			Salary = @Salary, 
			DateOfJoin = @DateOfJoin, 
			Qualification = @Qualification, 
			DateOfBirth = @DateOfBirth, 
			[Address] = @Address, 
			Country = @Country, 
			[State] = @State, 
			Phone = @Phone, 
			EmailID = @EmailID 
			WHERE EmpID = @EmpID
			
			END
	END
	
GO