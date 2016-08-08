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
using FleetManagement.Interfaces;
using FleetManagement.Services;
using System.Collections.Generic;
using Newtonsoft.Json;
using FleetManagement.Entities;

public partial class Home : System.Web.UI.Page
{
    ICustomerBookingService bookingService = new CustomerBookingService();

    public string JsonBookingCountData = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        List<BookingLight> monthlyBookingCount = bookingService.GetMonthlyBookingCount();

        JsonBookingCountData = JsonConvert.SerializeObject(monthlyBookingCount);

       
               
    }
}
