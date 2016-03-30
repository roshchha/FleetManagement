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

using FleetManagement;
using FleetManagement.Entities;
using FleetManagement.Services;
using System.Collections.Generic;
using FleetManagement.Interfaces;
using System.Linq;
using FleetManagement.Enums;
using FleetManagement.Common;

public partial class Vehiclemaster : System.Web.UI.Page
{
    IEntityService<VehicleType> vehicleTypeService = new VehicleTypeService();
    IEntityService<Vehicle> vehicleService = new VehicleService();

    int VehicleID = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["VehicleID"]))
        {
            int.TryParse(Request.QueryString["VehicleID"].ToString(), out VehicleID);
            this.HdnVehicleID.Value = VehicleID.ToString();
            this.btnSubmit.PostBackUrl = "Vehiclemaster.aspx";
        }
        if (!IsPostBack)
        {
            BindVehicleTypes();
            BindFuelType();
            BindAC();
            if (VehicleID > 0)
            {
                LoadData();
            }
            
        }
        lblMessage.Visible = false;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Vehicle vehicle = new Vehicle();
        int.TryParse(this.HdnVehicleID.Value, out VehicleID);
        if (VehicleID > 0)
        {
            vehicle.VehicleID = VehicleID;
        }

        vehicle.ChasisNo = txtChasisno.Text;
        vehicle.EngineNo = txtEngno.Text;
        vehicle.RegistrationNo = txtRegno.Text;
        vehicle.RegistrationDate = txtRegdate.Text.ToDateTime();
        vehicle.NoOfSeating = int.Parse(txtSeating.Text);
        vehicle.PurchaseDate = txtPurchasedate.Text.ToDateTime();
        vehicle.InsuranceExpirationDate = txtInsuranceexpdate.Text.ToDateTime();
        vehicle.InsuranceAmount = int.Parse(txtInsuranceamt.Text);
        vehicle.TankCapacity = int.Parse(txtTankcapacity.Text);
        vehicle.VehicleCost = decimal.Parse(txtVehiclecost.Text);
        vehicle.AC = ddlAc.SelectedValue == ((int)YesNo.Yes).ToString() ? true : false;
        vehicle.FuelType = int.Parse(ddlFueltype.SelectedValue);
        vehicle.VehicleType = int.Parse(ddlVehicletype.SelectedValue);
        vehicle.VehicleNo = txtVehicleNo.Text;

        bool success = false;
        if (VehicleID > 0)
        {
            success = vehicleService.Update(vehicle);
        }
        else
        {
            success = vehicleService.Insert(vehicle);
        }
        if (success)
        {
            lblMessage.Text = "Vehicle Details added sucessfully";
            lblMessage.Visible = true;
        }
        else
        {
            lblMessage.Text = "Error adding a vehicle!";
            lblMessage.Visible = true;
        }

        ClearEntries();
    }

    private void ClearEntries()
    {
        ddlVehicletype.SelectedIndex = 0;
        txtRegno.Text = "";
        txtRegdate.Text = "";
        txtEngno.Text = "";
        txtChasisno.Text = "";
        ddlFueltype.SelectedIndex = 0;
        txtTankcapacity.Text = "";
        txtSeating.Text = "";
        ddlAc.SelectedIndex = 0;
        txtVehiclecost.Text = "";
        txtPurchasedate.Text = "";
        txtInsuranceamt.Text = "";
        txtInsuranceexpdate.Text = "";
    }
    private void BindVehicleTypes()
    {
       List<VehicleType> vehicleTypes= vehicleTypeService.Get();
       ddlVehicletype.Items.Clear();
       ddlVehicletype.Items.Add(new ListItem("Select", "0"));
       vehicleTypes.ForEach(v => {
           ddlVehicletype.Items.Add(new ListItem(v.Name, v.ID.ToString()));
       });
    }

    private void BindFuelType()
    {
        ddlFueltype.Items.Clear();
        ddlFueltype.Items.AddRange(Common.ToListItems<FuelType>().ToArray());
    }
    private void BindAC()
    {
        ddlAc.Items.Clear();
        ddlAc.Items.AddRange(Common.ToListItems<YesNo>().ToArray());
    }
    private void LoadData()
    {
        Vehicle vehicle = vehicleService.Get(VehicleID).FirstOrDefault();
        if (vehicle != null)
        {
            txtChasisno.Text = vehicle.ChasisNo;
            txtEngno.Text = vehicle.EngineNo;
            txtRegno.Text = vehicle.RegistrationNo;
            txtRegdate.Text = vehicle.RegistrationDate.ToShortDateString();
            txtSeating.Text = vehicle.NoOfSeating.ToString();
            txtPurchasedate.Text = vehicle.PurchaseDate.ToShortDateString();
            txtInsuranceamt.Text = Math.Ceiling(vehicle.InsuranceAmount ?? 0).ToString();
            txtInsuranceexpdate.Text = vehicle.InsuranceExpirationDate.GetValueOrDefault().ToShortDateString();
            txtTankcapacity.Text = vehicle.TankCapacity.ToString();
            txtVehiclecost.Text = Math.Ceiling(vehicle.VehicleCost).ToString();
            txtVehicleNo.Text = vehicle.VehicleNo;
            ddlAc.SelectedValue = (vehicle.AC ? (int)YesNo.Yes : (int)YesNo.No).ToString();
            ddlFueltype.SelectedValue = vehicle.FuelType.ToString();
            ddlVehicletype.SelectedValue = vehicle.VehicleType.ToString();


        }
    }
}
