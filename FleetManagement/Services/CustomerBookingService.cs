using FleetManagement.Common;
using FleetManagement.Entities;
using FleetManagement.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using FleetManagement.Common;

namespace FleetManagement.Services
{
    public class CustomerBookingService : ICustomerBookingService
    {
        public List<CustomerBooking> Get(int ID = 0)
        {
            throw new NotImplementedException();
        }

        public bool Insert(CustomerBooking obj)
        {
            throw new NotImplementedException();
        }

        public bool Update(CustomerBooking obj)
        {
            throw new NotImplementedException();
        }

        public bool Delete(int ID)
        {
            throw new NotImplementedException();
        }

        public CustomerBooking Fill(System.Data.DataRow item)
        {
            if (item == null) return null;
            CustomerBooking customerBooking = new CustomerBooking();
            customerBooking.CustomerID = item.GetIntValue("CustomerID");
            customerBooking.BookingRef = item.GetValue("BookingRef");
            customerBooking.BookingDate = item.GetDateTimeValue("BookingDate");
            customerBooking.BookingID = item.GetIntValue("BookingID");
            customerBooking.DropPoint = item.GetValue("DropPoint");
            customerBooking.PickupPoint = item.GetValue("PickupPoint");
            customerBooking.FromDate = item.GetDateTimeValue("FromDate");
            customerBooking.ToDate = item.GetDateTimeValue("ToDate");
            customerBooking.Phone = item.GetValue("Phone");
            customerBooking.AltPhone = item.GetValue("AltPhone");
            customerBooking.GuestName = item.GetValue("GuestName");
            customerBooking.CustomerName = item.GetValue("CustomerName");
            customerBooking.BillingDetails = new CustomerBilling();
            customerBooking.BillingDetails.BillingID = item.GetIntValue("BillingID");
            customerBooking.BillingDetails.BookingID = customerBooking.BookingID;
            customerBooking.BillingDetails.DutySlipDate = item.GetDateTimeValue("DutySlipDate");
            customerBooking.BillingDetails.DutySlipNo = item.GetValue("DutySlipNo");
            customerBooking.BillingDetails.InMeterReading = item.GetLongValue("InMeterReading");
            customerBooking.BillingDetails.OutMeterReading = item.GetLongValue("OutMeterReading");
            customerBooking.BillingDetails.Discount = item.GetDecimalValue("Discount") ?? 0;
            customerBooking.BillingDetails.GrossAmount = item.GetDecimalValue("GrossAmount") ?? 0;
            customerBooking.BillingDetails.TariffID = item.GetIntValue("TariffID");
            customerBooking.TariffDetails = new Tariff();
            customerBooking.TariffDetails.TariffID = customerBooking.BillingDetails.TariffID;
            customerBooking.TariffDetails.TariffCode = item.GetValue("TariffCode");
            customerBooking.TariffDetails.StandCharges = item.GetDecimalValue("StandCharges") ?? 0;
            customerBooking.TariffDetails.BasePrice = item.GetDecimalValue("BasePrice") ?? 0;
            customerBooking.TariffDetails.ExtraHourRate = item.GetDecimalValue("ExtraHourRate") ?? 0;
            customerBooking.TariffDetails.ExtraKmRate = item.GetDecimalValue("ExtraKmRate") ?? 0;
            customerBooking.TariffDetails.Kms = item.GetIntValue("Kms");

            return customerBooking;
        }


        public bool CreateCustomerBooking(CustomerBooking customerBooking, Entities.VehicleAllocation vehicleAllocation)
        {
            bool success = false;
            try
            {
                List<SqlParameter> sqlParams = new List<SqlParameter>();
                sqlParams.Add(new SqlParameter("CustomerID", customerBooking.CustomerID));
                sqlParams.Add(new SqlParameter("PickupPoint", customerBooking.PickupPoint));
                sqlParams.Add(new SqlParameter("DropPoint", customerBooking.DropPoint));
                sqlParams.Add(new SqlParameter("FromDate", customerBooking.FromDate));
                sqlParams.Add(new SqlParameter("ToDate", customerBooking.ToDate));
                sqlParams.Add(new SqlParameter("GuestName", customerBooking.GuestName));
                sqlParams.Add(new SqlParameter("Phone", customerBooking.Phone));
                sqlParams.Add(new SqlParameter("VehicleID", vehicleAllocation.VehicleID));
                sqlParams.Add(new SqlParameter("EmpID", vehicleAllocation.EmployeeID));
                sqlParams.Add(new SqlParameter("TariffID", customerBooking.BillingDetails.TariffID));

                object objBookingId = SqlHelper.ExecuteScalar("Create_CustomerBooking", sqlParams.ToArray());
                int bookingId = Convert.ToInt32(objBookingId);
                if (bookingId > 0)
                {
                    success = true;
                }
            }
            catch(Exception ex){
                success = false;
            }
            return success;
        }
        /// <summary>
        /// Get those bookings for which billing details doesn't exist
        /// </summary>
        /// <returns></returns>
        public List<CustomerBooking> GetPendingBookingsForBilling()
        {
            List<CustomerBooking> custBookings = new List<CustomerBooking>();
           DataSet ds= SqlHelper.ExecuteDataset("Get_PendingBookingsForBilling", new SqlParameter[] { });
           if (ds.ValidDataSet())
           {
               foreach(DataRow row in ds.Tables[0].Rows){
                   custBookings.Add(Fill(row));
               }
           }
           return custBookings;
        }
    }
}