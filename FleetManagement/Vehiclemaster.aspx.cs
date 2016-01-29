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

public partial class Vehiclemaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Cabs objGetvehicles = new Cabs();
            DataSet dsGetvehicles = new DataSet();
            dsGetvehicles = objGetvehicles.getVehicles();
            ddlVehicletype.DataSource = dsGetvehicles;            
            ddlVehicletype.DataTextField = "vehicleName";            
            ddlVehicletype.DataBind();
            ddlVehicletype.Items.Insert(0, "Select");
        }
        lblMessage.Visible = false;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Cabs objInsertvehicles = new Cabs();
        objInsertvehicles.insertVehiclemaster(ddlVehicletype.SelectedItem.Text, txtRegno.Text, txtRegdate.Text, txtEngno.Text, txtChasisno.Text,  ddlFueltype.SelectedItem.Text,
                                              int.Parse(txtTankcapacity.Text), int.Parse(txtSeating.Text), ddlAc.SelectedItem.Text, int.Parse(txtVehiclecost.Text), txtPurchasedate.Text, int.Parse(txtInsuranceamt.Text), txtInsuranceexpdate.Text);
        lblMessage.Text = "Vehicle Details added sucessfully";
        lblMessage.Visible = true;
        ddlVehicletype.SelectedIndex = 0;
        txtRegno.Text = "";
        txtRegdate.Text = "";
        txtEngno.Text = "";
        txtChasisno.Text = "";
        ddlFueltype.SelectedIndex = 0;
        txtTankcapacity.Text = "";
        txtSeating.Text = "";
        ddlAc.SelectedIndex = 0;
        txtVehiclecost.Text = "";
        txtPurchasedate.Text = "";
        txtInsuranceamt.Text = "";
        txtInsuranceexpdate.Text = "";
    }
}
