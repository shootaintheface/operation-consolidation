using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class S1_EditClasses : System.Web.UI.Page
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
         Guid cdtID = new Guid(Session["fid"].ToString());
        try
        {
            System.Data.SqlClient.SqlConnection conn = null;
            System.Data.SqlClient.SqlCommand selectCommand = null;
            try
            {
                conn = new System.Data.SqlClient.SqlConnection(SqlDataSource1.ConnectionString.ToString());
                conn.Open();
                
                selectCommand = new System.Data.SqlClient.SqlCommand("Delete From CLASS_INSTANCE Where CDT_ID = @ID", conn);
                selectCommand.Parameters.Add("ID", SqlDbType.UniqueIdentifier).Value = cdtID;
                int queryResult = selectCommand.ExecuteNonQuery();
                if (queryResult == 1)
                {
                    lblResult.Text = "Record Deleted!";
                }

                #region Catch Shit
            }
            catch (Exception ex)
            {
                lblResult.Text = "Error: " + ex.Message;
            }
        }
        catch (Exception ex)
        {
            lblResult.Text = "Error: " + ex.Message;
        }
                #endregion
        Response.Redirect("~/S1/EditClasses.aspx");
    }
    protected void  GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
        Guid ID = new Guid(row.Cells[4].Text);
        lblResult.Text = "You have selected: " + row.Cells[1].Text;

        Session.Remove("fid");
        Session.Add("fid", ID);
    }
}