using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        OleDbConnection conn1 = new OleDbConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn1.Open();
        string checkUser = "select count(*) from [Customer] where firstName='" + tbfName.Text + "' and lastName='" + tblName.Text + "'";
        OleDbCommand com = new OleDbCommand(checkUser, conn1);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        conn1.Close();

        if (temp == 1)// user exists.
        {
            conn1.Open();
            string hashPwd = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(tbPassword.Text, "MD5");

            string checkPwd = "select password from [Customer] where firstName='" + tbfName.Text + "' and lastName='" + tblName.Text + "'";
            OleDbCommand com1 = new OleDbCommand(checkPwd, conn1);
            string pwd = com1.ExecuteScalar().ToString().Replace(" ", "");
            conn1.Close();

            if (pwd == hashPwd)
            {
                Session["visitor"] = tbfName.Text + " " + tblName.Text;
                conn1.Open();
                string custID = "select customerID from [Customer] where firstName='" + tbfName.Text + "' and (lastName='" + tblName.Text
                                    + "' and password='" + hashPwd + "')";
                OleDbCommand com3 = new OleDbCommand(custID, conn1);
                int customerID = Convert.ToInt32(com3.ExecuteScalar().ToString());
                conn1.Close();
                Session["visitorID"] = customerID;

                conn1.Open();
                string checkVender = "select isVender from [Customer] where firstName='" + tbfName.Text + "' and (lastName='" + tblName.Text
                                    + "' and password='" + hashPwd + "')";
                OleDbCommand com2 = new OleDbCommand(checkVender, conn1);
                int isVender = Convert.ToInt32(com2.ExecuteScalar().ToString());
                conn1.Close();

                if (isVender == 1)
                {
                    ClientScript.RegisterStartupScript(typeof(string), "WelcomeVender", "<script>alert('" + "Welcome! My only Vender..." + "');window.location.href = 'Vender_Home.aspx'</script>");
                }
                else
                {
                    ClientScript.RegisterStartupScript(typeof(string), "WelcomeCustomer", "<script>alert('" + "Welcome!" + "');window.location.href = 'Home.aspx'</script>");
                }
                
            }
            else
            {
                ClientScript.RegisterStartupScript(typeof(string), "print", "<script>alert('" + "Incorrect password..." + "');</script>");
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(typeof(string), "print", "<script>alert('" + "Incorrect firstname or lastname..." + "');</script>");
        }
    }
}