using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FleetManagement.Entities
{
    public class AccidentDetails
    {
        public int VehicleID { get; set; }

        public DateTime AccidentDate { get; set; }

        public string AccidentLocation { get; set; }

        public string AccidentDesc { get; set; }

        public string Damage { get; set; }

        public decimal? RepairCost { get; set; }

        public int? EmployeeID { get; set; }

        public string VehicleName { get; set; }

        public string EmployeeName { get; set; }

    }

}