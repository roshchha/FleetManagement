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
using FleetManagement.Interfaces;
using FleetManagement.Entities;
using FleetManagement.Services;
using FleetManagement.Common;

public partial class ViewVehilcemaster : System.Web.UI.Page
{
    IEntityService<Vehicle> vehicleService = new VehicleService();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Common.IsAdminUser(this.Page))
        {
            Response.Redirect("~/AccessDenied.aspx");
        }
        if (!IsPostBack)
        {
            grdVehiclemaster.DataSource = vehicleService.Get();
            grdVehiclemaster.DataBind();
        }
    }
    protected void grdVehiclemaster_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdVehiclemaster.PageIndex = e.NewPageIndex;
        grdVehiclemaster.DataSource = vehicleService.Get();
        grdVehiclemaster.DataBind();
    }
    protected void grdVehiclemaster_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdVehiclemaster.EditIndex = -1;
        grdVehiclemaster.DataSource = vehicleService.Get();
        grdVehiclemaster.DataBind();
    }
    protected void grdVehiclemaster_RowEditing(object sender, GridViewEditEventArgs e)
    {

        GridViewRow row = grdVehiclemaster.Rows[e.NewEditIndex];
        HtmlInputHidden hdnVehicleID = (HtmlInputHidden)row.FindControl("HdnVehicleID");
        int vehicleID = int.Parse(hdnVehicleID.Value);
        Response.Redirect("Vehiclemaster.aspx?VehicleID=" + vehicleID);
    }
    protected void grdVehiclemaster_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = grdVehiclemaster.Rows[e.RowIndex];
        HtmlInputHidden hdnVehicleID = (HtmlInputHidden)row.FindControl("HdnVehicleID");
        int vehicleID = int.Parse(hdnVehicleID.Value);

        if (vehicleService.Delete(vehicleID))
        {

        }
        grdVehiclemaster.DataSource = vehicleService.Get();
        grdVehiclemaster.DataBind();
    }
    protected void grdVehiclemaster_PreRender(object sender, EventArgs e)
    {
        if (grdVehiclemaster.HeaderRow != null)
        {
            grdVehiclemaster.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

    }
}
