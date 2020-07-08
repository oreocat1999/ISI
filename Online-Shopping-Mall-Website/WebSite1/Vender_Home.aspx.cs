using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["visitor"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (Session["visitor"] != null)
        {
            lbWelcome.Text = "Welcome " + Session["visitor"].ToString();
            lbWelcome.Visible = true;
            btlogin.Visible = false;
            btlogout.Visible = true;
            HyperLink1.Visible = false;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    protected void btlogout_Click(object sender, EventArgs e)
    {
        Session["Visitor"] = null;
        Response.Redirect("Login.aspx");
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e) {
        GridView1.PageIndex = e.NewPageIndex;
        if (DropDownList1.SelectedItem.Text == "Skirt")
        {
            GridView1.DataSourceID = null;
            GridView1.DataSource = SqlDataSource6;
            GridView1.DataBind();
        }
        else if (DropDownList1.SelectedItem.Text == "T-shirt")
        {
            GridView1.DataSourceID = null;
            GridView1.DataSource = SqlDataSource7;
            GridView1.DataBind();
        }
        else if (DropDownList1.SelectedItem.Text == "Jeans")
        {
            GridView1.DataSourceID = null;
            GridView1.DataSource = SqlDataSource8;
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataSourceID = null;
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
        }
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        GridView1.DataSourceID = null;

        if (DropDownList1.SelectedItem.Text == "Skirt")
        {
            GridView1.DataSource = SqlDataSource6;
            GridView1.DataBind();
        }
        else if (DropDownList1.SelectedItem.Text == "T-shirt")
        {
            GridView1.DataSource = SqlDataSource7;
            GridView1.DataBind();
        }
        else if (DropDownList1.SelectedItem.Text == "Jeans")
        {
            GridView1.DataSource = SqlDataSource8;
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
        }
    }


    protected void btnProductName_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = null;
        GridView1.DataSource = SqlDataSource4;
        GridView1.DataBind();
    }

    protected void btnProductID_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = null;
        GridView1.DataSource = SqlDataSource5;
        GridView1.DataBind();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Purchase_Order_list.aspx");
    }

    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {

    }
}