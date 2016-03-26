using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using FleetManagement.Common;
using FleetManagement.Enums;
using System.Data.SqlClient;

namespace FleetManagement.Entities
{
    public class Employee : BaseEntity
    {
        public int EmpID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int DesignationID { get; set; }
        public decimal Salary { get; set; }
        public DateTime DateOfJoin { get; set; }
        public string Qualification { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string Address { get; set; }
        public string Country { get; set; }
        public string State { get; set; }
        public string Phone { get; set; }
        public string EmailID { get; set; }

        //non-table properties
        public string Designation { get; set; }

       
        /// <summary>
        /// Insert, update or deletes the employee
        /// </summary>
        /// <returns></returns>
        public bool Manage()
        {
            int success = 0;
            if (ObjState == ObjectState.DELETE)
            {
                success = SqlHelper.ExecuteNonQuery("Delete_Employee", getSqlParameters().ToArray());
            }
            else
            {
                success = SqlHelper.ExecuteNonQuery("Manage_Employee", getSqlParameters().ToArray());
            }
            return success > -1;
        }
        /// <summary>
        /// Get all employees
        /// </summary>
        /// <returns></returns>
        private List<SqlParameter> getSqlParameters()
        {
            List<SqlParameter> sqlParamList = new List<SqlParameter>();

            if (ObjState == ObjectState.DELETE)
            {
                sqlParamList.Add(new SqlParameter("EmpID", EmpID));
            }
            else
            {
                sqlParamList.Add(new SqlParameter("EmpID", EmpID));
                sqlParamList.Add(new SqlParameter("FirstName", FirstName));
                sqlParamList.Add(new SqlParameter("LastName", LastName));
                sqlParamList.Add(new SqlParameter("DesignationID", DesignationID));
                sqlParamList.Add(new SqlParameter("Salary", Salary));
                sqlParamList.Add(new SqlParameter("DateOfJoin", DateOfJoin));
                sqlParamList.Add(new SqlParameter("Qualification", Qualification));
                sqlParamList.Add(new SqlParameter("DateOfBirth", DateOfBirth));
                sqlParamList.Add(new SqlParameter("Address", Address));
                sqlParamList.Add(new SqlParameter("Country", Country));
                sqlParamList.Add(new SqlParameter("State", State));
                sqlParamList.Add(new SqlParameter("Phone", Phone));
                sqlParamList.Add(new SqlParameter("EmailID", EmailID));
                sqlParamList.Add(new SqlParameter("ObjectState", this.ObjState));

            }
            return sqlParamList;

        }
        public bool Validate()
        {
            if (this.EmpID <= 0)
            {
                return false;
            }
            return true;
        }   
    }


}