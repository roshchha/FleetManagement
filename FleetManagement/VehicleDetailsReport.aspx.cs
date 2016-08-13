using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FleetManagement
{
    public partial class VehicleDetailsReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Common.Common.IsSuperAdminUser(this.Page))
            {
                Response.Redirect("~/AccessDenied.aspx");
            }
        }
    }
}