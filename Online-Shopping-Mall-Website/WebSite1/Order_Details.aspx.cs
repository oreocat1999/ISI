using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order_Details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label2.Visible = false;
        if (Session["visitor"] == null)
        {
            string query = HttpContext.Current.Request.Url.Query;
            Response.Redirect("Login.aspx");
        }
        else {
            string query = HttpContext.Current.Request.Url.Query;
            if (Session["POnumber"] == null) {
                
                Session["POnumber"] = Convert.ToInt32(query.Substring(10)); //?POnumber=realQuery;
                 }
            if (query.Length >= 1)
            {
                if (Convert.ToInt32(Session["POnumber"].ToString()) != Convert.ToInt32(query.Substring(10)))
                {
                    Session["POnumber"] = Convert.ToInt32(query.Substring(10));
                }
            }
            int row = 0;
                int TotalAmount = 0;
                while (row < GridView3.Rows.Count)
                {
                    int subtotal = Convert.ToInt32(GridView3.Rows[row].Cells[4].Text);
                    TotalAmount += subtotal;
                    row++;
                }
                Label1.Text = TotalAmount.ToString();
            if (GridView1.Rows[0].Cells[3].Text == "Pending")
            {
                GridView1.Columns[2].Visible = false;
            }
        }
       
    }
}