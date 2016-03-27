using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FleetManagement.Entities
{
    public class CustomerBilling
    {
        public int BillingID { get; set; }

        public int BookingID { get; set; }

        public long OutMeterReading { get; set; }

        public long InMeterReading { get; set; }

        public decimal TotalAmount { get; set; }
        public decimal GrossAmount { get; set; }
        public decimal Discount { get; set; }

        public int TariffID { get; set; }
        public string DutySlipNo { get; set; }

        public DateTime? DutySlipDate { get; set; }


        //public bool Validate()
        //{
        //    return;
        //}

    }

}