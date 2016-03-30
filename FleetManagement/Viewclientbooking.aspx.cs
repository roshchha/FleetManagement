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
using FleetManagement.Services;

public partial class Viewclientbooking : System.Web.UI.Page
{
    ICustomerBookingService customerBookingService = new CustomerBookingService();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            grdClient.DataSource = customerBookingService.Get();
            grdClient.DataBind();
        }
    }

    protected void grdClient_PreRender(object sender, EventArgs e)
    {

        if (grdClient.HeaderRow != null)
        {
            grdClient.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    }
   
  
    //protected void grdClient_RowEditing(object sender, GridViewEditEventArgs e)
    //{
    //    grdClient.EditIndex = e.NewEditIndex;
    //   
    //}
   
}
