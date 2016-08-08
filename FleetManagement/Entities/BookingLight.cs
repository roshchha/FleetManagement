using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FleetManagement.Entities
{
    public class BookingLight
    {
        public string BookingDate { get; set; }
        public int BookingCount { get; set; }

        [JsonIgnore]
        public DateTime BookingDateTime { get; set; }
    }
}