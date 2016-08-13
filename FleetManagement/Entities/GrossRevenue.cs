using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FleetManagement.Entities
{
    public class GrossRevenue
    {

        public string VehicleTypeName { get; set; }
        [JsonIgnore]
        public int VehicleType { get; set; }
        public decimal TotalAmount { get; set; }

        public int BookingCount { get; set; }
        //public int VehicleID { get; set; }
        //public int BookingID { get; set; }
        //public string BookingDate { get; set; }
        //[JsonIgnore]
        //public DateTime BookingDateTime { get; set; }
    }
}