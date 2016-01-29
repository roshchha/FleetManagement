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

public partial class Viewcustomers : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connect"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            grdCustomers.DataSource = bind();
            grdCustomers.DataBind();

        }
    }
    protected void grdCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdCustomers.PageIndex = e.NewPageIndex;
        grdCustomers.DataSource = bind();
        grdCustomers.DataBind();
    }
    protected void grdCustomers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdCustomers.EditIndex = -1;
        grdCustomers.DataSource = bind();
        grdCustomers.DataBind();
    }
    protected void grdCustomers_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = grdCustomers.Rows[e.RowIndex];
        HtmlInputHidden hdn = (HtmlInputHidden)row.FindControl("Hidden1");
        int hdntxt = int.Parse(hdn.Value);
        SqlCommand cmd = new SqlCommand("delete customers where id=" + hdntxt, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        grdCustomers.DataSource = bind();
        grdCustomers.DataBind();
    }
    protected void grdCustomers_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdCustomers.EditIndex = e.NewEditIndex;
        grdCustomers.DataSource = bind();
        grdCustomers.DataBind();
    }
    protected void grdCustomers_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = grdCustomers.Rows[e.RowIndex];
        HtmlInputHidden hdn = (HtmlInputHidden)row.FindControl("Hidden1");
        int hdntxt = int.Parse(hdn.Value);
        TextBox tname = (TextBox)grdCustomers.Rows[e.RowIndex].Cells[1].Controls[0];
        TextBox address = (TextBox)grdCustomers.Rows[e.RowIndex].Cells[2].Controls[0];
        TextBox phone = (TextBox)grdCustomers.Rows[e.RowIndex].Cells[3].Controls[0];        
        TextBox temailid = (TextBox)grdCustomers.Rows[e.RowIndex].Cells[4].Controls[0];
        string name = tname.Text;   
       
        string emailid = temailid.Text;
        SqlCommand cmdUpdate = new SqlCommand("update customers set name='" + name + "', address='"+address.Text+"', phone='"+phone.Text+"', email='" + emailid + "' where id=" + hdntxt + "", con);
        con.Open();
        cmdUpdate.ExecuteNonQuery();
        con.Close();
        grdCustomers.EditIndex = -1;
        grdCustomers.DataSource = bind();
        grdCustomers.DataBind();
    }

    public DataSet bind()
    {
        string strGetcustomer = "select id, name, address, phone, email from customers";
        SqlDataAdapter daGetemp = new SqlDataAdapter(strGetcustomer, con);
        DataSet dsGetemp = new DataSet();
        daGetemp.Fill(dsGetemp);
        return dsGetemp;
    }
}
