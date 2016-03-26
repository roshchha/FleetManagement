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
using FleetManagement;
using FleetManagement.Services;
using FleetManagement.Interfaces;


public partial class Employeedetails : System.Web.UI.Page
{
    IEntityService<Employee> employeeService = new EmployeeService();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            grdEmp.DataSource = employeeService.Get();
            grdEmp.DataBind();
        }
    }

    protected void grdEmp_RowEditing(object sender, GridViewEditEventArgs e)
    {
       
        GridViewRow row = grdEmp.Rows[e.NewEditIndex];
        HtmlInputHidden hdnEmpID = (HtmlInputHidden)row.FindControl("HdnEmpID");
        int empID = int.Parse(hdnEmpID.Value);
        Response.Redirect("Employees.aspx?EmpID=" + empID);
    }
    protected void grdEmp_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {       
            grdEmp.EditIndex = -1;
            grdEmp.DataSource = employeeService.Get();
            grdEmp.DataBind();
    }
    protected void grdEmp_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdEmp.PageIndex = e.NewPageIndex;
        grdEmp.DataSource = employeeService.Get();
        grdEmp.DataBind();
    }
    protected void grdEmp_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = grdEmp.Rows[e.RowIndex];
        HtmlInputHidden hdnEmpID = (HtmlInputHidden)row.FindControl("HdnEmpID");
        int empID = int.Parse(hdnEmpID.Value);

        if (employeeService.Delete(empID))
        {

        }
        grdEmp.DataSource = employeeService.Get();
        grdEmp.DataBind();
    }
   

    protected void grdEmp_PreRender(object sender, EventArgs e)
    {
        if (grdEmp.HeaderRow != null)
        {
            grdEmp.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

    }
}
