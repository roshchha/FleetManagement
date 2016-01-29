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
using Management;

public partial class Vehicletariff : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connect"]);
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
        SqlCommand cmdGet = new SqlCommand("select count(*) from tariff where vehicletype='" + ddlVehicletype.SelectedItem.Text + "'", con);
        con.Open();
        int count = int.Parse(cmdGet.ExecuteScalar().ToString());
        con.Close();
        if (count <=2)
        {
            string tariffInsert = "insert into tariff values('" + ddlVehicletype.SelectedItem.Text + "','" + ddlAc.SelectedItem.Text + "'," + txtBaseprice.Text + ",'" + txtKms.Text + "'," + txtExtrakm.Text + "," + txtExtrahour.Text + "," + txtStandcharges.Text + ")";
            SqlCommand cmdInsert = new SqlCommand(tariffInsert, con);
            con.Open();
            cmdInsert.ExecuteNonQuery();
            con.Close();
            lblMessage.Text = "Vehicle tariff Details added sucessfully";
            lblMessage.Visible = true;
            ddlVehicletype.SelectedIndex = 0;
            ddlAc.SelectedIndex = 0;
            txtBaseprice.Text = "";
            txtKms.Text = "";
            txtExtrakm.Text = "";
            txtExtrahour.Text = "";
            txtStandcharges.Text = "";
        }
        else
        {
            lblMessage.Text = "The tariff plan for vehicle already exists";
            lblMessage.Visible = true;
            ddlVehicletype.SelectedIndex = 0;
            ddlAc.SelectedIndex = 0;
            txtBaseprice.Text = "";
            txtKms.Text = "";
            txtExtrakm.Text = "";
            txtExtrahour.Text = "";
            txtStandcharges.Text = "";
        }
    }
}
