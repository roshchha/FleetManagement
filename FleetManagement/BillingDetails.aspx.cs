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
        
        if (!IsPostBack)
        {
            pendingBookingsForBilling = customerBookingService.GetPendingBookingsForBilling();
            ddlBookingRef.Items.Clear();
            ddlBookingRef.Items.Add(new ListItem("Select", "0"));
            if (pendingBookingsForBilling.Count > 0)
            {
                Session["PendingBookingsForBilling"] = pendingBookingsForBilling;
                //fill booking references

                pendingBookingsForBilling.ForEach(b =>
                {
                    ddlBookingRef.Items.Add(new ListItem(b.BookingRef, b.BookingID.ToString()));
                });

            }
            else
            {
                lblMessage.Text = "NO Pending Booking exists in the system for payment";
                lblMessage.Visible = true;
            }
        }

        //GetBooking();
        //if (CurrentBooking != null && !IsPostBack)
        //{
        //    this.txtInMeterReading.Text = CurrentBooking.BillingDetails.InMeterReading != 0 ? CurrentBooking.BillingDetails.InMeterReading.ToString() : "";
        //    this.txtOutMeterReading.Text = CurrentBooking.BillingDetails.OutMeterReading != 0 ? CurrentBooking.BillingDetails.OutMeterReading.ToString() : "";
        //}
        
       // SetButtonVisibility();
        txtDiscount.Attributes.Add("onkeydown", "numbersOnly(event)");
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
            decimal.TryParse(txtDiscount.Text,out Discount);
            InMeterReading = long.Parse(txtInMeterReading.Text);
            OutMeterReading = long.Parse(txtOutMeterReading.Text);

            if (InMeterReading == 0 || OutMeterReading == 0 || InMeterReading < OutMeterReading)
            {
                lblMessage.Text = "Enter valid values for meter reading. Out Meter Reading must be less than In Meter Reading";
                lblMessage.Visible = true;
                return false;
            }
            DateTime startDate = CurrentBooking.FromDate;
            DateTime endDate = CurrentBooking.ToDate;
            int days = (endDate - startDate).Days + 1 ;
          
            int totalKmsRun = (int)(InMeterReading - OutMeterReading);
            int minKms = CurrentBooking.TariffDetails.Kms * days;
            basePrice = CurrentBooking.TariffDetails.BasePrice * days;
            if (totalKmsRun > minKms)
            {
                decimal extraKms = totalKmsRun - minKms;
                basePrice += (extraKms * CurrentBooking.TariffDetails.ExtraKmRate);
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
            if (pendingBookingsForBilling == null) pendingBookingsForBilling = customerBookingService.GetPendingBookingsForBilling();
            if (pendingBookingsForBilling != null)
            {
                int selBookingId = int.Parse(ddlBookingRef.SelectedValue);
                if (selBookingId > 0)
                {
                    CurrentBooking = pendingBookingsForBilling.FirstOrDefault(b => b.BookingID == selBookingId);

                }
            }
            else
            {
                lblMessage.Text = "NO Pending Booking exists in the system for payment";
                lblMessage.Visible = true;
            }
        }
        catch (Exception e) { }
    }
    protected void ddlBookingRef_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetBooking();
        if (CurrentBooking == null || CurrentBooking.BillingDetails == null) return;
        CustomerBilling billingDetails = CurrentBooking.BillingDetails;
        if (txtDiscount.Text != billingDetails.Discount.ToString() && billingDetails.Discount > 0)
        {
            txtDiscount.Text = billingDetails.Discount.ToString();
        }
        if (txtGrossAmount.Text != billingDetails.GrossAmount.ToString() && billingDetails.GrossAmount > 0)
        {
            txtGrossAmount.Text = billingDetails.GrossAmount.ToString();
        }
        if (txtTotalAmount.Text != billingDetails.TotalAmount.ToString() && billingDetails.TotalAmount > 0)
        {
            txtTotalAmount.Text = billingDetails.TotalAmount.ToString();
        }
        if (txtDutySlipDate.Text != billingDetails.DutySlipDate.ToString() &&
            (billingDetails.DutySlipDate ?? DateTime.MinValue) != DateTime.MinValue)
        {
            txtDutySlipDate.Text = ((DateTime)billingDetails.DutySlipDate).ToShortDateTimeString();
        }
        if (!string.IsNullOrEmpty(billingDetails.DutySlipNo) &&
            txtDutySlipNo.Text != billingDetails.DutySlipNo.ToString())
        {
            txtDutySlipNo.Text = billingDetails.DutySlipNo.ToString();
        }
        if (txtInMeterReading.Text != billingDetails.InMeterReading.ToString() && billingDetails.InMeterReading > 0)
        {
            txtInMeterReading.Text = billingDetails.InMeterReading.ToString();
        }
        if (txtOutMeterReading.Text != billingDetails.OutMeterReading.ToString() && billingDetails.OutMeterReading > 0)
        {
            txtOutMeterReading.Text = billingDetails.OutMeterReading.ToString();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        GetBooking();
        CalculateRates();
        CustomerBilling billing = CurrentBooking.BillingDetails;
        billing.Discount = Discount;
        billing.TotalAmount = TotalAmount;
        billing.GrossAmount = GrossAmount;
        billing.DutySlipNo = txtDutySlipNo.Text;
        billing.DutySlipDate = txtDutySlipDate.Text.ToDateTimeNullable();
        billing.OutMeterReading = OutMeterReading;
        billing.InMeterReading = InMeterReading;
        billing.Billing = chkPaid.Checked;

        lblMessage.Visible = true;
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
