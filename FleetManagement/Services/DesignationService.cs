using FleetManagement.Common;
using FleetManagement.Entities;
using FleetManagement.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FleetManagement.Services
{
    public class DesignationService: IEntityService<Designation>
    {

        public List<Designation> Get(int ID = 0)
        {
            throw new NotImplementedException();
        }

        public bool Insert(Designation obj)
        {
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("DesignationName",obj.DesignationName));
            int success = SqlHelper.ExecuteNonQuery("Insert_Designation", sqlParams.ToArray());

            return success > -1;
        }

        public bool Update(Designation obj)
        {
            throw new NotImplementedException();
        }

        public bool Delete(int ID)
        {
            throw new NotImplementedException();
        }

        public Designation Fill(System.Data.DataRow item)
        {
            throw new NotImplementedException();
        }
    }
}