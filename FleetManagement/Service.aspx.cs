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

public partial class Service : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connect"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Visible = false;
        if (!IsPostBack)
        {
            string getvehicleno = "select regno from a_vehiclemaster";          
            SqlDataAdapter daGetvehicleno = new SqlDataAdapter(getvehicleno, con);
            DataSet dsGetvehicleno = new DataSet();
            daGetvehicleno.Fill(dsGetvehicleno, "regno");          
            ddlVehicleno.DataSource = dsGetvehicleno;
            ddlVehicleno.DataValueField = "regno";            
            ddlVehicleno.DataBind();
            ddlVehicleno.Items.Insert(0, new ListItem("Select"));
          
        }

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string insertDetails = "insert into servicelog  values('" + ddlVehicleno.SelectedItem.Text + "', '" + txtServicingdate.Text + "','" + txtMeterReading.Text + "','" + txtReasonforservice.Text + "','" + txtExpenditureonspares.Text + "','" + txtExpenditureonmanpower.Text + "','" + txtNextservicedate.Text + "')";
        SqlCommand cmdInsert = new SqlCommand(insertDetails, con);
        con.Open();
        cmdInsert.ExecuteNonQuery();
        con.Close();
        lblMessage.Text = "Accident details added successfully";
        lblMessage.Visible = true;
        ddlVehicleno.SelectedIndex = 0;
        txtExpenditureonmanpower.Text = "";
        txtExpenditureonspares.Text = "";
        txtMeterReading.Text = "";
        txtNextservicedate.Text = "";
        txtReasonforservice.Text = "";
        txtServicingdate.Text = "";
    }
}
