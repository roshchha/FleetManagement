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

public partial class vehecletype : System.Web.UI.Page
{
    Cabs objcabs = new Cabs();
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        objcabs.insertvehicle(txtName.Text);
        lblMessage.Visible = true;
        txtName.Text = "";
    }
}
