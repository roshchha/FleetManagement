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

public partial class Accidentdetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connect"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Visible = false;
        if (!IsPostBack)
        {
            string getvehicleno="select regno from a_vehiclemaster";
            string getdriver="select firstname from a_employee where designation='driver'";
            SqlDataAdapter daGetvehicleno = new SqlDataAdapter(getvehicleno, con);
            DataSet dsGetvehicleno = new DataSet();
            daGetvehicleno.Fill(dsGetvehicleno,"regno");
            daGetvehicleno.SelectCommand = new SqlCommand(getdriver, con);
            daGetvehicleno.Fill(dsGetvehicleno, "driver");
            ddlVehicleno.DataSource = dsGetvehicleno;
            ddlVehicleno.DataValueField = "regno";
            ddlVehicleno.DataMember = "regno";
            ddlVehicleno.DataBind();
            ddlVehicleno.Items.Insert(0, new ListItem("Select"));
            ddlDrivername.DataSource = dsGetvehicleno;
            ddlDrivername.DataMember = "driver";
            ddlDrivername.DataValueField = "firstname";
            ddlDrivername.DataBind();
            ddlDrivername.Items.Insert(0, new ListItem("Select"));
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string insertDetails = "insert into accidentdetails values('" + ddlVehicleno.SelectedItem.Text + "', '" + txtAccidentdate.Text + "','" + txtAccidentlocation.Text + "','" + txtAccidentdetails.Text + "','" + txtNatureofdamage.Text + "','" + txtEstimatedcostofrepair.Text + "','" + ddlDrivername.SelectedItem.Text + "')";
        SqlCommand cmdInsert = new SqlCommand(insertDetails, con);
        con.Open();
        cmdInsert.ExecuteNonQuery();
        con.Close();
        lblMessage.Text = "Accident details added successfully";
        lblMessage.Visible = true;
        ddlVehicleno.SelectedIndex = 0;
        txtEstimatedcostofrepair.Text = "";
        txtAccidentdate.Text = "";
        txtAccidentdetails.Text = "";
        txtAccidentlocation.Text = "";
        txtNatureofdamage.Text = "";
        ddlDrivername.SelectedIndex = 0;
    }
}
