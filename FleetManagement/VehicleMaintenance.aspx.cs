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
using Management;
using System.Data.SqlClient;

public partial class VehicleMaintenance : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connect"]);
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Cabs objGetvehicles = new Cabs();
            DataSet dsGetvehicles = new DataSet();
            dsGetvehicles = objGetvehicles.getVehicles();
            ddlVehicletype.DataSource = dsGetvehicles;
            ddlVehicletype.DataTextField = "vehicleName";
            ddlVehicletype.DataBind();
            ddlVehicletype.Items.Insert(0, "Select");
            ddlVehicleno.Items.Insert(0, "Select");
        }
        lblMessage.Visible = false;
        //if (ddlVehicletype.SelectedItem.Text != "Select")
        //{
        //    SqlDataAdapter daGetvehicleno = new SqlDataAdapter("select regno from a_vehiclemaster where vehicletype='" + ddlVehicletype.SelectedItem.Text + "'", con);
        //    DataSet ds = new DataSet();
        //    daGetvehicleno.Fill(ds);
        //    ddlVehicleno.DataTextField = "regno";
        //    ddlVehicleno.DataSource = ds;
        //    ddlVehicleno.DataBind();
        //    ddlVehicleno.Items.Insert(0, "Select");
        //}
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strInsert = "insert into vehiclemaintenance values('" + ddlVehicletype.SelectedItem.Text + "','" + ddlVehicleno.SelectedItem.Text + "'," + txtServiceforkms.Text + "," + txtLastservice.Text + "," + txtServiceat.Text + "," + txtServiceformonths.Text + ",'" + txtServiceddate.Text + "','" + txtServicedate.Text + "')";
        SqlCommand cmdInsert=new SqlCommand(strInsert,con);
        con.Open();
        cmdInsert.ExecuteNonQuery();
        con.Close();
    }
    protected void ddlVehicletype_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataAdapter daGetvehicleno = new SqlDataAdapter("select regno from a_vehiclemaster where vehicletype='" + ddlVehicletype.SelectedItem.Text + "'", con);
        DataSet ds = new DataSet();
        daGetvehicleno.Fill(ds);
        ddlVehicleno.DataTextField = "regno";
        ddlVehicleno.DataSource = ds;
        ddlVehicleno.DataBind();
        ddlVehicleno.Items.Insert(0, "Select");
    }
    protected void ddlVehicleno_SelectedIndexChanged(object sender, EventArgs e)
    {

        DataSet dsGetdetails = new DataSet();
        dsGetdetails = Getdetails();
        if (dsGetdetails.Tables[0].Rows.Count > 0)
        {
            txtServiceforkms.Text = dsGetdetails.Tables[0].Rows[0][0].ToString();
            int serviceforkms = int.Parse(dsGetdetails.Tables[0].Rows[0][0].ToString());
            int lastservice = int.Parse(dsGetdetails.Tables[0].Rows[0][1].ToString());
            int lastservicedat = int.Parse(dsGetdetails.Tables[0].Rows[0][2].ToString());
            int lastserviced = lastservice + lastservicedat;
            txtLastservice.Text = lastserviced.ToString();
            int serviceshouldperformat = lastserviced + serviceforkms;
            txtServiceat.Text = serviceshouldperformat.ToString();
            txtServiceformonths.Text = dsGetdetails.Tables[0].Rows[0][3].ToString();
            txtServiceddate.Text = dsGetdetails.Tables[0].Rows[0][4].ToString();
            txtServicedate.Text = dsGetdetails.Tables[0].Rows[0][5].ToString();
        }
        else
        {
            lblMessage.Text = "Add the details";
            lblMessage.Visible = true;
            txtServiceforkms.Text = "0";
            txtLastservice.Text = "0";
            txtServiceat.Text = "0"; 
               
        }
    }

    public DataSet Getdetails()
    {
        SqlDataAdapter daGetdetails = new SqlDataAdapter("select serviceperkms, lastservice, tobeserviced, servicepermonths, lastservicedate, tobeserviceddate from vehiclemaintenance where vehicleno='" + ddlVehicleno.SelectedItem.Text + "'", con);
        DataSet dsGetmaintenancedetails = new DataSet();
        daGetdetails.Fill(dsGetmaintenancedetails);
        return dsGetmaintenancedetails;
    }


    protected void txtServiceforkms_TextChanged(object sender, EventArgs e)
    {
        int serviceforkms = int.Parse(txtServiceforkms.Text);
        //int serviceformonths = int.Parse(txtServiceformonths.Text);                 
            int serviceat = serviceforkms + int.Parse(txtLastservice.Text);
            txtServiceat.Text = serviceat.ToString();
            
        
    }
}
