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
    public class VehicleTypeService : IEntityService<VehicleType>
    {
        public List<VehicleType> Get(int ID = 0)
        {
            List<SqlParameter> sqlParamList = new List<SqlParameter>();
            sqlParamList.Add(new SqlParameter("ID", ID));
            DataSet ds = SqlHelper.ExecuteDataset("Get_VehicleType", sqlParamList.ToArray());
            if (ds.ValidDataSet())
            {
                List<VehicleType> VehicleType = new List<VehicleType>();
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    VehicleType.Add(Fill(row));
                }
                return VehicleType;
            }
            return new List<VehicleType>();
        }

        public bool Insert(VehicleType obj)
        {
            obj.ObjState = Enums.ObjectState.INSERT;
            return obj.Manage();
        }

        public bool Update(VehicleType obj)
        {
            throw new NotImplementedException();
        }

        public bool Delete(int ID)
        {
            throw new NotImplementedException();
        }

        public VehicleType Fill(System.Data.DataRow item)
        {
            VehicleType vType = new VehicleType();
            vType.ID = item.GetIntValue("ID");
            vType.Name = item.GetValue("Name");
            return vType;
        }
    }
}