using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string checkUser = "select count(*) from [Customer] where firstName='" + tbfName.Text + "' and lastName='" + tblName.Text + "'";
                OleDbCommand com1 = new OleDbCommand(checkUser, conn);
                int temp = Convert.ToInt32(com1.ExecuteScalar().ToString());
                conn.Close();

                if (temp == 1)// user already exists.
                {
                    ClientScript.RegisterStartupScript(typeof(string), "UserExistence", "<script>alert('user existed')</script>");
                    tbfName.Text = "";
                    tblName.Text = "";
                    tbPassword.Text = "";
                    rePassword.Text = "";
                }

                if (temp == 0)// user doesn't exist.
                {
                    string hashPwd = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(tbPassword.Text, "MD5");

                    OleDbConnection conn1 = new OleDbConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    conn1.Open();
                    string insertion = "insert into [Customer] ([firstName],[lastName],[email],[password],[address]) " +
                        "values (@firstName,@lastName,@email,@password,@address)";
                    OleDbCommand com = new OleDbCommand(insertion, conn1);
                    com.Parameters.AddWithValue("@firstName", tbfName.Text);
                    com.Parameters.AddWithValue("@lastName", tblName.Text);
                    com.Parameters.AddWithValue("@email", tbEmail.Text);
                    com.Parameters.AddWithValue("@password", hashPwd);
                    com.Parameters.AddWithValue("@address", tbAddress.Text);
                    com.ExecuteNonQuery();
                    conn1.Close();
                    Session["visitor"] = tbfName.Text + " " + tblName.Text;

                    conn1.Open();
                    string custID = "select customerID from [Customer] where firstName='" + tbfName.Text + "' and (lastName='" + tblName.Text
                                        + "' and password='" + hashPwd + "')";
                    OleDbCommand com3 = new OleDbCommand(custID, conn1);
                    int customerID = Convert.ToInt32(com3.ExecuteScalar().ToString());
                    conn1.Close();
                    Session["visitorID"] = customerID;

                    ClientScript.RegisterStartupScript(typeof(string), "Register", "<script>alert('" + "Successful Registration" + "');" +
                        "window.location.href ='Home.aspx'</script>");
                }
            }
            catch (Exception ex)
            { Response.Write(ex.ToString()); }
        }
    }
}