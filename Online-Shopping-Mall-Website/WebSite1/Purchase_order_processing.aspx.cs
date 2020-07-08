using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Purchase_order_processing : System.Web.UI.Page
{
    string query = HttpContext.Current.Request.Url.Query;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["visitor"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else {

            Session["Purchase_POnumber"] = Convert.ToInt32(query.Substring(10));
            int Purchase_POnumber = Convert.ToInt32(query.Substring(10));
            OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            OleDbCommand command = new OleDbCommand("SELECT customerID FROM [Order] WHERE POnumber=" + Purchase_POnumber, conn);
            int BuyerID = Convert.ToInt32(command.ExecuteScalar().ToString());
            Session["BuyerID"] = BuyerID;
            conn.Close();
        }
        if(GridView4.Rows[0].Cells[3].Text == "Shipped") { Button1.Visible = false; }
        if (GridView4.Rows[0].Cells[3].Text == "Pending")
        {
            GridView4.Columns[2].Visible = false;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (GridView4.Rows[0].Cells[3].Text != "Shipped")
        {
            DateTime date = DateTime.Now;
            string shipmentDate = date.ToString("dd/MM/yyyy");

            OleDbConnection conn2 = new OleDbConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn2.Open();
            int Purchase_POnumber = Convert.ToInt32(query.Substring(10));
            string status = "Shipped";
            string updating = "update [Order] set [status]=? where [POnumber]=?";
            OleDbCommand com2 = new OleDbCommand(updating, conn2);
            com2.Parameters.Add(new OleDbParameter(null, status));
            com2.Parameters.Add(new OleDbParameter(null, Purchase_POnumber));
            com2.ExecuteNonQuery();
            conn2.Close();

            conn2.Open();
            string updateShipment = "update [Order] set [shipmentDate]=? where [POnumber]=?";
            OleDbCommand com3 = new OleDbCommand(updateShipment, conn2);
            com3.Parameters.Add(new OleDbParameter(null, shipmentDate));
            com3.Parameters.Add(new OleDbParameter(null, Purchase_POnumber));
            com3.ExecuteNonQuery();
            conn2.Close();

            conn2.Open();
            OleDbCommand com4 = new OleDbCommand("SELECT customerID FROM [Order] WHERE POnumber=" + Purchase_POnumber, conn2);
            int customerID = Convert.ToInt32(com4.ExecuteScalar().ToString());
            string findFName = "select firstName from [Customer] where customerID=" + customerID;
            OleDbCommand com5 = new OleDbCommand(findFName, conn2);
            string firstName = com5.ExecuteScalar().ToString();
            string findLName = "select lastName from [Customer] where customerID=" + customerID;
            OleDbCommand com6 = new OleDbCommand(findLName, conn2);
            string lastName = com6.ExecuteScalar().ToString();
            conn2.Close();
            conn2.Open();
            string insertion = "insert into [Notification] ([POnumber],[customerID],[fullname],[message],[read]) values (@POnumber,@customerID,@fullname,@message,@read)";
            OleDbCommand com = new OleDbCommand(insertion, conn2);
            com.Parameters.AddWithValue("@POnumber", Purchase_POnumber);
            com.Parameters.AddWithValue("@customerID", customerID);
            com.Parameters.AddWithValue("@fullname", firstName + " " + lastName);
            com.Parameters.AddWithValue("@message", "Dear customer, this order has been shipped.");
            com.Parameters.AddWithValue("@read", "No");
            com.ExecuteNonQuery();
            conn2.Close();

            ClientScript.RegisterStartupScript(typeof(string), "Shipping", "<script>alert('" + "Successful shipping!" + "');</script>");
            GridView4.DataBind();
            Button1.Visible = false;
        }
    }
}