using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cadre_CadreAddNotes : System.Web.UI.Page
{
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
    protected void Button3_Click(object sender, EventArgs e)
    {
        Guid Id = new Guid(DropDownList1.SelectedValue);

        Session.Remove("cid");
        Session.Add("cid", Id);

        Response.Redirect("~/Cadre/AddNotes.aspx");
    }
}