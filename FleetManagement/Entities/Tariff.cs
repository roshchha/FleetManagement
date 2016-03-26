using FleetManagement.Common;
using FleetManagement.Enums;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FleetManagement.Entities
{
    public class Tariff : BaseEntity
    {
        public int TariffID { get; set; }

        public string TariffCode { get; set; }

        public int VehicleType { get; set; }

        public bool? AC { get; set; }

        public int? FuelType { get; set; }

        public decimal BasePrice { get; set; }

        public int Kms { get; set; }

        public decimal ExtraKmRate { get; set; }

        public decimal ExtraHourRate { get; set; }

        public decimal StandCharges { get; set; }

        public bool Manage()
        {
            int success = 0;
            if (ObjState == ObjectState.DELETE)
            {
                success = SqlHelper.ExecuteNonQuery("Delete_Tariff", getSqlParameters().ToArray());
            }
            else
            {
                success = SqlHelper.ExecuteNonQuery("Manage_Tariff", getSqlParameters().ToArray());
            }
            return success > -1;
        }
        private List<SqlParameter> getSqlParameters()
        {
            List<SqlParameter> sqlParamList = new List<SqlParameter>();

            if (ObjState == ObjectState.DELETE)
            {
                sqlParamList.Add(new SqlParameter("TariffID", TariffID));
            }
            else
            {
                sqlParamList.Add(new SqlParameter("TariffID", TariffID));
                sqlParamList.Add(new SqlParameter("VehicleType", VehicleType));
                sqlParamList.Add(new SqlParameter("AC", AC));
                sqlParamList.Add(new SqlParameter("FuelType", FuelType));
                sqlParamList.Add(new SqlParameter("BasePrice", BasePrice));
                sqlParamList.Add(new SqlParameter("Kms", Kms));
                sqlParamList.Add(new SqlParameter("ExtraKmRate", ExtraKmRate));
                sqlParamList.Add(new SqlParameter("ExtraHourRate", ExtraHourRate));
                sqlParamList.Add(new SqlParameter("StandCharges", StandCharges));
                
                sqlParamList.Add(new SqlParameter("ObjectState", this.ObjState));

            }
            return sqlParamList;

        }
        public bool Validate()
        {
            if (this.TariffID <= 0)
            {
                return false;
            }
            return true;
        }

    }

}