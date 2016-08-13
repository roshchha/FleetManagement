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

using FleetManagement.Entities;
using FleetManagement.Services;
using FleetManagement;
using FleetManagement.Interfaces;

public partial class designation : System.Web.UI.Page
{
    IEntityService<Designation> designationService = new DesignationService();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!FleetManagement.Common.Common.IsAdminUser(this.Page))
        {
            Response.Redirect("~/AccessDenied.aspx");
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Designation obj = new Designation();
        obj.DesignationName = txtName.Text;
        if (designationService.Insert(obj))
        {
            lblMessage.Text = "Designation inserted successfully";
        }
        else
        {
            lblMessage.Text = "Error adding Designation";
        }

    }
}
