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

public partial class VehicleAllocation : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connect"]);
    DataSet ds = new DataSet();
                   
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Visible = false;       
            
            if (!IsPostBack)
            {
                SqlDataAdapter daDriver = new SqlDataAdapter("select firstname from a_employee where designation='driver'", con);
                
                daDriver.Fill(ds, "driver");
                daDriver.SelectCommand = new SqlCommand("select bookingid from customerbooking where DriverName='Not Allocated'", con);
                daDriver.Fill(ds, "bookingid");
                ddlDriver.DataTextField = "firstname";
                ddlDriver.DataSource = ds;
                ddlDriver.DataMember = "driver";
                ddlDriver.DataBind();
                ddlDriver.Items.Insert(0, "Select");
                ddlBookingid.DataTextField = "bookingid";
                ddlBookingid.DataSource = ds;
                ddlBookingid.DataMember = "bookingid";
                ddlBookingid.DataBind();
                ddlBookingid.Items.Insert(0, new ListItem("Select"));

                txtDutyslipdate.Text = DateTime.Now.ToString("d");
            }
            
        if (ddlBookingid.SelectedItem.Text != "Select")
        {
            string getDetails = "select customername, vehicletype, pickup, phoneno,guestname from customerbooking where bookingid='" + ddlBookingid.SelectedItem.Text + "'";
            SqlDataAdapter daDetails = new SqlDataAdapter(getDetails, con);
            DataSet dsDetails = new DataSet();
            daDetails.Fill(dsDetails);
            if (dsDetails.Tables[0].Rows.Count > 0)
            {
                txtCustomername.Text = dsDetails.Tables[0].Rows[0][0].ToString();
                txtVehicletype.Text = dsDetails.Tables[0].Rows[0][1].ToString();
                txtAddress.Text = dsDetails.Tables[0].Rows[0][2].ToString();
                txtPhoneno.Text = dsDetails.Tables[0].Rows[0][3].ToString();
                txtGuestname.Text = dsDetails.Tables[0].Rows[0][4].ToString();
                int dutyslipno = int.Parse(ddlBookingid.SelectedItem.Text);
                txtDutyslipno.Text = (dutyslipno + 10).ToString();
            }
        }
        else
        {
            txtCustomername.Text ="";
            txtVehicletype.Text =""; 
            txtAddress.Text = "";
            txtPhoneno.Text = "";
            txtDutyslipno.Text = "";
            txtGuestname.Text = "";
        }
    }

    protected void btnSubmit_Click1(object sender, EventArgs e)
    {
        string strInsert = "insert into vehicleallocation(bookingid, customername, vehicletype, vehicleno, dutyslipno, dutyslipdate, guestname, address, phone, drivername) values(" + ddlBookingid.SelectedItem.Text + ",'" + txtCustomername.Text + "','" + txtVehicletype.Text + "','" + txtVehicleno.Text + "'," + txtDutyslipno.Text + ",'" + txtDutyslipdate.Text + "','" + txtGuestname.Text + "','" + txtAddress.Text + "','" + txtPhoneno.Text + "','" + ddlDriver.SelectedItem.Text + "') update customerbooking set driver='" + ddlDriver.SelectedItem.Text + "' where bookingid=" + ddlBookingid.SelectedItem.Text + "";
        SqlCommand cmdInsert = new SqlCommand(strInsert, con);
        con.Open();
        cmdInsert.ExecuteNonQuery();
        con.Close();
        lblMessage.Text = "Customer details added sucessfully";
        lblMessage.Visible = true;
        SqlDataAdapter daGet = new SqlDataAdapter("select bookingid from customerbooking where driver='No'", con);
        daGet.Fill(ds, "bookingid");
        ddlBookingid.DataTextField = "bookingid";        
        ddlBookingid.DataSource = ds;
        ddlBookingid.DataMember = "bookingid";
        ddlBookingid.DataBind();
        ddlBookingid.Items.Insert(0, new ListItem("Select"));
        txtCustomername.Text = "";
        txtVehicletype.Text = "";
        txtVehicleno.Text = "";
        txtDutyslipno.Text = "";
        txtGuestname.Text = "";
        txtAddress.Text = "";
        txtPhoneno.Text = "";
        ddlDriver.SelectedIndex = 0;
                
    }
}
