using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Purchase_Order_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if (Session["visitor"] == null)
       {
        string query = HttpContext.Current.Request.Url.Query;
        Response.Redirect("Login.aspx");
       }
    }

   

    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = null;
        GridView1.DataSource = SqlDataSource3;
        GridView1.DataBind();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = null;
        GridView1.DataSource = SqlDataSource1;
        GridView1.DataBind();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = null;
        GridView1.DataSource = SqlDataSource2;
        GridView1.DataBind();

    }
}