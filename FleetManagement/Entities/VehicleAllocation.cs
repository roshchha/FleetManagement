using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FleetManagement.Entities
{
    public class VehicleAllocation
    {
        public int BookingID { get; set; }

        public int? EmployeeID { get; set; }

        public int VehicleID { get; set; }

    }

}