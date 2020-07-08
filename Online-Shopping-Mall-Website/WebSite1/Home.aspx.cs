using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["visitor"] != null)
        {
            lbWelcome.Text = "Welcome " + Session["visitor"].ToString();
            lbWelcome.Visible = true;
            btlogin.Visible = false;
            btlogout.Visible = true;
            HyperLink1.Visible = false;

            OleDbConnection conn1 = new OleDbConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn1.Open();
            string checkNewMesg = "select count(*) from [Notification] where [customerID]=" + Convert.ToInt32(Session["visitorID"].ToString()) + " and [read]='No'";
            OleDbCommand com = new OleDbCommand(checkNewMesg, conn1);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            conn1.Close();

            if (temp > 0)
            {
                HyperLink3.Text = "You have new message!";
            }
        }
        else { HyperLink3.Visible = false; }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    protected void btlogout_Click(object sender, EventArgs e)
    {
        Session["visitor"] = null;
        Response.Redirect("Login.aspx");
    }

    protected void btShopCart_Click(object sender, EventArgs e)
    {
        if (Session["visitor"] != null)
        {
            Response.Redirect("Shopping_Cart.aspx");
        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(string), "Login", "<script>alert('" + "Please login first!" + "');window.location.href ='Login.aspx'</script>");
        }
    }
   
    protected void Button1_Click1(object sender, EventArgs e)
    {
        GridView1.DataSourceID = null;
        
        if (DropDownList1.SelectedItem.Text == "Skirt")
        {
            GridView1.DataSource = SqlDataSource3;
            GridView1.DataBind();
        }
        else if (DropDownList1.SelectedItem.Text == "T-shirt")
        {
            GridView1.DataSource = SqlDataSource4;
            GridView1.DataBind();
        }
        else if (DropDownList1.SelectedItem.Text == "Jeans")
        {
            GridView1.DataSource = SqlDataSource5;
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Session["visitor"] != null)
        {
            Response.Redirect("Purchase_Tracking.aspx");
        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(string), "Login", "<script>alert('" + "Please login first!" + "');window.location.href ='Login.aspx'</script>");
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        if (DropDownList1.SelectedItem.Text == "Skirt")
        {
            GridView1.DataSourceID = null;
            GridView1.DataSource = SqlDataSource3;
            GridView1.DataBind();
        }
        else if (DropDownList1.SelectedItem.Text == "T-shirt")
        {
            GridView1.DataSourceID = null;
            GridView1.DataSource = SqlDataSource4;
            GridView1.DataBind();
        }
        else if (DropDownList1.SelectedItem.Text == "Jeans")
        {
            GridView1.DataSourceID = null;
            GridView1.DataSource = SqlDataSource5;
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataSourceID = null;
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
        }
    }

    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        
    }
}