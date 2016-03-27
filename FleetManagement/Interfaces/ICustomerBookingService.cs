using FleetManagement.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FleetManagement.Interfaces
{
    interface ICustomerBookingService : IEntityService<CustomerBooking>
    {
        bool CreateCustomerBooking(CustomerBooking customerBooking, Entities.VehicleAllocation vehicleAllocation);
        List<CustomerBooking> GetPendingBookingsForBilling();
    }
}
