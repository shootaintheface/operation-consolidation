using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class S1_S1Home : System.Web.UI.Page
{
    InSideLogIn log;
    protected void Page_Load(object sender, EventArgs e)
    {
        log = (InSideLogIn)Session["logIN"];
        if (Session["logIN"] == null)
        {
            Response.Redirect("~/Login/Login.aspx");
        }
        else if (log.Access != 1 && log.Access != 6 && log.Access != 7)
            Response.Redirect("~/Login/Error.aspx");

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/S1/BulkUpload.aspx");
    }
}