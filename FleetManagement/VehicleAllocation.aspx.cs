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

public partial class VehicleAllocation : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!FleetManagement.Common.Common.IsAdminUser(this.Page))
        {
            Response.Redirect("~/AccessDenied.aspx");
        }


    }

    protected void btnSubmit_Click1(object sender, EventArgs e)
    {
       
                
    }
}
