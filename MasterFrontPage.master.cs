using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterFrontPage : System.Web.UI.MasterPage
{
    InSideLogIn mLog;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logIN"] == null)
        {
            lblLogInStatus.Text = "Not Logged In.";
            SiteMapDataSource1.SiteMapProvider = "Basic";
        }
        else if (Session["logIN"] != null)
        {
            mLog = (InSideLogIn)Session["logIN"];
            lblLogInStatus.Text = "Hello " + mLog.LastName;
            switch (mLog.Access)
            {
                case 0:
                    SiteMapDataSource1.SiteMapProvider = "Basicmap";
                    break;
                case 1:
                    SiteMapDataSource1.SiteMapProvider = "S1map";
                    break;
                case 2:
                    SiteMapDataSource1.SiteMapProvider = "TACmap";
                    break;
                case 3:
                    SiteMapDataSource1.SiteMapProvider = "MSIIImap";
                    break;
                case 4:
                    SiteMapDataSource1.SiteMapProvider = "Cadremap";
                    break;
                case 5:
                    SiteMapDataSource1.SiteMapProvider = "S5map";
                    break;
                case 6:
                    SiteMapDataSource1.SiteMapProvider = "MSIVmap";
                    break;
                case 7:
                    SiteMapDataSource1.SiteMapProvider = "Admin";
                    break;
            }
            Button1.Text = "Logout";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["logIN"] != null)
        {
            Session.Remove("logIN");
            Button1.Text = "Login";
            Response.Redirect("~/Basic Site/MainFront.aspx");
        }
        else
        {
            Button1.Text = "Logout";
            Response.Redirect("~/Login/Login.aspx");
        }
    }
}
