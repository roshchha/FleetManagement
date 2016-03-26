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
    public class TariffService : IEntityService<Tariff>
    {
        public List<Tariff> Get(int ID = 0)
        {
            List<SqlParameter> sqlParamList = new List<SqlParameter>();
            if (ID > 0)
            {
                sqlParamList.Add(new SqlParameter("TariffID", ID));
            }
            DataSet ds = SqlHelper.ExecuteDataset("Get_Tariff", sqlParamList.ToArray());
            if (ds.ValidDataSet())
            {
                List<Tariff> tariffList = new List<Tariff>();
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    tariffList.Add(Fill(dr));
                }
                return tariffList;
            }
            return new List<Tariff>();
        }
      
        public bool Insert(Tariff obj)
        {
            obj.ObjState = Enums.ObjectState.INSERT;
            return obj.Manage();
        }

        public bool Update(Tariff obj)
        {
            obj.ObjState = Enums.ObjectState.UPDATE;
            return obj.Manage();
        }

        public bool Delete(int ID)
        {
            Tariff obj = new Tariff();
           
            obj.TariffID = ID;
            obj.ObjState = Enums.ObjectState.DELETE;
            if (obj.Validate())
            {
                return obj.Manage();
            }
            return false;
        }

        public Tariff Fill(System.Data.DataRow item)
        {
            if(item == null) return null;
            Tariff obj = new Tariff();
            obj.TariffID = item.GetIntValue("TariffID");
            obj.TariffCode = item.GetValue("TariffCode");
            obj.AC = item.GetBoolValue("AC");
            obj.BasePrice = Math.Round(item.GetDecimalValue("BasePrice") ?? 0, 2);
            obj.Kms = item.GetIntValue("Kms");
            obj.ExtraHourRate = Math.Round(item.GetDecimalValue("ExtraHourRate") ?? 0, 2);
            obj.ExtraKmRate = Math.Round(item.GetDecimalValue("ExtraKmRate") ?? 0, 2);
            obj.FuelType = item.GetIntValue("FuelType");
            obj.StandCharges = Math.Round(item.GetDecimalValue("StandCharges") ?? 0, 2);
            obj.VehicleType = item.GetIntValue("VehicleType");
            return obj;
        }
    }
}