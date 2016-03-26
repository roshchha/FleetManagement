using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FleetManagement.Common;
using System.Data.SqlClient;
using System.Data;
using FleetManagement.Interfaces;

namespace FleetManagement.Entities
{
    public class VehicleType : BaseEntity
    {
        public int ID { get; set; }
        public string Name { get; set; }

        public bool Manage()
        {
            if (ObjState == Enums.ObjectState.INSERT)
            {
                int success = SqlHelper.ExecuteNonQuery("Insert_VehicleType", new SqlParameter[] { new SqlParameter("Name", Name) });
                return success > -1;
            }
            return true;
        }

        public bool Validate()
        {
            throw new NotImplementedException();
        }

    }


}