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

public partial class Clientbooking : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connect"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Visible = false;
        if (!IsPostBack)
        {
            Cabs objGetvehicles = new Cabs();
            DataSet dsGetvehicles = new DataSet();
            dsGetvehicles = objGetvehicles.getVehicles();
            ddlVehicletype.DataSource = dsGetvehicles;
            ddlVehicletype.DataTextField = "vehicleName";
            ddlVehicletype.DataBind();
            ddlVehicletype.Items.Insert(0, "Select");
            SqlDataAdapter daGetclient = new SqlDataAdapter("select  name from customers", con);
            DataSet dsGetclient = new DataSet();
            daGetclient.Fill(dsGetclient);
            ddlCustomername.DataSource = dsGetclient;
            ddlCustomername.DataTextField = "name";
            ddlCustomername.DataBind();
            ddlCustomername.Items.Insert(0, "Select");           
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
        string insertvalues = "insert into customerbooking(customername, address, phoneno, email, vehicletype, guestname, pickup, droppoint, fromdate, todate) values('" + ddlCustomername.SelectedItem.Text + "', '" + txtAddress.Text + "', '" + txtPhoneno.Text + "', '" + txtEmail.Text + "', '" +ddlVehicletype.SelectedItem.Text+"','"+txtGuestname.Text+"','"+ txtPickup.Text + "','" + txtDroppoint.Text + "', '" + txtFromdate.Text + "', '" + txtTodate.Text + "')";
        SqlCommand cmd = new SqlCommand(insertvalues, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        lblMessage.Text = "Customer details added sucessfully";
        lblMessage.Visible = true;
        ddlCustomername.SelectedIndex = 0;
        ddlVehicletype.SelectedIndex = 0;
        txtAddress.Text = "";
        txtPhoneno.Text = "";
        txtEmail.Text = "";
        txtGuestname.Text = "";
        txtPickup.Text = "";
        txtDroppoint.Text = "";
        txtFromdate.Text = "";
        txtTodate.Text = "";
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}
