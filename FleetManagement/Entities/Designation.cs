using FleetManagement.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FleetManagement.Entities
{
    public class Designation : BaseEntity
    {
        public int DesignationID { get; set; }
        public string DesignationName { get; set; }

        /// <summary>
        /// Fill designation object from datarow
        /// </summary>
        /// <param name="item"></param>
        /// <returns></returns>
        private static Designation Fill(DataRow item)
        {
            if (item == null) return null;

            Designation retObj = new Designation();
            retObj.DesignationID = item.GetIntValue("DesignationID");
            retObj.DesignationName = item.GetValue("DesignationName");

            return retObj;
        }

        /// <summary>
        /// Insert, update or deletes the desgination
        /// </summary>
        /// <returns></returns>
        public bool Manage()
        {

            int success = SqlHelper.ExecuteNonQuery("Manage_Designation", getSqlParameters().ToArray());
            return success > -1;
        }
        /// <summary>
        /// Get all Designations
        /// </summary>
        /// <returns></returns>
        public static List<Designation> Get()
        {
            DataSet ds = SqlHelper.ExecuteDataset("Get_Designation", new SqlParameter[0]);
            if (ds.ValidDataSet())
            {
                List<Designation> designations = new List<Designation>();
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    designations.Add(Fill(dr));
                }
                return designations;
            }
            return null;
        }
        public List<SqlParameter> getSqlParameters()
        {
            List<SqlParameter> sqlParamList = new List<SqlParameter>();

            sqlParamList.Add(new SqlParameter("DesignationName", this.DesignationName));
            sqlParamList.Add(new SqlParameter("ObjectState", this.ObjState));


            return sqlParamList;

        }
        public bool Validate()
        {
            if (this.DesignationID <= 0)
            {
                return false;
            }
            if (string.IsNullOrEmpty(this.DesignationName))
            {
                return false;
            }
            return true;
        }

    }
}