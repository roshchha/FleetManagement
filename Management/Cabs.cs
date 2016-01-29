using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web;
using System.Collections;


namespace Management
{
    public class Cabs
    {

        SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["connect"].ToString());
        //string connect=
        public int getCount(string username, string password)
        {
            int count = 0;
            try
            {

                SqlCommand cmdGet = new SqlCommand("select count(*) from login where username='" + username + "' and password='" + password + "'", con);
                con.Open();
                count = int.Parse(cmdGet.ExecuteScalar().ToString());
                con.Close();
                return count;
            }
            catch
            {
                throw;
            }
            //finally
            //{

            //}
        }


        //insert vehicle name into vehicletype
        public void insertvehicle(string name)
        {
            try
            {
                SqlCommand cmdInsert = new SqlCommand("insert into a_vehicletype(vehicleName) values('" + name + "')", con);
                con.Open();
                cmdInsert.ExecuteNonQuery();
                con.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                con.Close();
            }
        }


        //insert designation name into designation
        public void insertdesignation(string designation)
        {
            SqlCommand cmd = new SqlCommand("insert into desigantion values('" + designation + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public DataSet getVehicles()
        {
            try
            {
                SqlDataAdapter daGet = new SqlDataAdapter("sp_getvehicles", con);
                DataSet dsGetvehicles = new DataSet();
                daGet.Fill(dsGetvehicles);
                return dsGetvehicles;
            }
            catch
            {
                throw;
            }
        }

        public void insertVehiclemaster(string vehicletype, string regno, string regdate, string engineno, string chasisno, string fueltype, int tankcapacity, int noofseating, int ac, int vehiclecost, string purchasedate, int insuranceamt, string insuranceexpdate)
        {
            SqlCommand cmdInsert = new SqlCommand("sp_insertvehiclemaster", con);
            cmdInsert.CommandType = CommandType.StoredProcedure;
            cmdInsert.Parameters.Add("@vehicletype", SqlDbType.VarChar).Value = vehicletype;
            cmdInsert.Parameters.Add("@regno", SqlDbType.VarChar).Value = regno;
            cmdInsert.Parameters.Add("@regdate", SqlDbType.VarChar).Value = regdate;
            cmdInsert.Parameters.Add("@engineno", SqlDbType.VarChar).Value = engineno;
            cmdInsert.Parameters.Add("@chasisno", SqlDbType.VarChar).Value = chasisno;
            cmdInsert.Parameters.Add("@fueltype", SqlDbType.Char).Value = fueltype;
            cmdInsert.Parameters.Add("@tankcapacity", SqlDbType.Int).Value = tankcapacity;
            cmdInsert.Parameters.Add("@noofseating", SqlDbType.Int).Value = noofseating;
            cmdInsert.Parameters.Add("@ac", SqlDbType.Int).Value = ac;
            cmdInsert.Parameters.Add("@vehiclecost", SqlDbType.BigInt).Value = vehiclecost;
            cmdInsert.Parameters.Add("@purchasedate", SqlDbType.VarChar).Value = purchasedate;
            cmdInsert.Parameters.Add("@insuranceamt", SqlDbType.Int).Value = insuranceamt;
            cmdInsert.Parameters.Add("@insuranceexpdate", SqlDbType.VarChar).Value = insuranceexpdate;
            con.Open();
            cmdInsert.ExecuteNonQuery();
            con.Close();

        }
    }
}
