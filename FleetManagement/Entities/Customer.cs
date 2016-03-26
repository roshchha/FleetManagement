using FleetManagement.Common;
using FleetManagement.Enums;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FleetManagement.Entities
{
    public class Customer : BaseEntity
    {
        public int ID { get; set; }

        public string Name { get; set; }

        public string Address { get; set; }

        public string Phone { get; set; }

        public string Email { get; set; }

        public string Country { get; set; }

        public string State { get; set; }

        public bool Manage()
        {
            int success = 0;
            if (ObjState == ObjectState.DELETE)
            {
                success = SqlHelper.ExecuteNonQuery("Delete_Customer", getSqlParameters().ToArray());
            }
            else
            {
                success = SqlHelper.ExecuteNonQuery("Manage_Customer", getSqlParameters().ToArray());
            }
            return success > -1;
        }
        private List<SqlParameter> getSqlParameters()
        {
            List<SqlParameter> sqlParamList = new List<SqlParameter>();

            if (ObjState == ObjectState.DELETE)
            {
                sqlParamList.Add(new SqlParameter("CustomerID", ID));
            }
            else
            {
                sqlParamList.Add(new SqlParameter("CustomerID", ID));
                sqlParamList.Add(new SqlParameter("Name", Name));
                sqlParamList.Add(new SqlParameter("Address", Address));
                sqlParamList.Add(new SqlParameter("Phone", Phone));
                sqlParamList.Add(new SqlParameter("Email", Email));
                sqlParamList.Add(new SqlParameter("Country", Country));
                sqlParamList.Add(new SqlParameter("State", State));
                sqlParamList.Add(new SqlParameter("ObjectState", this.ObjState));

            }
            return sqlParamList;

        }
        public bool Validate()
        {
            if (this.ID <= 0)
            {
                return false;
            }
            return true;
        }

    }

}