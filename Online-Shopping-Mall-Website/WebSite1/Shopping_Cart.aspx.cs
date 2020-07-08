using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Shopping_Cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (GridView1.Rows.Count == 0)
        {
            GridView2.Visible = false;
            Label1.Text = "Your shopping cart is empty.";
            Label1.Visible = true;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["visitor"] == null)
        {
            string query = HttpContext.Current.Request.Url.Query;
            Response.Redirect("Login.aspx");
        }
        else
        {
            int row = 0;

            if (GridView1.Rows.Count != 0)
            {
                while (row < GridView1.Rows.Count)
                {
                    string query = HttpContext.Current.Request.Url.Query;
                    int productID = Convert.ToInt32(GridView1.Rows[row].Cells[0].Text);
                    int custID = Convert.ToInt32(Session["visitorID"].ToString());
                    int quantity = Convert.ToInt32(GridView1.Rows[row].Cells[3].Text);
                    string price = GridView1.Rows[row].Cells[2].Text;
                    int realPrice = Convert.ToInt32(price);
                    int subtotal = realPrice * quantity;
                    string status = "Pending";
                    DateTime date = DateTime.Now;
                    int purchaseDate = date.Year*10000+date.Month*100+date.Day;

                    if (row == 0)
                    {
                        OleDbConnection conn1 = new OleDbConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                        conn1.Open();
                        string insertion = "insert into [Order] ([customerID],[purchaseDate],[status]) values (@customerID,@purchaseDate,@status)";
                        OleDbCommand com1 = new OleDbCommand(insertion, conn1);
                        com1.Parameters.AddWithValue("@customerID", custID);
                        com1.Parameters.AddWithValue("@purchaseDate", purchaseDate);
                        com1.Parameters.AddWithValue("@status", status);
                        com1.ExecuteNonQuery();
                        conn1.Close();
                    }

                    OleDbConnection conn2 = new OleDbConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    conn2.Open();
                    OleDbCommand command = new OleDbCommand("SELECT MAX(POnumber) FROM [Order] WHERE customerID=" + custID, conn2);
                    int POnumber = Convert.ToInt32(command.ExecuteScalar().ToString());
                    Session["POnumber"] = POnumber;
                    string insertion2 = "insert into [Order_Details] ([productID],[POnumber],[price],[quantity],[subtotal]) values (@productID,@POnumber, @price,@quantity,@subtotal)";
                    OleDbCommand com2 = new OleDbCommand(insertion2, conn2);
                    com2.Parameters.AddWithValue("@productID", productID);
                    com2.Parameters.AddWithValue("@POnumber", POnumber);
                    com2.Parameters.AddWithValue("@price", price);
                    com2.Parameters.AddWithValue("@quantity", quantity);
                    com2.Parameters.AddWithValue("@subtotal", subtotal);
                    com2.ExecuteNonQuery();
                    conn2.Close();
                    OleDbConnection conn4 = new OleDbConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    conn4.Open();
                    OleDbCommand command2 = new OleDbCommand(cmdText: "DELETE * FROM [Shopping_Cart] WHERE customerID=" + custID + " and productID=" + productID, connection: conn4);
                    command2.ExecuteNonQuery();
                    conn4.Close();
                    row++;
                }
                ClientScript.RegisterStartupScript(typeof(string), "Add to Order", "<script>alert('" + "Add to order successfully!" + "');</script>");
                GridView1.DataBind();
                Response.Redirect("Order_Details.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(typeof(string), "EmptyShopCart", "<script>alert('" + "Your shopping cart is empty!" + "');</script>");
            }

        }
    }
}