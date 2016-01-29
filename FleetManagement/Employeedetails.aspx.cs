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

public partial class Employeedetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["connect"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            grdEmp.DataSource = bind();
            grdEmp.DataBind();
           
        }
    }

    protected void grdEmp_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdEmp.EditIndex = e.NewEditIndex;
        grdEmp.DataSource = bind();
        grdEmp.DataBind();
    }

    public DataSet bind()
    {
        string strGetemp = "select empId, firstname, designation, salery, dateofjoin, phone, emailid from a_employee";
        SqlDataAdapter daGetemp = new SqlDataAdapter(strGetemp, con);
        DataSet dsGetemp = new DataSet();
        daGetemp.Fill(dsGetemp);
        return dsGetemp;
    }
    protected void grdEmp_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //bind();
        GridViewRow row = grdEmp.Rows[e.RowIndex];
        HtmlInputHidden hdn = (HtmlInputHidden)row.FindControl("Hidden1");
        int hdntxt = int.Parse(hdn.Value);
        TextBox tname = (TextBox)grdEmp.Rows[e.RowIndex].Cells[1].Controls[0];
        TextBox tdesignation = (TextBox)grdEmp.Rows[e.RowIndex].Cells[2].Controls[0];
        TextBox tsalery = (TextBox)grdEmp.Rows[e.RowIndex].Cells[3].Controls[0];
        TextBox tdoj = (TextBox)grdEmp.Rows[e.RowIndex].Cells[4].Controls[0];
        TextBox temailid = (TextBox)grdEmp.Rows[e.RowIndex].Cells[6].Controls[0];
        string name = tname.Text;
        string desg = tdesignation.Text;
        string salery = tsalery.Text;
        string doj = tdoj.Text;
        string emailid = temailid.Text;
        SqlCommand cmdUpdate = new SqlCommand("update a_employee set firstname='" + name + "', designation='" + desg + "', salery='" + salery + "', dateofjoin='" + doj + "',  emailid='" + emailid + "' where empid=" + hdntxt + "", con);
        con.Open();
        cmdUpdate.ExecuteNonQuery();
        con.Close();
        //for (int i = 0; i <= grdEmp.Columns.Count; i++)
        //{
        //    if (i == 0 || i == 7 || i == 8)
        //    {

        //    }
        //    else
        //    {
        //        TextBox text = (TextBox)grdEmp.Rows[e.RowIndex].Cells[i].Controls[0];
        //        string txt = text.Text;
        //        if (txt != "")
        //        {
        //            //SqlCommand cmdUpdate = new SqlCommand("update a_employee set firstname='"+txt+"', designation='"+txt+"', salery='"+txt.ToString()+"', dateofjoin='"+txt+"',  emailid='" + txt + "' where empid=" + hdntxt + "", con);

        //            con.Open();
        //            cmdUpdate.ExecuteNonQuery();
        //            con.Close();
        //        }
        //    }
        //}


        grdEmp.EditIndex = -1;
        grdEmp.DataSource = bind();
        grdEmp.DataBind();
        //grdEmp.UpdateRow(e.RowIndex, false);
    }
    protected void grdEmp_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {       
            grdEmp.EditIndex = -1;
            grdEmp.DataSource = bind();
            grdEmp.DataBind();
    }
    protected void grdEmp_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdEmp.PageIndex = e.NewPageIndex;
        grdEmp.DataSource = bind();
        grdEmp.DataBind();
    }
    protected void grdEmp_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = grdEmp.Rows[e.RowIndex];
        HtmlInputHidden hdn = (HtmlInputHidden)row.FindControl("Hidden1");
        int hdntxt = int.Parse(hdn.Value);
        SqlCommand cmd=new SqlCommand("delete a_employee where empid="+hdntxt,con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
     
        grdEmp.DataSource = bind();
        grdEmp.DataBind();
    }
}
