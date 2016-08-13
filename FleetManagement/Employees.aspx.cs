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
using FleetManagement.Enums;
using System.Collections.Generic;
using System.Linq;
using FleetManagement.Interfaces;
using FleetManagement.Services;
using FleetManagement.Common;

public partial class Employees : System.Web.UI.Page
{
    IEntityService<Employee> employeeService = new EmployeeService();

    private int EmpID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Common.IsStaffUser(this.Page))
        {
            Response.Redirect("~/AccessDenied.aspx");
        }
        lblMessage.Visible = false;
        if (!string.IsNullOrEmpty(Request.QueryString["EmpID"]))
        {
            int.TryParse(Request.QueryString["EmpID"].ToString(), out EmpID);
            this.HdnEmpID.Value = EmpID.ToString();
            this.btnSubmit.PostBackUrl = "Employees.aspx";
        }
        if (!IsPostBack)
        {
            BindDesignation();
            BindCountries();
            if (EmpID > 0)
            {
                LoadData();
            }
        }
    }
    private void BindCountries()
    {
        ddlCountry.Items.Clear();
        ddlCountry.Items.AddRange(Common.ToListItems<FleetManagement.Enums.Country>().ToArray());
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try {

            Employee emp = new Employee();

            int.TryParse(this.HdnEmpID.Value, out EmpID);
            if(EmpID > 0){
                emp.EmpID = EmpID;
            }
            emp.FirstName = txtFirstname.Text;
            emp.LastName = txtLastName.Text;
            emp.DateOfBirth = DateTime.Parse(txtDob.Text);
            emp.Qualification = "";
            emp.DateOfJoin = DateTime.Parse(txtJoiningdate.Value);
            emp.Qualification = ddlQualification.SelectedItem.Text;
            emp.DesignationID = int.Parse(ddlDesignation.SelectedValue);
            emp.Salary = decimal.Parse(txtSalery.Text);
            emp.Address = txtAddress.Text;
            emp.Country = ddlCountry.SelectedItem.Text;
            emp.State = txtState.Text;
            emp.Phone = txtContactno.Text;
            emp.EmailID = txtEmailid.Text;

            bool success = false;
            if (EmpID > 0)
            {
                success = employeeService.Update(emp);
            }
            else
            {
                success = employeeService.Insert(emp);
            }
            if (success)
            {
                lblMessage.Text = "Employee details added sucessfully";
                lblMessage.Visible = true;
            }
            else
            {
                lblMessage.Text = "Error adding an employee!";
                lblMessage.Visible = true;
            }
            ClearEntries();
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error adding an employee!";
            lblMessage.Visible = true;
        }
        
    }
    private void ClearEntries()
    {
        txtFirstname.Text = "";
        txtLastName.Text = "";
        ddlDesignation.SelectedIndex = 0;
        txtSalery.Text = "";
        txtJoiningdate.Value = "";
        ddlQualification.SelectedIndex = 0;
        txtDob.Text = "";
        txtAddress.Text = "";
        ddlCountry.SelectedIndex = 0;
        txtState.Text = "";
        txtContactno.Text = "";
        txtEmailid.Text = "";
    }
    private void BindDesignation()
    {
        List<Designation> lstDesignation = Designation.Get();
        ddlDesignation.Items.Clear();
        ddlDesignation.Items.Add(new ListItem("Select", "0"));
        lstDesignation.ForEach(d => {
            ddlDesignation.Items.Add(new ListItem(d.DesignationName, d.DesignationID.ToString()));
        });
    }
    private void LoadData()
    {
        Employee employee =  employeeService.Get(EmpID).FirstOrDefault();
        if (employee != null)
        {
            this.txtFirstname.Text = employee.FirstName;
            this.txtLastName.Text = employee.LastName;

            txtDob.Text = employee.DateOfBirth.ToShortDateString();
            txtJoiningdate.Value = employee.DateOfJoin.ToShortDateString();
            txtSalery.Text = Math.Ceiling(employee.Salary).ToString();
            txtAddress.Text = employee.Address;
            txtContactno.Text = employee.Phone;
            txtEmailid.Text = employee.EmailID;
            txtState.Text = employee.State;
            ddlQualification.SelectedValue = employee.Qualification;
            ddlDesignation.SelectedValue = employee.DesignationID.ToString();
            FleetManagement.Enums.Country country;
            if (Enum.TryParse(employee.Country, out country))
            {
                this.ddlCountry.SelectedValue = ((int)country).ToString();
            }
        }
        else
        {
            this.HdnEmpID.Value = "0";
        }
      

    }
}
