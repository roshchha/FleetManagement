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
using FleetManagement;
using FleetManagement.Services;
using FleetManagement.Entities;
using FleetManagement.Interfaces;

public partial class VehicleTypes : System.Web.UI.Page
{

    IEntityService<VehicleType> vehicleTypeService = new VehicleTypeService();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        try
        {


            FleetManagement.Entities.VehicleType vehicleType = new FleetManagement.Entities.VehicleType();
            vehicleType.Name = txtName.Text;

            if (vehicleTypeService.Insert(vehicleType))
            {
                lblMessage.Text = "Inserted Successfully";
                lblMessage.Visible = true;
            }
            txtName.Text = string.Empty;
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error inserting data";
            lblMessage.Visible = true;
        }
    }
}
