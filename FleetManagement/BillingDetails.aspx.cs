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
using FleetManagement.Services;
using FleetManagement.Interfaces;
using FleetManagement.Entities;
using System.Collections.Generic;
using System.Linq;
using FleetManagement.Common;
public partial class BillingDetails : System.Web.UI.Page
{
    ICustomerBookingService customerBookingService = new CustomerBookingService();
    IEntityService<CustomerBilling> customerBillingService = new CustomerBillingService();

    List<CustomerBooking> pendingBookingsForBilling = new List<CustomerBooking>();
    public CustomerBooking CurrentBooking = null;
    decimal GrossAmount = 0;
    decimal TotalAmount = 0;
    decimal Discount = 0;
    long OutMeterReading, InMeterReading = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Visible = false;
        if (!IsPostBack || Session["PendingBookingsForBilling"] == null)
        {
            pendingBookingsForBilling = customerBookingService.GetPendingBookingsForBilling();
            ddlBookingRef.Items.Clear();
            ddlBookingRef.Items.Add(new ListItem("Select", "0"));
            if(pendingBookingsForBilling.Count > 0){
            Session["PendingBookingsForBilling"] = pendingBookingsForBilling;
            //fill booking references
            
            pendingBookingsForBilling.ForEach(b =>
            {
                ddlBookingRef.Items.Add(new ListItem(b.BookingRef, b.BookingID.ToString()));
            });
            
            }
            else
            {
                lblMessage.Text = "Booking does not exist in the system";
                lblMessage.Visible = true;
            }
        }

        GetBooking();
        if (CurrentBooking != null && !IsPostBack)
        {
            this.txtInMeterReading.Text = CurrentBooking.BillingDetails.InMeterReading != 0 ? CurrentBooking.BillingDetails.InMeterReading.ToString() : "";
            this.txtOutMeterReading.Text = CurrentBooking.BillingDetails.OutMeterReading != 0 ? CurrentBooking.BillingDetails.OutMeterReading.ToString() : "";
        }
        
        SetButtonVisibility();
     
    }

    private void SetButtonVisibility()
    {
        if (!string.IsNullOrEmpty(txtGrossAmount.Text) && !string.IsNullOrEmpty(txtTotalAmount.Text))
        {
            btnSubmit.Visible = true;
            btnCalculate.Visible = false;
        }
        else
        {
            btnSubmit.Visible = false;
            btnCalculate.Visible = true;

        }
    }
    private bool CalculateRates()
    {
        try
        {
            GetBooking();
            
            decimal basePrice = 0, standCharges = 0, extraHoursPrice = 0;
            Discount = decimal.Parse(txtDiscount.Text);
            InMeterReading = long.Parse(txtInMeterReading.Text);
            OutMeterReading = long.Parse(txtOutMeterReading.Text);

            if (InMeterReading == 0 || OutMeterReading == 0 || InMeterReading < OutMeterReading)
            {
                lblMessage.Text = "Enter proper values for meter reading. ";
                lblMessage.Visible = true;
                return false;
            }
            int totalKmsRun = (int)(InMeterReading - OutMeterReading);
            if (totalKmsRun <= CurrentBooking.TariffDetails.Kms)
            {
                basePrice = CurrentBooking.TariffDetails.BasePrice;
            }
            else
            {
                decimal extraKms = totalKmsRun - CurrentBooking.TariffDetails.Kms;
                basePrice = CurrentBooking.TariffDetails.BasePrice + (extraKms * CurrentBooking.TariffDetails.ExtraKmRate);
            }
            if (chkStandCharges.Checked)
            {
                standCharges = CurrentBooking.TariffDetails.StandCharges;
            }
            if (!string.IsNullOrEmpty(txtExtraHours.Text))
            {
                decimal extraHours = 0;
                if (decimal.TryParse(txtExtraHours.Text, out extraHours))
                {
                    extraHoursPrice = extraHours * CurrentBooking.TariffDetails.ExtraHourRate;
                }
            }

            GrossAmount = basePrice + standCharges + extraHoursPrice;
            TotalAmount = GrossAmount - Discount;
            return true;
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
            lblMessage.Visible = true;
            return false;
        }
    }
    private void GetBooking()
    {
        try
        {
            pendingBookingsForBilling = Session["PendingBookingsForBilling"] as List<CustomerBooking>;
            int selBookingId = int.Parse(ddlBookingRef.SelectedValue);
            if (selBookingId > 0)
            {
                CurrentBooking = pendingBookingsForBilling.FirstOrDefault(b => b.BookingID == selBookingId);
            }
        }
        catch (Exception e) { }
    }
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        GetBooking();
        CustomerBilling billing = CurrentBooking.BillingDetails;
        billing.Discount = Discount;
        billing.TotalAmount = TotalAmount;
        billing.GrossAmount = GrossAmount;
        billing.DutySlipNo = txtDutySlipNo.Text;
        billing.DutySlipDate = txtDutySlipDate.Text.ToDateTime();
        billing.OutMeterReading = OutMeterReading;
        billing.InMeterReading = InMeterReading;
        billing.Billing = chkPaid.Checked;

        if (customerBillingService.Update(billing))
        {
            lblMessage.Text = "Billing details updated successfully";
        }
        else
        {
            lblMessage.Text = "Error updating details";
        }

     
    }

    private void ClearEntries() {
        ddlBookingRef.SelectedIndex = 0;
        txtInMeterReading.Text = "";
        txtOutMeterReading.Text = "";
        txtDiscount.Text = "";
        txtGrossAmount.Text = "";
        txtTotalAmount.Text = "";
        txtExtraHours.Text = "";
        txtDutySlipNo.Text = "";
        
    }
   
    protected void btnCalculate_Click(object sender, EventArgs e)
    {
        
        CalculateRates();
        if (TotalAmount > 0 && GrossAmount > 0)
        {
            txtTotalAmount.Text = Math.Round(TotalAmount,2).ToString();
            txtGrossAmount.Text = Math.Round(GrossAmount, 2).ToString();
        }
    }
}
