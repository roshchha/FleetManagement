using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using FleetManagement.Services;
using FleetManagement.Entities;
using FleetManagement;
using FleetManagement.Interfaces;
using System.Collections.Generic;
using System.Linq;

public partial class Accidentdetails : System.Web.UI.Page
{
    IEntityService<Vehicle> vehicleService = new VehicleService();
    IEntityService<Employee> employeeService = new EmployeeService();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Visible = false;
        if (!IsPostBack)
        {

            List<Vehicle> lstVehicles = vehicleService.Get();

            ddlVehicleno.Items.Clear();
            ddlVehicleno.DataSource = lstVehicles;
            ddlVehicleno.DataTextField = "VehicleNo";
            ddlVehicleno.DataValueField = "VehicleID";
            ddlVehicleno.DataBind();
            ddlVehicleno.Items.Insert(0, new ListItem("Select"));

            List<Employee> lstEmployees = employeeService.Get().Where(x => x.DesignationID == 3).ToList();

            ddlDrivername.DataSource = lstEmployees;
            ddlDrivername.DataTextField = "FirstName";
            ddlDrivername.DataValueField = "EmpID";
            ddlDrivername.DataBind();
            ddlDrivername.Items.Insert(0, new ListItem("Select"));
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //string insertDetails = "insert into accidentdetails values('" + ddlVehicleno.SelectedItem.Text + "', '" + txtAccidentdate.Text + "','" + txtAccidentlocation.Text + "','" + txtAccidentdetails.Text + "','" + txtNatureofdamage.Text + "','" + txtEstimatedcostofrepair.Text + "','" + ddlDrivername.SelectedItem.Text + "')";
        //SqlCommand cmdInsert = new SqlCommand(insertDetails, con);
        //con.Open();
        //cmdInsert.ExecuteNonQuery();
        //con.Close();
        //lblMessage.Text = "Accident details added successfully";
        //lblMessage.Visible = true;
        //ddlVehicleno.SelectedIndex = 0;
        //txtEstimatedcostofrepair.Text = "";
        //txtAccidentdate.Text = "";
        //txtAccidentdetails.Text = "";
        //txtAccidentlocation.Text = "";
        //txtNatureofdamage.Text = "";
        //ddlDrivername.SelectedIndex = 0;
    }
}
