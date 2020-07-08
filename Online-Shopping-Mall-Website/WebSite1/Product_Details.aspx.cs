using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Product_Details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["visitor"] == null)
        {
            string query = HttpContext.Current.Request.Url.Query;
            Session["ShoppingCart"] = query;
            Response.Redirect("Login.aspx");
        }
        else
        {
            string query = HttpContext.Current.Request.Url.Query;
            string realQuery = query.Substring(11); // ?productID=realQuery
            int productID = Convert.ToInt32(realQuery);
            int custID = Convert.ToInt32(Session["visitorID"].ToString());
            string price = DetailsView1.Rows[3].Cells[1].Text;
            int realPrice = Convert.ToInt32(price);

            OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string checkShopCart = "select count(*) from [Shopping_Cart] where customerID=" + custID + " and productID=" + productID;
            OleDbCommand com = new OleDbCommand(checkShopCart, conn);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            conn.Close();

            if (temp > 0)
            {
                ClientScript.RegisterStartupScript(typeof(string), "pInShopCart", "<script>alert('" + "You already have this product in your shopping cart!" + "');</script>");
            }
            else
            {
                OleDbConnection conn1 = new OleDbConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn1.Open();
                string insertion = "insert into [Shopping_Cart] ([customerID],[productID],[quantity],[subtotal]) values (@customerID,@productID,@quantity,@subtotal)";
                OleDbCommand com1 = new OleDbCommand(insertion, conn1);
                com1.Parameters.AddWithValue("@customerID", custID);
                com1.Parameters.AddWithValue("@productID", productID);
                com1.Parameters.AddWithValue("@quantity", 1);
                com1.Parameters.AddWithValue("@subtotal", realPrice);
                com1.ExecuteNonQuery();
                conn1.Close();
                ClientScript.RegisterStartupScript(typeof(string), "AddToShopCart", "<script>alert('" + "Add to shopping cart successfully!" + "');</script>");
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
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
}