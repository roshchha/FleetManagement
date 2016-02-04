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
public partial class Login : System.Web.UI.Page
{
    Cabs objcab = new Cabs();
    protected void Page_Load(object sender, EventArgs e)
    {
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "CustomValidationTestForFirstName", "var txtName='" + this.txtName.ClientID + "'", true);
       //Page.ClientScript.RegisterStartupScript(this.GetType(), "CustomValidationTestForFirstName", "var txtTestForLength='" + this.txtTest.ClientID + "';", true); 
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {      
        //int count = objcab.getCount(txtName.Text, txtPassword.Text);
        if (true)
        {
            Label1.Visible = false;
            Response.Redirect("Home.aspx");
            
        }
        else
        {
            Label1.Visible = true;
            Label1.Text = "Invalid Credentials";
        }
        
    }
   
}
