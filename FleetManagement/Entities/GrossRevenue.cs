using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FleetManagement.Entities
{
    public class GrossRevenue
    {
        public int VehicleID { get; set; }
        public string VehicleTypeName { get; set; }
        public int VehicleType { get; set; }
        public decimal TotalAmount { get; set; }
        public string BookingDate { get; set; }
        [JsonIgnore]
        public DateTime BookingDateTime { get; set; }
    }
}