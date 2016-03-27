using FleetManagement.Entities;
using FleetManagement.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FleetManagement.Common;
using System.Data.SqlClient;
using System.Data;


namespace FleetManagement.Services
{
    public class ServiceLogService : IEntityService<ServiceLog>
    {
        public List<ServiceLog> Get(int ID = 0)
        {
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            List<ServiceLog> serviceLogs = new List<ServiceLog>();
            if (ID > 0)
            {
                sqlParams.Add(new SqlParameter("CustomerID", ID));
            }
            DataSet ds = SqlHelper.ExecuteDataset("Get_Customer", sqlParams.ToArray());
            if (ds.ValidDataSet())
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    serviceLogs.Add(Fill(row));
                }
            }
            return serviceLogs;
        }

        public bool Insert(ServiceLog obj)
        {
            obj.ObjState = Enums.ObjectState.INSERT;
            return obj.Manage();
        }

        public bool Update(ServiceLog obj)
        {
            obj.ObjState = Enums.ObjectState.UPDATE;
            return obj.Manage();
        }

        public bool Delete(int ID)
        {
            ServiceLog obj = new ServiceLog();
            obj.Id = ID;
            obj.ObjState = Enums.ObjectState.DELETE;
            if (obj.Validate())
            {
                return obj.Manage();
            }
            return false;
        }

        public ServiceLog Fill(System.Data.DataRow item)
        {
            if (item == null) return null;
            ServiceLog serviceLog = new ServiceLog();
            serviceLog.Id                   = item.GetIntValue("ID");
            serviceLog.VehicleID            = item.GetIntValue("VehicleID");
            serviceLog.SentDate             = item.GetDateTimeValue("SentDate");
            serviceLog.MileageReading       = item.GetIntValue("MileageReading");
            serviceLog.ServiceReason        = item.GetValue("ServiceReason");
            serviceLog.SpareExpenditure     = item.GetDecimalValue("SpareExpenditure");
            serviceLog.LabourExpenditure    = item.GetDecimalValue("LabourExpenditure");
            serviceLog.NextServiceDate      = item.GetDateTimeValue("NextServiceDate");
            serviceLog.InsertTimeStamp      = item.GetDateTimeValue("InsertTimeStamp");
            return serviceLog;
        }
    }
}