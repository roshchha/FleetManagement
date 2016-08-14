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
    IVehicleService vehicleService = new VehicleService();
    IEntityService<ServiceLog> serviceLogService = new ServiceLogService();

    private int ID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Visible = false;
        if (!IsPostBack)
        {
            List<Vehicle> lstVehicles = vehicleService.Get();


            ddlVehicleno.DataSource = lstVehicles.Select(v => new { VehicleID = v.VehicleID, VehicleNo = v.VehicleNo });
            ddlVehicleno.DataValueField = "VehicleID";
            ddlVehicleno.DataTextField = "VehicleNo";
            ddlVehicleno.DataBind();
            ddlVehicleno.Items.Insert(0, new ListItem("Select"));
        }
        if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
        {
            int.TryParse(Request.QueryString["ID"].ToString(), out ID);
            this.HdnID.Value = ID.ToString();
            this.btnSubmit.PostBackUrl = "Service.aspx";
        }
        if (!IsPostBack)
        {
            if (ID > 0)
            {
                LoadData();
            }
        }

    }
    private void LoadData()
    {
        ServiceLog serviceLog = serviceLogService.Get(ID).FirstOrDefault();
        if (serviceLog != null)
        {
            ddlVehicleno.SelectedValue = serviceLog.VehicleID.ToString();
            ddlVehicleno.Enabled = false;



            txtServicingdate.Text = serviceLog.SentDate.ToShortDateTimeString();
            txtMeterReading.Text = serviceLog.MileageReading.ToString();
            txtReasonforservice.Text = serviceLog.ServiceReason.ToString();
            txtExpenditureonspares.Text = serviceLog.SparesExpenditure.ToString();
            txtExpenditureonmanpower.Text = serviceLog.LabourExpenditure.ToString();
            txtNextservicedate.Text = serviceLog.NextServiceDate.ToShortDateTimeString();
           
        }
        else
        {
            this.HdnID.Value = "0";
        }


    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        ServiceLog obj = new ServiceLog();


        int.TryParse(this.HdnID.Value, out ID);
        if (ID > 0)
        {
            obj.ID = ID;
        }

        obj.LabourExpenditure = decimal.Parse(txtExpenditureonmanpower.Text.ToString());
        obj.MileageReading = int.Parse(txtMeterReading.Text);
        obj.NextServiceDate = txtNextservicedate.Text.ToDateTime();
        obj.SentDate = txtServicingdate.Text.ToDateTime();
        obj.ServiceReason = txtReasonforservice.Text;
        obj.SparesExpenditure = decimal.Parse(txtExpenditureonspares.Text);
        obj.VehicleID = int.Parse(ddlVehicleno.SelectedValue);
        if (ID > 0)
        {
            serviceLogService.Update(obj);
            lblMessage.Text = "Accident details updated successfully";
        }
        else
        {
            serviceLogService.Insert(obj);
            lblMessage.Text = "Accident details added successfully";
        }

        
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
