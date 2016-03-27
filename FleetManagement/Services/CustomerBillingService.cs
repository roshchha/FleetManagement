using FleetManagement.Entities;
using FleetManagement.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FleetManagement.Services
{
    public class CustomerBillingService : IEntityService<CustomerBilling>
    {
        public List<CustomerBilling> Get(int ID = 0)
        {
            throw new NotImplementedException();
        }

        public bool Insert(CustomerBilling obj)
        {
            throw new NotImplementedException();
        }

        public bool Update(CustomerBilling obj)
        {
            throw new NotImplementedException();
        }

        public bool Delete(int ID)
        {
            throw new NotImplementedException();
        }

        public CustomerBilling Fill(System.Data.DataRow item)
        {
            throw new NotImplementedException();
        }
    }
}