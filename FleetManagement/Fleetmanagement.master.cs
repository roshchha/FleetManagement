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
using FleetManagement.Common;
using FleetManagement.Enums;
using System.Globalization;
using System.Threading;

public partial class Fleetmanagement : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CultureInfo cultureInfo = new CultureInfo("en-US");
        Thread.CurrentThread.CurrentCulture = cultureInfo;
        Thread.CurrentThread.CurrentUICulture = cultureInfo;
        if (!this.Page.User.Identity.IsAuthenticated)
        {
            Response.Redirect("Login.aspx");
        }
        if (Common.GetCurrentUserRole(Page) == UserRoles.SuperAdmin)
        {
            NodesRPT.DataSourceID = "SuperAdminSiteMapDataSource";
        }
        else if (Common.GetCurrentUserRole(Page) == UserRoles.Admin)
        {
            NodesRPT.DataSourceID = "AdminSiteMapDataSource";
        }
        else
        {
            NodesRPT.DataSourceID = "StaffSiteMapDataSource";
        }
        NodesRPT.DataBind();
    }
}
