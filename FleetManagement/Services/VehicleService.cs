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
    public class VehicleService : IEntityService<Vehicle>
    {
        /// <summary>
        /// 
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

            return vehicle;
        }
    }
}