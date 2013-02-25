using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class S1_ManagePersonnel : System.Web.UI.Page
{
    InSideLogIn cLog;
    Person pMan;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logIN"] == null)
        {
            Response.Redirect("~/Login/Login.aspx");
        }
        else
        {
            cLog = (InSideLogIn)Session["logIN"];
            if (cLog.Access == 0 || cLog.Access == 2 || cLog.Access == 3 || cLog.Access == 4 || cLog.Access == 5)
            {
                Response.Redirect("~/Login/Login.aspx");
            }
        }
    }

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        pMan = new Person();
        GridViewRow row = GridView1.SelectedRow;
        lblTest.Text = "You have selected: " + row.Cells[2].Text;

        pMan.FName = row.Cells[1].Text;
        pMan.LName = row.Cells[2].Text;
        pMan.MI = row.Cells[3].Text;
        pMan.Phone = row.Cells[4].Text;
        pMan.Email = row.Cells[5].Text;
        pMan.Ako = row.Cells[6].Text;

        if (Session["pMan"] != null)
        {
            Session.Remove("pMan");
        }
        else
        {
            Session.Add("pMan", pMan);
            Response.Redirect("~/S1/EditPersonnel.aspx");
        }
       
    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        pMan = new Person();
        GridViewRow row = GridView2.SelectedRow;
        lblTest.Text = "You have selected: " + row.Cells[2].Text;

        pMan.FName = row.Cells[0].Text;
        pMan.LName = row.Cells[1].Text;
        pMan.MI = row.Cells[2].Text;
        pMan.Phone = row.Cells[3].Text;
        pMan.Email = row.Cells[4].Text;
        pMan.Ako = row.Cells[5].Text;


        if (Session["pMan"] != null)
        {
            Session.Remove("pMan");
        }
        else
        {
            Session.Add("pMan", pMan);
            Response.Redirect("~/S1/EditPersonnel.aspx");
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }
}