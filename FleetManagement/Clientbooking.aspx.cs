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
using Management;
using System.Data.SqlClient;
using FleetManagement.Services;
using FleetManagement.Entities;
using FleetManagement.Interfaces;
using System.Collections.Generic;

public partial class Clientbooking : System.Web.UI.Page
{
    IEntityService<Customer> customerService = new CustomerService();
    IEntityService<VehicleType> vehicleTypeService = new VehicleTypeService();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Visible = false;
        if (!IsPostBack)
        {
            BindVehicleTypes();
            BindCustomers();
                     
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
        //string insertvalues = "insert into customerbooking(customername, address, phoneno, email, vehicletype, guestname, pickup, droppoint, fromdate, todate) values('" + ddlCustomername.SelectedItem.Text + "', '" + txtAddress.Text + "', '" + txtPhoneno.Text + "', '" + txtEmail.Text + "', '" +ddlVehicletype.SelectedItem.Text+"','"+txtGuestname.Text+"','"+ txtPickup.Text + "','" + txtDroppoint.Text + "', '" + txtFromdate.Text + "', '" + txtTodate.Text + "')";
        //SqlCommand cmd = new SqlCommand(insertvalues, con);
        //con.Open();
        //cmd.ExecuteNonQuery();
        //con.Close();
        //lblMessage.Text = "Customer details added sucessfully";
        //lblMessage.Visible = true;
        //ddlCustomername.SelectedIndex = 0;
        //ddlVehicletype.SelectedIndex = 0;
        //txtAddress.Text = "";
        //txtPhoneno.Text = "";
        //txtEmail.Text = "";
        //txtGuestname.Text = "";
        //txtPickup.Text = "";
        //txtDroppoint.Text = "";
        //txtFromdate.Text = "";
        //txtTodate.Text = "";
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
    private void BindVehicleTypes()
    {
        List<VehicleType> vehicleTypes = vehicleTypeService.Get();
        ddlVehicletype.Items.Clear();
        ddlVehicletype.Items.Add(new ListItem("Select", "0"));
        vehicleTypes.ForEach(c =>
        {
            ddlVehicletype.Items.Add(new ListItem(c.Name, c.ID.ToString()));
        });
    }
    private void BindCustomers()
    {
        List<Customer> customers = customerService.Get();
        ddlCustomername.Items.Clear();
        ddlCustomername.Items.Add(new ListItem("Select", "0"));
        customers.ForEach(c => {
            ddlCustomername.Items.Add(new ListItem(c.Name, c.ID.ToString()));
        });
    }
}
