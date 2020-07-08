using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Notification : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (GridView1.Rows.Count == 0 && GridView2.Rows.Count == 0)
        {
            Label1.Text = "You don't have new message.";
            Label2.Visible = false;
        }
        else if (GridView1.Rows.Count != 0 && GridView2.Rows.Count == 0)
        {
            Label2.Visible = false;
        }
        else if (GridView1.Rows.Count == 0 && GridView2.Rows.Count != 0)
        {

            Label1.Text = "You don't have new message.";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (GridView1.Rows.Count != 0)
        {
            OleDbConnection conn1 = new OleDbConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn1.Open();
            string update = "update [Notification] set [read]=? where [customerID]=" + Convert.ToInt32(Session["visitorID"].ToString());
            OleDbCommand com = new OleDbCommand(update, conn1);
            string read = "Yes";
            com.Parameters.Add(new OleDbParameter(null, read));
            com.ExecuteNonQuery();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(string), "NoNewMessage", "<script>alert('" + "No new message!" + "');</script>");
        }
    }
}