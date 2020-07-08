using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Change_Password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
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
                string checkpwd = "select password from [Customer] where firstName='" + tbfName.Text + "' and lastName='" + tblName.Text + "'";
                OleDbCommand com1 = new OleDbCommand(checkpwd, conn1);
                string pwd = com1.ExecuteScalar().ToString().Replace(" ", "");
                string hashPwd = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(tborPwd.Text, "MD5");
                conn1.Close();

                if (pwd == hashPwd)
                {
                    Session["visitor"] = tbfName.Text + " " + tblName.Text;

                    conn1.Open();
                    com.CommandText = "update [Customer] set [password]=? where [firstName]=? and [lastName]=?";
                    string hashNewPassword = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(tbnewPwd.Text, "MD5");
                    com.Parameters.Add(new OleDbParameter(null, hashNewPassword.ToString()));
                    com.Parameters.Add(new OleDbParameter(null, tbfName.Text.ToString()));
                    com.Parameters.Add(new OleDbParameter(null, tblName.Text.ToString()));
                    com.ExecuteNonQuery();
                    conn1.Close();

                    conn1.Open();
                    string custID = "select customerID from [Customer] where firstName='" + tbfName.Text + "' and (lastName='" + tblName.Text
                                        + "' and password='" + hashNewPassword.ToString() + "')";
                    OleDbCommand com3 = new OleDbCommand(custID, conn1);
                    int customerID = Convert.ToInt32(com3.ExecuteScalar().ToString());
                    conn1.Close();
                    Session["visitorID"] = customerID;

                    ClientScript.RegisterStartupScript(typeof(string), "Update", "<script>alert('" + "Update successful!" + "');window.location.href = 'Home.aspx'</script>");
                }
                else
                {
                    ClientScript.RegisterStartupScript(typeof(string), "IncorOrPwd", "<script>alert('" + "Incorrect original password..." + "');</script>");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(typeof(string), "IncorName", "<script>alert('" + "Incorrect firstname or lastname..." + "');</script>");
            }
        }
    }
}