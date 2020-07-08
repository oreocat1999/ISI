using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["reportDate"] = 30;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["reportDate"] = 30;

        GridView2.Visible = false;
        GridView1.Visible = true;

        if(TextBox1.Text.Length >= 1) { 
        DateTime date = DateTime.Now;
        Int32 ReportDateSample = ReportDateSample = (date.Year - 1) * 10000; 

        if (date.Day > Convert.ToInt32(TextBox1.Text))
        {
            ReportDateSample = date.Year * 10000 + date.Month * 100 + date.Day - Convert.ToInt32(TextBox1.Text);
        }
        else if (date.Day < Convert.ToInt32(TextBox1.Text) && Convert.ToInt32(TextBox1.Text) < date.Day + 31)
        {
            ReportDateSample = date.Year * 10000 + (date.Month - 1) * 100 + (31 - (Convert.ToInt32(TextBox1.Text) - date.Day));
        }
        else if (Convert.ToInt32(TextBox1.Text) > date.Day + 31 && Convert.ToInt32(TextBox1.Text) < date.Day + 59)
        {
            ReportDateSample = date.Year * 10000 + (date.Month - 2) * 100 + (28 - (Convert.ToInt32(TextBox1.Text) - date.Day - 31));
        }
        else if (Convert.ToInt32(TextBox1.Text) > date.Day + 59 && Convert.ToInt32(TextBox1.Text) < date.Day + 90)
        {
            ReportDateSample = date.Year * 10000 + (date.Month - 3) * 100 + (31 - (Convert.ToInt32(TextBox1.Text) - date.Day - 59));
        } else if (Convert.ToInt32(TextBox1.Text) > date.Day + 90) {
            ReportDateSample = (date.Year-1) * 10000;
        }

        Session["reportDate"] = ReportDateSample;
        }
        GridView1.DataSourceID = null;
        GridView1.DataSource = SqlDataSource1;
        GridView1.DataBind();

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Session["reportDate"] = 30;

        GridView1.Visible = false;
        GridView2.Visible = true;

        if (TextBox1.Text.Length >= 1)
        {
            DateTime date = DateTime.Now;
            Int32 ReportDateSample = ReportDateSample = (date.Year - 1) * 10000;

            if (date.Day > Convert.ToInt32(TextBox1.Text))
            {
                ReportDateSample = date.Year * 10000 + date.Month * 100 + date.Day - Convert.ToInt32(TextBox1.Text);
            }
            else if (date.Day < Convert.ToInt32(TextBox1.Text) && Convert.ToInt32(TextBox1.Text) < date.Day + 31)
            {
                ReportDateSample = date.Year * 10000 + (date.Month - 1) * 100 + (31 - (Convert.ToInt32(TextBox1.Text) - date.Day));
            }
            else if (Convert.ToInt32(TextBox1.Text) > date.Day + 31 && Convert.ToInt32(TextBox1.Text) < date.Day + 59)
            {
                ReportDateSample = date.Year * 10000 + (date.Month - 2) * 100 + (28 - (Convert.ToInt32(TextBox1.Text) - date.Day - 31));
            }
            else if (Convert.ToInt32(TextBox1.Text) > date.Day + 59 && Convert.ToInt32(TextBox1.Text) < date.Day + 90)
            {
                ReportDateSample = date.Year * 10000 + (date.Month - 3) * 100 + (31 - (Convert.ToInt32(TextBox1.Text) - date.Day - 59));
            }
            else if (Convert.ToInt32(TextBox1.Text) > date.Day + 90)
            {
                ReportDateSample = (date.Year - 1) * 10000;
            }

            Session["reportDate"] = ReportDateSample;
        }
        GridView2.DataSourceID = null;
        GridView2.DataSource = SqlDataSource2;
        GridView2.DataBind();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Session["reportDate"] = 30;

        if (TextBox1.Text.Length >= 1)
        {
            DateTime date = DateTime.Now;
            Int32 ReportDateSample = ReportDateSample = (date.Year - 1) * 10000;

            if (date.Day > Convert.ToInt32(TextBox1.Text))
            {
                ReportDateSample = date.Year * 10000 + date.Month * 100 + date.Day - Convert.ToInt32(TextBox1.Text);
            }
            else if (date.Day < Convert.ToInt32(TextBox1.Text) && Convert.ToInt32(TextBox1.Text) < date.Day + 31)
            {
                ReportDateSample = date.Year * 10000 + (date.Month - 1) * 100 + (31 - (Convert.ToInt32(TextBox1.Text) - date.Day));
            }
            else if (Convert.ToInt32(TextBox1.Text) > date.Day + 31 && Convert.ToInt32(TextBox1.Text) < date.Day + 59)
            {
                ReportDateSample = date.Year * 10000 + (date.Month - 2) * 100 + (28 - (Convert.ToInt32(TextBox1.Text) - date.Day - 31));
            }
            else if (Convert.ToInt32(TextBox1.Text) > date.Day + 59 && Convert.ToInt32(TextBox1.Text) < date.Day + 90)
            {
                ReportDateSample = date.Year * 10000 + (date.Month - 3) * 100 + (31 - (Convert.ToInt32(TextBox1.Text) - date.Day - 59));
            }
            else if (Convert.ToInt32(TextBox1.Text) > date.Day + 90)
            {
                ReportDateSample = (date.Year - 1) * 10000;
            }

            Session["reportDate"] = ReportDateSample;
        }
        GridView1.DataSourceID = null;
        GridView1.DataSource = SqlDataSource1;
        GridView1.DataBind();

        GridView2.DataSourceID = null;
        GridView2.DataSource = SqlDataSource2;
        GridView2.DataBind();

        GridView1.Visible = true;
        GridView2.Visible = true;
    }
}