
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Get_Employee]
@EmpID INT = 0
AS
	BEGIN
	
	SELECT 
	
	EmpID,
	FirstName,
	LastName,
	E.DesignationID,
	D.DesignationName AS Designation,
	Salary,
	DateOfJoin,
	Qualification,
	DateOfBirth,
	[Address],
	Country,
	[State],
	Phone,
	EmailID

	FROM Employee E
	JOIN Designation D ON E.DesignationID = D.DesignationID
	WHERE EMPID = @EmpID OR @EmpID = 0

	END
GO