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
public partial class customers : System.Web.UI.Page
{
    
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connect"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Visible = false;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlCommand cmdCount = new SqlCommand("select count(*) from customers where name='" + txtCustomername.Text + "'", con);
        con.Open();
        int count = (int)cmdCount.ExecuteScalar();
        if (count > 0)
        {
            lblMessage.Text = "Customer already exists";
            lblMessage.Visible = true;
        }
        else
        {
            string insemp = "insert into customers values('" + txtCustomername.Text + "',  '" + txtAddress.Text + "',  '" + txtPhoneno.Text + "', '" + txtEmail.Text + "','" + ddlCountry.SelectedItem.Text + "','" + txtState.Text + "')";
            SqlCommand cmd = new SqlCommand(insemp, con);
            cmd.ExecuteNonQuery();            
            lblMessage.Text = "Customer details added sucessfully";
            lblMessage.Visible = true;
            txtCustomername.Text = "";
            txtAddress.Text = "";
            ddlCountry.SelectedIndex = 0;
            txtState.Text = "";
            txtPhoneno.Text = "";
            txtEmail.Text = "";
        }
        con.Close();
    }
}
