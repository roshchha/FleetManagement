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

public partial class Employees : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connect"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Visible = false;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string insemp="insert into a_employee values('" + txtFirstname.Text + "', '" + txtLastName.Text + "', '" + ddlDesignation.SelectedItem.Text + "', " + txtSalery.Text + ", '" + txtJoiningdate.Value + "', '" + ddlQualification.SelectedItem.Text + "','" + txtDob.Text + "', '" + txtAddress.Text + "', '" + ddlCountry.SelectedItem.Text + "','" + txtState.Text + "', '" + txtContactno.Text + "', '" + txtEmailid.Text + "')";
        SqlCommand cmd = new SqlCommand(insemp, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        lblMessage.Text = "Employee details added sucessfully";
        lblMessage.Visible = true;
        txtFirstname.Text = "";
        txtLastName.Text = "";
        ddlDesignation.SelectedIndex = 0;
        txtSalery.Text = "";
        txtJoiningdate.Value = "";
        ddlQualification.SelectedIndex = 0;
        txtDob.Text = "";
        txtAddress.Text = "";
        ddlCountry.SelectedIndex = 0;
        txtState.Text = "";
        txtContactno.Text = "";
        txtEmailid.Text = "";
    }
    
}
