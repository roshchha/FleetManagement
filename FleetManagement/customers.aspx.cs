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
using System.Collections.Generic;
using System.Linq;
using FleetManagement.Common;
public partial class customers : System.Web.UI.Page
{

    IEntityService<Customer> customerService = new CustomerService();

    private int CustomerID;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Visible = false;
        if (!string.IsNullOrWhiteSpace(Request.QueryString["CustomerID"]))
        {
            int.TryParse(Request.QueryString["CustomerID"].ToString(), out CustomerID);
            this.hdnCustomerID.Value = CustomerID.ToString();
            this.btnSubmit.PostBackUrl = "Customers.aspx";
        }

        if (!IsPostBack)
        {
            BindCountries();
            if (CustomerID > 0)
            {
                LoadData();
            }
        }
        txtPhoneno.Attributes.Add("onkeydown", "numbersOnly(event)");
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Customer customer = new Customer();

        bool updateOrInsert = true;
        int.TryParse(this.hdnCustomerID.Value, out CustomerID);
        if (CustomerID > 0)
        {
            customer.ID = CustomerID;
        }
        else
        {
            List<Customer> customers = customerService.Get();
            if (customers.Any(c => c.Name == txtCustomername.Text.Trim() && c.Email == txtEmail.Text.Trim()))
            {
                lblMessage.Text = "Customer already exists";
                lblMessage.Visible = true;
                updateOrInsert = false;
            }
        }
        if (updateOrInsert)
        {

            customer.Name = txtCustomername.Text.Trim();
            customer.Address = txtAddress.Text.Trim();
            customer.Country = ddlCountry.SelectedItem.Text;
            customer.Email = txtEmail.Text.Trim();
            customer.Phone = txtPhoneno.Text.Trim();
            customer.State = txtState.Text.Trim();
            bool isSuccess = false;
            if (CustomerID > 0)
            {
                isSuccess = customerService.Update(customer);
            }
            else
            {
                isSuccess = customerService.Insert(customer);
            }
            if (isSuccess)
            {
                lblMessage.Text = "Customer details added sucessfully";
                lblMessage.Visible = true;
            }
            else
            {
                lblMessage.Text = "Error adding new customer!";
                lblMessage.Visible = true;
            }
        }
        ClearEntries();

    }
    private void BindCountries()
    {
        ddlCountry.Items.Clear();
        ddlCountry.Items.AddRange(Common.ToListItems<FleetManagement.Enums.Country>().ToArray());
    }
    private void LoadData()
    {
        Customer customer = customerService.Get(CustomerID).FirstOrDefault();
        if (customer != null)
        {
            this.txtCustomername.Text = customer.Name;
            this.txtEmail.Text = customer.Email;
            this.txtAddress.Text = customer.Address;
            this.txtPhoneno.Text = customer.Phone;
            this.txtState.Text = customer.State;
            FleetManagement.Enums.Country country;
            if (Enum.TryParse(customer.Country, out country))
            {
                this.ddlCountry.SelectedValue = ((int)country).ToString();
            }
        }
        else
        {//customer doesn't exist ,so make this field's value as 0
            this.hdnCustomerID.Value = "0";
        }
    }
    private void ClearEntries()
    {
        txtCustomername.Text = "";
        txtAddress.Text = "";
        ddlCountry.SelectedIndex = 0;
        txtState.Text = "";
        txtPhoneno.Text = "";
        txtEmail.Text = "";
    }
}
