using FleetManagement.Common;
using FleetManagement.Entities;
using FleetManagement.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;


namespace FleetManagement.Services
{
    public class CustomerBookingService : ICustomerBookingService
    {
        public List<CustomerBooking> Get(int ID = 0)
        {
            List<CustomerBooking> custBooking = new List<CustomerBooking>();
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            if (ID > 0)
            {
                sqlParams.Add(new SqlParameter("BookingID", ID));
            }
            DataSet ds = SqlHelper.ExecuteDataset("Get_CustomerBooking", sqlParams.ToArray());
            if (ds.ValidDataSet())
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    custBooking.Add(Fill(row));
                }
            }
            return custBooking;
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
            customerBooking.BillingDetails.Discount = Math.Round(item.GetDecimalValue("Discount") ?? 0, 2);
            customerBooking.BillingDetails.GrossAmount = Math.Round(item.GetDecimalValue("GrossAmount") ?? 0, 2);
            customerBooking.BillingDetails.TotalAmount = Math.Round(item.GetDecimalValue("TotalAmount") ?? 0, 2);
            customerBooking.BillingDetails.TariffID = item.GetIntValue("TariffID");
            customerBooking.TariffDetails = new Tariff();
            customerBooking.TariffDetails.TariffID = customerBooking.BillingDetails.TariffID;
            customerBooking.TariffDetails.TariffCode = item.GetValue("TariffCode");
            customerBooking.TariffDetails.StandCharges = Math.Round(item.GetDecimalValue("StandCharges") ?? 0,2);
            customerBooking.TariffDetails.BasePrice = Math.Round(item.GetDecimalValue("BasePrice") ?? 0,2);
            customerBooking.TariffDetails.ExtraHourRate = Math.Round(item.GetDecimalValue("ExtraHourRate") ?? 0,2);
            customerBooking.TariffDetails.ExtraKmRate = Math.Round(item.GetDecimalValue("ExtraKmRate") ?? 0,2);
            customerBooking.TariffDetails.Kms = item.GetIntValue("Kms");

            return customerBooking;
        }


        public bool CreateCustomerBooking(CustomerBooking customerBooking, Entities.VehicleAllocation vehicleAllocation, out int bookingId)
        {
            bool success = false;
            bookingId = 0;
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
                bookingId = Convert.ToInt32(objBookingId);
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

         public List<BookingLight> GetMonthlyBookingCount()
        {
            List<BookingLight> bookingCountList = new List<BookingLight>();
            DataSet ds = SqlHelper.ExecuteDataset("GET_MonthlyBookingCount", new SqlParameter[] { });
            if (ds.ValidDataSet())
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                  DateTimeFormatInfo datetimeFormat = new DateTimeFormatInfo();
                    CultureInfo cultureInfo = new CultureInfo("en-US");
                    DateTime dt = Convert.ToDateTime(row.GetValue("BookingDate"),cultureInfo.DateTimeFormat);
                    string dateStr = dt.ToString("dd MMM yy");
                    bookingCountList.Add(new BookingLight { BookingDateTime = dt, BookingDate = dateStr, BookingCount = row.GetIntValue("BookingCount") });
                    
                }
                DateTime today = DateTime.Today;
                for (int i = 0; i < 30; i++)
                {
                    DateTime dt = today.AddDays(-i);
                    string dateStr = dt.ToString("dd MMM yy");
                    if (!bookingCountList.Any(b => b.BookingDateTime == dt))
                    {
                        bookingCountList.Add(new BookingLight {BookingDateTime =dt, BookingDate = dateStr, BookingCount = 0 });
                    }
                }
                bookingCountList.Sort((a, b) => a.BookingDateTime.CompareTo(b.BookingDateTime));
               
            }
            return bookingCountList;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
         public List<GrossRevenue> GetGrossMonthlyRevenueForVehicles()
         {
             List<GrossRevenue> grossRevenueForVehiclesList = new List<GrossRevenue>();
            DataSet ds = SqlHelper.ExecuteDataset("Get_MonthlyGrossRevenueFromVehicles", new SqlParameter[] { });
            if (ds.ValidDataSet())
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    CultureInfo cultureInfo = new CultureInfo("en-US");
                    DateTime dt = Convert.ToDateTime(row.GetValue("BookingDate"), cultureInfo.DateTimeFormat);
                    string dateStr = dt.ToString("dd MMM yy");
                    grossRevenueForVehiclesList.Add(new GrossRevenue
                    {
                        VehicleType = row.GetIntValue("VehicleType"),
                        VehicleTypeName = row.GetValue("VehicleTypeName"),
                        TotalAmount = row.GetDecimalValue("TotalAmount") ?? 0,
                        BookingCount = row.GetIntValue("BookingCount") 
                    });

                }

                grossRevenueForVehiclesList.Sort((a, b) => a.VehicleType.CompareTo(b.VehicleType));

            }
            return grossRevenueForVehiclesList;
        }
         
    }

}