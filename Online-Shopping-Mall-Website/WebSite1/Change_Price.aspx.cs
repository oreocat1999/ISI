using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Change_Price : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["visitor"] == null)
        {
            ClientScript.RegisterStartupScript(typeof(string), "Login", "<script>alert('" + "Please login first!" + "');window.location.href ='Login.aspx'</script>");
        }
        else if (Session["visitor"].ToString() != "linda lin")
        {
            ClientScript.RegisterStartupScript(typeof(string), "NotVendor", "<script>alert('" + "Sorry, You are not vendor!" + "');window.location.href ='Home.aspx'</script>");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        OleDbConnection conn1 = new OleDbConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn1.Open();
        string checkProduct = "select count(*) from [Product] where productID=" + Convert.ToInt32(TextBox1.Text);
        OleDbCommand com = new OleDbCommand(checkProduct, conn1);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        conn1.Close();

        if (temp != 0) //Product exists.
        {
            conn1.Open();
            string updatePrice = "update [Product] set [price]=" + Convert.ToInt32(TextBox2.Text)
                + " where [productID]=" + Convert.ToInt32(TextBox1.Text);
            OleDbCommand com1 = new OleDbCommand(updatePrice, conn1);
            com1.ExecuteNonQuery();

            string updatePrice_1 = "update [Shopping_Cart] set [subtotal]=" + Convert.ToInt32(TextBox2.Text)
                + " where [productID]=" + Convert.ToInt32(TextBox1.Text);
            OleDbCommand com2 = new OleDbCommand(updatePrice_1, conn1);
            com2.ExecuteNonQuery();
            conn1.Close();

            ClientScript.RegisterStartupScript(typeof(string), "updateSuccess", "<script>alert('" + "Change price success!" + "');</script>");
            TextBox1.Text = "";
            TextBox2.Text = "";
        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(string), "NoProduct", "<script>alert('" + "Sorry, product not exist!" + "');</script>");
        }
    }
}