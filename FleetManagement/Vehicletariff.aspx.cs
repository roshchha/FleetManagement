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
using System.Collections.Generic;
using FleetManagement.Common;
using FleetManagement.Enums;
using System.Linq;

public partial class Vehicletariff : System.Web.UI.Page
{
    IEntityService<VehicleType> vehicleTypeService = new VehicleTypeService();
    IEntityService<Tariff> tariffService = new TariffService();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (FleetManagement.Common.Common.IsStaffUser(Page))
        {
            Response.Redirect("~/AccessDenied.aspx");
        }
        if (!IsPostBack)
        {
            BindVehicleTypes();
            BindFuelType();
            BindAC();
        }
        lblMessage.Visible = false;
        txtKms.Attributes.Add("onkeydown", "numbersOnly(event)");
        txtBaseprice.Attributes.Add("onkeydown", "numbersOnly(event)");
        txtExtrahour.Attributes.Add("onkeydown", "numbersOnly(event)");
        txtExtrakm.Attributes.Add("onkeydown", "numbersOnly(event)");
        txtStandcharges.Attributes.Add("onkeydown", "numbersOnly(event)");

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        List<Tariff> tariffs = tariffService.Get();
        if (tariffs.Where(t => t.VehicleType == int.Parse(ddlVehicletype.SelectedValue)).Count() >= 4)
        {
            lblMessage.Text = "The tariff plan for vehicle already exists";
            lblMessage.Visible = true;
        }
        else
        {
            Tariff obj = new Tariff();
            obj.AC = Convert.ToInt32(ddlAc.SelectedValue) == (int)YesNo.Yes ? true : false;
            obj.BasePrice = decimal.Parse(txtBaseprice.Text);
            obj.ExtraHourRate = decimal.Parse(txtExtrahour.Text);
            obj.ExtraKmRate = decimal.Parse(txtExtrakm.Text);
            obj.FuelType = int.Parse(ddlFuelType.SelectedValue);
            obj.Kms = int.Parse(txtKms.Text);
            obj.StandCharges = decimal.Parse(txtStandcharges.Text);
            obj.VehicleType = int.Parse(ddlVehicletype.SelectedValue);

            if (tariffService.Insert(obj))
            {
                lblMessage.Text = "Vehicle tariff Details added sucessfully";
            }
            else
            {
                lblMessage.Text = "Error adding vehicle tariff Details!";
            }
            lblMessage.Visible = true;
        }
        ClearEntries();
    }

    private void ClearEntries()
    {
        ddlVehicletype.SelectedIndex = 0;
        ddlAc.SelectedIndex = 0;
        txtBaseprice.Text = "";
        txtKms.Text = "";
        txtExtrakm.Text = "";
        txtExtrahour.Text = "";
        txtStandcharges.Text = "";
    }
    private void BindFuelType()
    {
        ddlFuelType.Items.Clear();
        ddlFuelType.Items.AddRange(Common.ToListItems<FuelType>().ToArray());
    }
    private void BindVehicleTypes()
    {
        List<VehicleType> vehicleTypes = vehicleTypeService.Get();
        ddlVehicletype.Items.Clear();
        ddlVehicletype.Items.Add(new ListItem("Select", "0"));
        vehicleTypes.ForEach(v =>
        {
            ddlVehicletype.Items.Add(new ListItem(v.Name, v.ID.ToString()));
        });
    }
    private void BindAC()
    {
        ddlAc.Items.Clear();
        ddlAc.Items.AddRange(Common.ToListItems<YesNo>().ToArray());
    }
}
