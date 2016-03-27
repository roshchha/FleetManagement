﻿using FleetManagement.Common;
using FleetManagement.Entities;
using FleetManagement.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FleetManagement.Services
{
    public class AccidentDetailsService : IEntityService<AccidentDetails>
    {
        public List<AccidentDetails> Get(int ID = 0)
        {
            throw new NotImplementedException();
        }

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

        public AccidentDetails Fill(System.Data.DataRow item)
        {
            throw new NotImplementedException();
        }
    }
}