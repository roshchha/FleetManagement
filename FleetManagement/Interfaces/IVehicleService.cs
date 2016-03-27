using FleetManagement.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FleetManagement.Interfaces
{
    interface IVehicleService : IEntityService<Vehicle>
    {
        Enums.VehicleAvailabilityStatus ChooseVehicleForAllocation(int vehicleType, int fuelType, bool ac, bool driverNeeded, DateTime fromDate, DateTime toDate, out int vehicleID, out int? empID);
    }
}
