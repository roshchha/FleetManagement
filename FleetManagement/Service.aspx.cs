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
using System.Collections.Generic;
using FleetManagement.Entities;
using System.Linq;
using FleetManagement.Common;

public partial class Service : System.Web.UI.Page
{
    IVehicleService verhicleService = new VehicleService();
    IEntityService<ServiceLog> serviceLogService = new ServiceLogService();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Visible = false;
        if (!IsPostBack)
        {
            List<Vehicle> lstVehicles = verhicleService.Get();


            ddlVehicleno.DataSource = lstVehicles.Select(v => new { VehicleID = v.VehicleID, VehicleNo = v.VehicleNo });
            ddlVehicleno.DataValueField = "VehicleID";
            ddlVehicleno.DataTextField = "VehicleNo";
            ddlVehicleno.DataBind();
            ddlVehicleno.Items.Insert(0, new ListItem("Select"));

        }

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        ServiceLog obj = new ServiceLog();
        obj.LabourExpenditure = decimal.Parse(txtExpenditureonmanpower.ToString());
        obj.MileageReading = int.Parse(txtMeterReading.Text);
        obj.NextServiceDate = txtNextservicedate.Text.ToDateTime();
        obj.SentDate = txtServicingdate.Text.ToDateTime();
        obj.ServiceReason = txtReasonforservice.Text;
        obj.SpareExpenditure = decimal.Parse(txtExpenditureonspares.Text);
        obj.VehicleID = int.Parse(ddlVehicleno.SelectedValue);
        serviceLogService.Insert(obj);

        lblMessage.Text = "Accident details added successfully";
        lblMessage.Visible = true;
        ddlVehicleno.SelectedIndex = 0;
        txtExpenditureonmanpower.Text = "";
        txtExpenditureonspares.Text = "";
        txtMeterReading.Text = "";
        txtNextservicedate.Text = "";
        txtReasonforservice.Text = "";
        txtServicingdate.Text = "";
    }
}
