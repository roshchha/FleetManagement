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
using System.Linq;

public partial class Home : System.Web.UI.Page
{
    ICustomerBookingService bookingService = new CustomerBookingService();

    public string JsonBookingCountData = "";
    public string JsonGrossRevenueForVehiclesData = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        List<BookingLight> monthlyBookingCount = bookingService.GetMonthlyBookingCount();

        JsonBookingCountData = JsonConvert.SerializeObject(monthlyBookingCount);

        List<GrossRevenue> grossRevenueForVehicles = bookingService.GetGrossMonthlyRevenueForVehicles();
        List<KeyValuePair<string,decimal>> kvp = new List<KeyValuePair<string,decimal>>();
        grossRevenueForVehicles.ForEach(o =>
        {
            kvp.Add(new KeyValuePair<string,decimal>(o.VehicleTypeName,o.TotalAmount));
        });

        //var data = grossRevenueForVehicles.Select(o => new { o.VehicleTypeName, o.TotalAmount }).ToDictionary<string,decimal>()

        JsonGrossRevenueForVehiclesData = JsonConvert.SerializeObject(kvp);
               
    }
}
