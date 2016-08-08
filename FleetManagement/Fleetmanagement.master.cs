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
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

public partial class Fleetmanagement : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.Page.User.Identity.IsAuthenticated)
        {
            Response.Redirect("Default.aspx");
        }
        if (FleetManagement.Common.Common.IsAdminUser(Page))
        {
            NodesRPT.DataSourceID = "AdminSiteMapDataSource";
        }
        else
        {
            NodesRPT.DataSourceID = "DefaultSiteMapDataSource";
        }
        NodesRPT.DataBind();
    }
}
