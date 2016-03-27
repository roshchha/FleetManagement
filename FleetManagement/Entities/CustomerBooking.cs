using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FleetManagement.Entities
{
    public class CustomerBooking
    {
        public int BookingID { get; set; }
        public string BookingRef { get; set; }

        public int CustomerID { get; set; }

        public DateTime BookingDate { get; set; }

        public string PickupPoint { get; set; }

        public string DropPoint { get; set; }

        public DateTime FromDate { get; set; }

        public DateTime ToDate { get; set; }
        public string GuestName { get; set; }
        public string Phone { get; set; }
        //non-table
        public string AltPhone { get; set; }
        public string CustomerName { get; set; }

        public CustomerBilling BillingDetails { get; set; }
        public Tariff TariffDetails { get; set; }
    }

}