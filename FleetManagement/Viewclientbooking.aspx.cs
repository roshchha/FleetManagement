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

public partial class Viewclientbooking : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connect"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            grdClient.DataSource = bind();
            grdClient.DataBind();
        }
    }
    protected void grdClient_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdClient.PageIndex = e.NewPageIndex;
        grdClient.DataSource = bind();
        grdClient.DataBind();
    }
    protected void grdClient_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdClient.EditIndex = -1;
        grdClient.DataSource = bind();
        grdClient.DataBind();
    }
    protected void grdClient_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = grdClient.Rows[e.RowIndex];
        HtmlInputHidden hdn = (HtmlInputHidden)row.FindControl("Hidden1");
        int hdntxt = int.Parse(hdn.Value);
        SqlCommand cmd = new SqlCommand("delete customerbooking where bookingid=" + hdntxt, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        grdClient.DataSource = bind();
        grdClient.DataBind();
    }
    protected void grdClient_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdClient.EditIndex = e.NewEditIndex;
        grdClient.DataSource = bind();
        grdClient.DataBind();
    }
    protected void grdClient_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = grdClient.Rows[e.RowIndex];
        HtmlInputHidden hdn = (HtmlInputHidden)row.FindControl("Hidden1");
        int hdntxt = int.Parse(hdn.Value);
        TextBox name = (TextBox)grdClient.Rows[e.RowIndex].Cells[1].Controls[0];
        TextBox phone = (TextBox)grdClient.Rows[e.RowIndex].Cells[2].Controls[0];
        TextBox email = (TextBox)grdClient.Rows[e.RowIndex].Cells[3].Controls[0];
        TextBox pickup = (TextBox)grdClient.Rows[e.RowIndex].Cells[4].Controls[0];
        TextBox droppoint = (TextBox)grdClient.Rows[e.RowIndex].Cells[5].Controls[0];
        TextBox fromdate = (TextBox)grdClient.Rows[e.RowIndex].Cells[6].Controls[0];
        //TextBox driver = (TextBox)grdClient.Rows[e.RowIndex].Cells[7].Controls[0];
        //TextBox droppoint = (TextBox)grdClient.Rows[e.RowIndex].Cells[6].Controls[0];
        
        SqlCommand cmdUpdate = new SqlCommand("update customerbooking set customername='" + name.Text + "', phoneno='" + phone.Text + "', email='" +email.Text + "', pickup='" + pickup.Text + "',  fromdate='" + fromdate.Text + "' where bookingid=" + hdntxt + "", con);
        con.Open();
        cmdUpdate.ExecuteNonQuery();
        con.Close();

        grdClient.EditIndex = -1;
        grdClient.DataSource = bind();
        grdClient.DataBind();
    }

    public DataSet bind()
    {
        string strGetcustomer = "select bookingid, customername, phoneno, email, pickup,droppoint, driver, fromdate from customerbooking";
        SqlDataAdapter daGetcustomer = new SqlDataAdapter(strGetcustomer, con);
        DataSet dsGetcustomer = new DataSet();
        daGetcustomer.Fill(dsGetcustomer);
        return dsGetcustomer;
    }
}
