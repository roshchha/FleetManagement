using FleetManagement.Common;
using FleetManagement.Entities;
using FleetManagement.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FleetManagement.Services
{
    public class VehicleService : IEntityService<Vehicle>, IVehicleService
    {
        /// <summary>
        /// Get vehicles
        /// </summary>
        /// <param name="ID">Registration No</param>
        /// <returns></returns>
        public List<Vehicle> Get(int ID = 0)
        {
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            if (ID > 0) {
                sqlParams.Add(new SqlParameter("VehicleID", ID));
            }
            DataSet ds = SqlHelper.ExecuteDataset("Get_Vehicles", sqlParams.ToArray());
            if (ds.ValidDataSet())
            {
                List<Vehicle> vehicles = new List<Vehicle>();
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                   
                    vehicles.Add(Fill(row));
                }
                return vehicles;
            }
            return new List<Vehicle>();
        }

        public bool Insert(Vehicle obj)
        {
            obj.ObjState = Enums.ObjectState.INSERT;
            return obj.Manage();
        }

        public bool Update(Vehicle obj)
        {
            obj.ObjState = Enums.ObjectState.UPDATE;
            return obj.Manage();

        }

        public bool Delete(int ID)
        {
            Vehicle obj = new Vehicle();
            obj.ObjState = Enums.ObjectState.DELETE;
            obj.VehicleID = ID;
            return obj.Manage();
        }

        /// <summary>
        /// Get vehicle availability status and top available vehicle id
        /// </summary>
        /// <param name="vehicleType"></param>
        /// <param name="fuelType"></param>
        /// <param name="ac"></param>
        /// <param name="fromDate"></param>
        /// <param name="toDate"></param>
        /// <param name="vehicleID"></param>
        /// <returns></returns>
        public Enums.VehicleAvailabilityStatus ChooseVehicleForAllocation(int vehicleType, int fuelType, bool ac,bool driverNeeded, DateTime fromDate, DateTime toDate, out int vehicleID, out int? empId, out int tariffID)
        {
            Enums.VehicleAvailabilityStatus vehicleAvailStatus = Enums.VehicleAvailabilityStatus.NONE;
            vehicleID = 0; empId = null; tariffID = 0;
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("VehicleType", vehicleType));
            sqlParams.Add(new SqlParameter("FuelType", fuelType));
            sqlParams.Add(new SqlParameter("AC", ac));
            sqlParams.Add(new SqlParameter("FromDate", fromDate));
            sqlParams.Add(new SqlParameter("ToDate", toDate));
            sqlParams.Add(new SqlParameter("DriverNeeded", driverNeeded));

            DataSet ds = SqlHelper.ExecuteDataset("ChooseVehicleForAllocation", sqlParams.ToArray());
            if (ds.ValidDataSet())
            {
                int status = ds.Tables[0].Rows[0].GetIntValue("VehicleAvailStatus");
                vehicleAvailStatus = (Enums.VehicleAvailabilityStatus)status;
                if (vehicleAvailStatus == Enums.VehicleAvailabilityStatus.Available)
                {
                    vehicleID = ds.Tables[0].Rows[0].GetIntValue("VehicleID");
                    tariffID = ds.Tables[0].Rows[0].GetIntValue("TariffID");
                    if (driverNeeded)
                    {
                        empId = ds.Tables[0].Rows[0].GetIntValue("EmpID");
                    }
                    else
                    {
                        empId = null;
                    }

                }
              
            }
            return vehicleAvailStatus;
        }
        public Vehicle Fill(System.Data.DataRow item)
        {
            Vehicle vehicle = new Vehicle();
            vehicle.VehicleID = item.GetIntValue("VehicleID");
            vehicle.RegistrationDate = item.GetDateTimeValue("RegistrationDate");
            vehicle.PurchaseDate = item.GetDateTimeValue("PurchaseDate");
            vehicle.RegistrationNo = item.GetValue("RegistrationNo");
            vehicle.NoOfSeating = item.GetIntValue("NoOfSeating");
            vehicle.InsuranceAmount = item.GetDecimalValue("InsuranceAmount");
            vehicle.InsuranceExpirationDate = item.GetDateTimeValue("InsuranceExpirationDate");
            vehicle.AC = item.GetBoolValue("AC");
            vehicle.ChasisNo = item.GetValue("ChasisNo");
            vehicle.EngineNo = item.GetValue("EngineNo");
            vehicle.FuelType = item.GetIntValue("FuelType");
            vehicle.VehicleCost = Math.Ceiling(item.GetDecimalValue("VehicleCost") ?? 0);
            vehicle.VehicleType = item.GetIntValue("VehicleType");
            vehicle.VehicleTypeName = item.GetValue("VehicleTypeName");
            vehicle.TankCapacity = item.GetIntValue("TankCapacity");
            vehicle.VehicleNo = item.GetValue("VehicleNo");

            return vehicle;
        }
    }
}