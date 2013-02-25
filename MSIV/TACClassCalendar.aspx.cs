using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MSIV_TACClassCalendar : System.Web.UI.Page
{
    Guid cid;
    InSideLogIn log;
    protected void Page_Load(object sender, EventArgs e)
    {
        log = (InSideLogIn)Session["logIN"];
        if (Session["logIN"] == null)
        {
            Response.Redirect("~/Login/Login.aspx");
        }
        else if (log.Access != 4 && log.Access != 6 && log.Access != 7)
            Response.Redirect("~/Login/Error.aspx");
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        cid = new Guid((string)DropDownList1.SelectedValue);
        Session.Remove("clsID");
        Session.Add("clsID", cid);
        Response.Redirect("~/Cadre/AddEvent.aspx");
    }
}