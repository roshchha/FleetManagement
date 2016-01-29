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

public partial class ViewVehilcemaster : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connect"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            grdVehiclemaster.DataSource = bind();
            grdVehiclemaster.DataBind();
        }
    }
    protected void grdVehiclemaster_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdVehiclemaster.PageIndex = e.NewPageIndex;
        grdVehiclemaster.DataSource = bind();
        grdVehiclemaster.DataBind();
    }
    protected void grdVehiclemaster_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdVehiclemaster.EditIndex = -1;
        grdVehiclemaster.DataSource = bind();
        grdVehiclemaster.DataBind();
    }
    protected void grdVehiclemaster_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdVehiclemaster.EditIndex = e.NewEditIndex;
        grdVehiclemaster.DataSource = bind();
        grdVehiclemaster.DataBind();
    }
    protected void grdVehiclemaster_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = grdVehiclemaster.Rows[e.RowIndex];       
        TextBox tvehicletype = (TextBox)grdVehiclemaster.Rows[e.RowIndex].Cells[0].Controls[0];       
        string regno = grdVehiclemaster.Rows[e.RowIndex].Cells[1].Text;
        TextBox tfuel = (TextBox)grdVehiclemaster.Rows[e.RowIndex].Cells[2].Controls[0];
        TextBox tpurchaseddate = (TextBox)grdVehiclemaster.Rows[e.RowIndex].Cells[3].Controls[0];        
        TextBox tseatingno = (TextBox)grdVehiclemaster.Rows[e.RowIndex].Cells[4].Controls[0];
        TextBox tvehiclecost = (TextBox)grdVehiclemaster.Rows[e.RowIndex].Cells[5].Controls[0];
        string vehicletype = tvehicletype.Text;      
        string fuel = tfuel.Text;
        string purchaseddate = tpurchaseddate.Text;
        string seatingno = tseatingno.Text;
        string vehiclecost = tvehiclecost.Text;
        SqlCommand cmdUpdate = new SqlCommand("update a_vehiclemaster set vehicletype='" + vehicletype + "', fueltype='" + fuel + "', purchasedate='" + purchaseddate + "', noofseating='" + seatingno + "',  vehiclecost='" + vehiclecost + "' where regno='" + regno + "'", con);
        con.Open();
        cmdUpdate.ExecuteNonQuery();
        con.Close();

        grdVehiclemaster.EditIndex = -1;
        grdVehiclemaster.DataSource = bind();
        grdVehiclemaster.DataBind();
    }

    public DataSet bind()
    {
        string strGetvehicledetails = "select vehicletype, regno, fueltype, noofseating, ac, vehiclecost, purchasedate from a_vehiclemaster";
        SqlDataAdapter daGetvehicledetails = new SqlDataAdapter(strGetvehicledetails, con);
        DataSet dsGetvehicledetails = new DataSet();
        daGetvehicledetails.Fill(dsGetvehicledetails);
        return dsGetvehicledetails;
    }
    protected void grdVehiclemaster_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = grdVehiclemaster.Rows[e.RowIndex];
        string regno = row.Cells[1].Text;
        SqlCommand cmd = new SqlCommand("delete a_vehiclemaster where regno='" + regno+"'", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        grdVehiclemaster.DataSource = bind();
        grdVehiclemaster.DataBind();
    }
}
