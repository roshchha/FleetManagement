using FleetManagement.Common;
using FleetManagement.Entities;
using FleetManagement.Enums;
using FleetManagement.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FleetManagement.Services
{
    public class EmployeeService : IEntityService<Employee>
    {
        public List<Employee> Get(int ID = 0)
        {
            List<SqlParameter> sqlParamList = new List<SqlParameter>();
            if (ID > 0)
            {
                sqlParamList.Add(new SqlParameter("EmpID", ID));
            }
            DataSet ds = SqlHelper.ExecuteDataset("Get_Employee", sqlParamList.ToArray());
            if (ds.ValidDataSet())
            {
                List<Employee> empList = new List<Employee>();
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    empList.Add(Fill(dr));
                }
                return empList;
            }
            return new List<Employee>();
        }

        public bool Insert(Employee obj)
        {
            obj.ObjState = ObjectState.INSERT;
            return obj.Manage();
        }

        public bool Update(Employee obj)
        {
            if (obj.Validate())
            {
                obj.ObjState = ObjectState.UPDATE;
                return obj.Manage();
            }
            return false;
        }

        public bool Delete(int ID)
        {
            Employee employee = new Employee();
            employee.EmpID = ID;
            if (employee.Validate())
            {
                employee.ObjState = ObjectState.DELETE;
                return employee.Manage();
            }
            return false;
        }

        /// <summary>
        /// create employee object from datarow
        /// </summary>
        /// <param name="item"></param>
        /// <returns></returns>
        public Employee Fill(DataRow item)
        {
            if (item == null) return null;

            Employee retObj = new Employee();
            retObj.EmpID = item.GetIntValue("EmpID");
            retObj.FirstName = item.GetValue("FirstName");
            retObj.LastName = item.GetValue("LastName");
            retObj.Phone = item.GetValue("Phone");
            retObj.Address = item.GetValue("Address");
            retObj.Country = item.GetValue("Country");
            retObj.DateOfBirth = item.GetDateTimeValue("DateOfBirth");
            retObj.DateOfJoin = item.GetDateTimeValue("DateOfJoin");
            retObj.Designation = item.GetValue("Designation");
            retObj.DesignationID = item.GetIntValue("DesignationID");
            retObj.Qualification = item.GetValue("Qualification");
            retObj.Salary = Math.Ceiling(item.GetDecimalValue("Salary") ?? 0);
            retObj.State = item.GetValue("State");
            retObj.EmailID = item.GetValue("EmailID");

            return retObj;
        }
    }
}