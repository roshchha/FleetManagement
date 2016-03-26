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
using FleetManagement.Entities;
using FleetManagement.Interfaces;
using FleetManagement.Services;

public partial class Viewcustomers : System.Web.UI.Page
{
    IEntityService<Customer> customerService = new CustomerService();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            grdCustomers.DataSource = customerService.Get();
            grdCustomers.DataBind();

        }
    }
    protected void grdCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdCustomers.PageIndex = e.NewPageIndex;
        grdCustomers.DataSource = customerService.Get();
        grdCustomers.DataBind();
    }
    protected void grdCustomers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdCustomers.EditIndex = -1;
        grdCustomers.DataSource = customerService.Get();
        grdCustomers.DataBind();
    }
    protected void grdCustomers_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = grdCustomers.Rows[e.RowIndex];
        HtmlInputHidden hdnCustomerID = (HtmlInputHidden)row.FindControl("HdnCustomerID");
        int customerID = int.Parse(hdnCustomerID.Value);
        if (customerService.Delete(customerID))
        {

        }

        grdCustomers.DataSource = customerService.Get();
        grdCustomers.DataBind();
    }
    protected void grdCustomers_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewRow row = grdCustomers.Rows[e.NewEditIndex];
        HtmlInputHidden hdnCustomerID = (HtmlInputHidden)row.FindControl("HdnCustomerID");
        int customerID = int.Parse(hdnCustomerID.Value);
        Response.Redirect("customers.aspx?CustomerID=" + customerID);
    }
   
   
    protected void grdCustomers_PreRender(object sender, EventArgs e)
    {
        if (grdCustomers.HeaderRow != null)
        {
            grdCustomers.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

    }
}
