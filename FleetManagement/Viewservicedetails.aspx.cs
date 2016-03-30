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
using FleetManagement.Services;
using FleetManagement.Entities;
using FleetManagement.Interfaces;

public partial class Viewservicedetails : System.Web.UI.Page
{
    IEntityService<ServiceLog> serviceLogService = new ServiceLogService();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            grdSevice.DataSource = serviceLogService.Get();
            grdSevice.DataBind();
        }
    }

    protected void grdSevice_RowEditing(object sender, GridViewEditEventArgs e)
    {

        GridViewRow row = grdSevice.Rows[e.NewEditIndex];
        HtmlInputHidden hdnID = (HtmlInputHidden)row.FindControl("HdnID");
        int ID = int.Parse(hdnID.Value);
        Response.Redirect("service.aspx?ID=" + ID);
    }

    protected void grdSevice_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = grdSevice.Rows[e.RowIndex];
        HtmlInputHidden hdnID = (HtmlInputHidden)row.FindControl("HdnID");
        int ID = int.Parse(hdnID.Value);

        if (serviceLogService.Delete(ID))
        {

        }
        grdSevice.DataSource = serviceLogService.Get();
        grdSevice.DataBind();
    }
    protected void grdSevice_PreRender(object sender, EventArgs e)
    {
        if (grdSevice.HeaderRow != null)
        {
            grdSevice.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

    }
}
