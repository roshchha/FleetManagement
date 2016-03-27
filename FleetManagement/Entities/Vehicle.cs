using FleetManagement.Common;
using FleetManagement.Enums;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FleetManagement.Entities
{
    public class Vehicle :BaseEntity
    {
        public int VehicleID { get; set; }

        public string RegistrationNo { get; set; }
        public string VehicleNo { get; set; }
        public int VehicleType { get; set; }

        public DateTime RegistrationDate { get; set; }

        public string EngineNo { get; set; }

        public string ChasisNo { get; set; }

        public int FuelType { get; set; }

        public int TankCapacity { get; set; }

        public int NoOfSeating { get; set; }

        public bool AC { get; set; }

        public decimal VehicleCost { get; set; }

        public DateTime PurchaseDate { get; set; }

        public decimal? InsuranceAmount { get; set; }

        public DateTime? InsuranceExpirationDate { get; set; }

        //non-table properties
        public string VehicleTypeName { get; set; }

        public string FuelTypeName
        {
            get
            {
                if (FuelType != (int)Enums.FuelType.Select)
                {
                    return ((Enums.FuelType)this.FuelType).ToString();
                }
                return "Not Specified";
            }
        }
        public bool Manage()
        {
            int success = 0;
            if (ObjState == Enums.ObjectState.DELETE)
            {
                   success = SqlHelper.ExecuteNonQuery("Delete_Vehicle", getSqlParameters().ToArray());
            }
            else
            {
                success = SqlHelper.ExecuteNonQuery("Manage_Vehicle", getSqlParameters().ToArray());
            }
            return success > -1;
        }
        private List<SqlParameter> getSqlParameters()
        {
            List<SqlParameter> sqlParamList = new List<SqlParameter>();

            if (ObjState == ObjectState.DELETE)
            {
                sqlParamList.Add(new SqlParameter("VehicleID", VehicleID));
            }
            else
            {
                sqlParamList.Add(new SqlParameter("VehicleID", VehicleID));
                sqlParamList.Add(new SqlParameter("RegistrationNo", RegistrationNo));
                sqlParamList.Add(new SqlParameter("VehicleType", VehicleType));
                sqlParamList.Add(new SqlParameter("RegistrationDate", RegistrationDate));
                sqlParamList.Add(new SqlParameter("EngineNo", EngineNo));
                sqlParamList.Add(new SqlParameter("ChasisNo", ChasisNo));
                sqlParamList.Add(new SqlParameter("FuelType", FuelType));
                sqlParamList.Add(new SqlParameter("TankCapacity", TankCapacity));
                sqlParamList.Add(new SqlParameter("NoOfSeating", NoOfSeating));
                sqlParamList.Add(new SqlParameter("AC", AC));
                sqlParamList.Add(new SqlParameter("VehicleCost", VehicleCost));
                sqlParamList.Add(new SqlParameter("PurchaseDate", PurchaseDate));
                sqlParamList.Add(new SqlParameter("InsuranceAmount", InsuranceAmount));
                sqlParamList.Add(new SqlParameter("InsuranceExpirationDate", InsuranceExpirationDate));
                sqlParamList.Add(new SqlParameter("VehicleNo", VehicleNo));
                sqlParamList.Add(new SqlParameter("ObjectState", this.ObjState));

            }
            return sqlParamList;

        }
        public bool Validate()
        {
            if (this.VehicleID <= 0)
            {
                return false;
            }
            return true;
        } 

    }


   
}