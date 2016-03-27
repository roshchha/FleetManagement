using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FleetManagement.Enums
{
    public enum ObjectState
    {
        NONE = 0,
        INSERT = 1,
        UPDATE = 2,
        DELETE = 3
    }
    public enum YesNo
    {
        No = 0,
        Yes = 1
    }
    public enum FuelType 
    {
        Select = 0,
        Petrol = 1,
        Diesel = 2
    }
    public enum Country
    {
        Select = 0,
        India = 1,
        Others = 2
    }
    public enum VehicleAvailabilityStatus
    {
        NONE = 0,
        AllBooked = 1,
        NotAvailableForSelectedOptions = 2,
        Available = 3,
        NoDriverAvailable = 4
    }
}