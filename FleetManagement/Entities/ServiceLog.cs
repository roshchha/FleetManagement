using FleetManagement.Common;
using FleetManagement.Enums;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FleetManagement.Entities
{
    public class ServiceLog : BaseEntity
    {
        public int ID { get; set; }

        public int VehicleID { get; set; }
        public string VehicleNo { get; set; }

        public DateTime SentDate { get; set; }

        public int MileageReading { get; set; }

        public string ServiceReason { get; set; }

        public decimal? SpareExpenditure { get; set; }

        public decimal? LabourExpenditure { get; set; }

        public DateTime NextServiceDate { get; set; }

        public DateTime InsertTimeStamp { get; set; }

        public bool Manage()
        {
            int success = 0;
            if (ObjState == ObjectState.DELETE)
            {
                success = SqlHelper.ExecuteNonQuery("Delete_ServiceLog", getSqlParameters().ToArray());
            }
            else
            {
                success = SqlHelper.ExecuteNonQuery("Manage_ServiceLog", getSqlParameters().ToArray());
            }
            return success > -1;
        }
        private List<SqlParameter> getSqlParameters()
        {
            List<SqlParameter> sqlParamList = new List<SqlParameter>();

            if (ObjState == ObjectState.DELETE)
            {
                sqlParamList.Add(new SqlParameter("@ID", ID));
            }
            else
            {
                sqlParamList.Add(new SqlParameter("@VehicleID", VehicleID));
                sqlParamList.Add(new SqlParameter("@SentDate", SentDate));
                sqlParamList.Add(new SqlParameter("@MileageReading", MileageReading));
                sqlParamList.Add(new SqlParameter("@ServiceReason", ServiceReason));
                sqlParamList.Add(new SqlParameter("@SpareExpenditure", SpareExpenditure));
                sqlParamList.Add(new SqlParameter("@LabourExpenditure", LabourExpenditure));
                sqlParamList.Add(new SqlParameter("@NextServiceDate", NextServiceDate));
                sqlParamList.Add(new SqlParameter("@ObjectState", this.ObjState));

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