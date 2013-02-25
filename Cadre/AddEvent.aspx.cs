using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Cadre_AddEvent : System.Web.UI.Page
{
    Guid id;
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
        id = new Guid(Session["clsID"].ToString());
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            System.Data.SqlClient.SqlConnection conn = null;
            try
            {
                try
                {
                    conn = new System.Data.SqlClient.SqlConnection(SqlDataSource1.ConnectionString.ToString());
                    conn.Open();

                    System.Data.SqlClient.SqlCommand insertCommand = null;

                    insertCommand = new System.Data.SqlClient.SqlCommand(
                        "Insert into CLASS_CALENDAR Values(NEWID(), @CID, @Date, @Con)",
                        conn);
                    insertCommand.Parameters.Add("CID", SqlDbType.VarChar).Value = id.ToString();
                    insertCommand.Parameters.Add("Date", SqlDbType.Date).Value = txtDate.Text;
                    insertCommand.Parameters.Add("Con", SqlDbType.VarChar).Value = txtContent.Text;

                    int queryResult = insertCommand.ExecuteNonQuery();
                    if (queryResult == 1)
                    {
                        lblResult.Text = "News Record Created Successfully";
                        Response.Redirect("~/Cadre/AddCalendarEvents.aspx");
                    }
                }
                catch (Exception ex)
                {
                    lblResult.Text = "Error: " + ex.Message;
                }
            }
            finally
            {
                if (conn != null)
                    conn.Close();
            }
        }
        catch (Exception ex)
        {
            lblResult.Text = "Error: " + ex.Message;
        }
    }
}