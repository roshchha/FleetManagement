using FleetManagement.Entities;
using FleetManagement.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FleetManagement.Common;
using System.Data.SqlClient;
using System.Data;


namespace FleetManagement.Services
{
    public class CustomerService : IEntityService<Customer>
    {
        public List<Customer> Get(int ID = 0)
        {
            List<SqlParameter> sqlParams = new List<SqlParameter>();
            List<Customer> custList = new List<Customer>();
            if (ID > 0)
            {
                sqlParams.Add(new SqlParameter("CustomerID", ID));
            }
            DataSet ds = SqlHelper.ExecuteDataset("Get_Customer", sqlParams.ToArray());
            if (ds.ValidDataSet())
            {
                foreach (DataRow row in ds.Tables[0].Rows)
                {

                    custList.Add(Fill(row));
                }
            }
            return custList;
        }

        public bool Insert(Customer obj)
        {
            obj.ObjState = Enums.ObjectState.INSERT;
            return obj.Manage();
        }

        public bool Update(Customer obj)
        {
            obj.ObjState = Enums.ObjectState.UPDATE;
            return obj.Manage();
        }

        public bool Delete(int ID)
        {
            Customer obj = new Customer();
            obj.ID = ID;
            obj.ObjState = Enums.ObjectState.DELETE;
            if (obj.Validate())
            {
                return obj.Manage();
            }
            return false;
        }

        public Customer Fill(System.Data.DataRow item)
        {
            if (item == null) return null;
            Customer customer = new Customer();
            customer.ID = item.GetIntValue("ID");
            customer.Name = item.GetValue("Name");
            customer.Address = item.GetValue("Address");
            customer.Country = item.GetValue("Country");
            customer.State = item.GetValue("State");
            customer.Phone = item.GetValue("Phone");
            customer.Email = item.GetValue("Email");

            return customer;
        }
    }
}