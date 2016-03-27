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
public partial class BillingDetails : System.Web.UI.Page
{
    ICustomerBookingService customerBookingService = new CustomerBookingService();
    List<CustomerBooking> pendingBookingsForBilling = new List<CustomerBooking>();
    public CustomerBooking CurrentBooking = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Visible = false;
        if (!IsPostBack)
        {
            pendingBookingsForBilling = customerBookingService.GetPendingBookingsForBilling();
            if(pendingBookingsForBilling.Count > 0){
            Session["PendingBookingsForBilling"] = pendingBookingsForBilling;
            //fill booking references
            ddlBookingRef.Items.Clear();
            ddlBookingRef.Items.Add(new ListItem("Select", "0"));
            pendingBookingsForBilling.ForEach(b =>
            {
                ddlBookingRef.Items.Add(new ListItem(b.BookingRef, b.BookingID.ToString()));
            });
            
            }
        }
        else
        {
            pendingBookingsForBilling = Session["PendingBookingsForBilling"] as List<CustomerBooking>;
            int selBookingId = int.Parse(ddlBookingRef.SelectedValue);
            CurrentBooking = pendingBookingsForBilling.FirstOrDefault(b => b.BookingID == selBookingId);
            if (CurrentBooking != null)
            {

            }
        }

        //if (ddldutyslipno.SelectedItem.Text != "Select")
        //{
        //    string strCommand = "select a.customername, a.vehicletype, a.vehicleno, a.phone, a.drivername, c.fromdate, c.todate from vehicleallocation a, customerbooking c where  a.bookingid=c.bookingid and a.dutyslipno='"+ddldutyslipno.SelectedItem.Text+"'";
        //    SqlDataAdapter daDetails = new SqlDataAdapter(strCommand, con);
        //    DataSet dsDetails = new DataSet();
        //    daDetails.Fill(dsDetails);
        //    if (dsDetails.Tables[0].Rows.Count > 0)
        //    {
        //        txtCustomername.Text = dsDetails.Tables[0].Rows[0][0].ToString();
        //        txtVehicletype.Text = dsDetails.Tables[0].Rows[0][1].ToString();
        //        txtVehicleno.Text = dsDetails.Tables[0].Rows[0][2].ToString();
        //        txtPhoneno.Text = dsDetails.Tables[0].Rows[0][3].ToString();
        //        txtDriver.Text = dsDetails.Tables[0].Rows[0][4].ToString();
        //        txtFromdate.Text = dsDetails.Tables[0].Rows[0][5].ToString();
        //        txtTodate.Text = dsDetails.Tables[0].Rows[0][6].ToString();
        //    }
        //}
    }

   
    protected void txtInmeterreading_TextChanged(object sender, EventArgs e)
    {

        Gettotalprice();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //string strInsert = "insert into customerbilling values('" + ddldutyslipno.SelectedItem.Text + "','" + txtCustomername.Text + "','" + txtPhoneno.Text + "','" + txtTodate.Text + "','" + txtFromdate.Text + "','" + txtVehicletype.Text + "','" + txtVehicleno.Text + "','" + txtDriver.Text + "','" + txtOutmeterreading.Text + "','" + txtInmeterreading.Text + "'," + txtTariffcode.Text + ") update vehicleallocation set billing=1 where dutyslipno='"+ddldutyslipno.SelectedItem.Text+"'";
        //SqlCommand cmdInsert = new SqlCommand(strInsert, con);
        //con.Open();
        //cmdInsert.ExecuteNonQuery();
        //con.Close();
        //lblMessage.Visible = true;
        //lblMessage.Text = "Billing details added sucessfully";
        //ddldutyslipno.SelectedIndex = 0;
        //txtCustomername.Text = "";
        //txtPhoneno.Text = "";
        //txtFromdate.Text = "";
        //txtTodate.Text = "";
        //txtVehicletype.Text = "";
        //txtVehicleno.Text = "";
        //txtDriver.Text = "";
        //txtOutmeterreading.Text = "";
        //txtInmeterreading.Text = "";
        //txtTariffcode.Text = "";
    }

   
    public void Gettotalprice()
    {
        //int i = int.Parse(txtInmeterreading.Text) - int.Parse(txtOutmeterreading.Text);
        //SqlDataAdapter daGettariff = new SqlDataAdapter("select baseprice from tariff where vehicletype='" + txtVehicletype.Text + "' and kms >" + i, con);
        //DataSet ds = new DataSet();
        //daGettariff.Fill(ds);
        //if (ds.Tables[0].Rows.Count > 0)
        //{
        //    txtTariffcode.Text = ds.Tables[0].Rows[0][0].ToString();
        //}
        //else
        //{
        //    string strGetmaxtariff = "select baseprice, kms, extrakmrate from tariff where baseprice in(select max(baseprice) from tariff where vehicletype='"+txtVehicletype.Text+"')";
        //    SqlDataAdapter daGetmaxtariff = new SqlDataAdapter(strGetmaxtariff, con);
        //    DataSet dsGetmaxtariff = new DataSet();
        //    daGetmaxtariff.Fill(dsGetmaxtariff);
        //    if (dsGetmaxtariff.Tables[0].Rows.Count > 0)
        //    {
        //        int baseprice = Convert.ToInt32(dsGetmaxtariff.Tables[0].Rows[0][0]);
        //        int basekm = int.Parse(dsGetmaxtariff.Tables[0].Rows[0][1].ToString());
        //        int extrakmrate = Convert.ToInt32(dsGetmaxtariff.Tables[0].Rows[0][2]);
        //        int extrakms = i - basekm;
        //        int extrapriceperkm = extrakms * extrakmrate;
        //        int totalprice = baseprice + extrapriceperkm;
        //        txtTariffcode.Text = totalprice.ToString();
        //    }


       // }

    }
}
