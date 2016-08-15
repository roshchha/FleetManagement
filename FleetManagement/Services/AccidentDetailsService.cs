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
    public class AccidentDetailsService : IEntityService<AccidentDetails>
    {
        /// <summary>
        /// Get accident details
        /// </summary>
        /// <param name="ID"></param>
        /// <returns></returns>
        public List<AccidentDetails> Get(int ID = 0)
        {
            List<AccidentDetails> retObj = new List<AccidentDetails>();
            DataSet ds = SqlHelper.ExecuteDataset("Get_AccidentDetails", new SqlParameter[0]);
            if(ds.ValidDataSet())
            {
                foreach(DataRow item in ds.Tables[0].Rows)
                {
                    retObj.Add(Fill(item));
                }
            }

            return retObj;
        }

        /// <summary>
        /// Insert accident details
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public bool Insert(AccidentDetails obj)
        {
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("VehicleID", obj.VehicleID));
            sqlParams.Add(new SqlParameter("AccidentDate", obj.AccidentDate));
            sqlParams.Add(new SqlParameter("AccidentLocation", obj.AccidentLocation));
            sqlParams.Add(new SqlParameter("AccidentDesc", obj.AccidentDesc));
            sqlParams.Add(new SqlParameter("Damage", obj.Damage));
            sqlParams.Add(new SqlParameter("RepairCost", obj.RepairCost));
            sqlParams.Add(new SqlParameter("EmployeeID", obj.EmployeeID));

            int success = SqlHelper.ExecuteNonQuery("Insert_AccidentDetails", sqlParams.ToArray());
            return success > -1;
        }

        public bool Update(AccidentDetails obj)
        {
            throw new NotImplementedException();
        }

        public bool Delete(int ID)
        {
            throw new NotImplementedException();
        }

        public AccidentDetails Fill(DataRow item)
        {
            if (item == null) return null;

            AccidentDetails retObj  = new AccidentDetails();
            retObj.VehicleID        = item.GetIntValue("VehicleId");
            retObj.RepairCost       = Math.Round(item.GetDecimalValue("RepairCost") ?? 0, 2);
            retObj.AccidentLocation = item.GetValue("AccidentLocation");
            retObj.AccidentDate     = item.GetDateTimeValue("AccidentDate");
            retObj.AccidentDesc     = item.GetValue("AccidentDesc");
            retObj.Damage           = item.GetValue("Damage");
            retObj.EmployeeID       = item.GetIntValue("EmployeeID");
            retObj.EmployeeName     = item.GetValue("EmployeeName");
            retObj.VehicleNo      = item.GetValue("VehicleNo");
            return retObj;
        }
    }
}