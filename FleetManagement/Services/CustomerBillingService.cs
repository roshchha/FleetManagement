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
    public class CustomerBillingService : IEntityService<CustomerBilling>
    {
        public List<CustomerBilling> Get(int ID = 0)
        {
            throw new NotImplementedException();
        }

        public bool Insert(CustomerBilling obj)
        {
            throw new NotImplementedException();
        }

        public bool Update(CustomerBilling obj)
        {
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            sqlParams.Add(new SqlParameter("Billing", obj.Billing));
            sqlParams.Add(new SqlParameter("InMeterReading", obj.InMeterReading));
            sqlParams.Add(new SqlParameter("OutMeterReading", obj.OutMeterReading));
            sqlParams.Add(new SqlParameter("TotalAmount", obj.TotalAmount));
            sqlParams.Add(new SqlParameter("Discount", obj.Discount));
            sqlParams.Add(new SqlParameter("GrossAmount", obj.GrossAmount));
            sqlParams.Add(new SqlParameter("BookingID", obj.BookingID));
            sqlParams.Add(new SqlParameter("DutySlipDate", obj.DutySlipDate));
            sqlParams.Add(new SqlParameter("DutySlipNo", obj.DutySlipNo));

            int success = SqlHelper.ExecuteNonQuery("Update_CustomerBooking", sqlParams.ToArray());
            return success > -1;
        }

        public bool Delete(int ID)
        {
            throw new NotImplementedException();
        }

        public CustomerBilling Fill(System.Data.DataRow item)
        {
            throw new NotImplementedException();
        }
    }
}