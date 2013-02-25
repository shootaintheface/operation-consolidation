using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cadre_AddNotes : System.Web.UI.Page
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
        if (Session["cid"] != null)
        {
            id = new Guid(Session["cid"].ToString());
            try
            {
                System.Data.SqlClient.SqlConnection conn = null;
                System.Data.SqlClient.SqlCommand selectCommand = null;
                try
                {
                    conn = new System.Data.SqlClient.SqlConnection(SqlDataSource1.ConnectionString.ToString());
                    conn.Open();
                    selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CLS_NAME FROM CLASS Where CLS_ID = @id", conn);
                    selectCommand.Parameters.Add("id", System.Data.SqlDbType.UniqueIdentifier).Value = id;
                    lblClass.Text = (string)selectCommand.ExecuteScalar();
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
        }
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
                        "Insert into CLASS_NOTES Values(NEWID(), @CID, @Cont, @Date)",
                        conn);
                    insertCommand.Parameters.Add("CID", System.Data.SqlDbType.UniqueIdentifier).Value = id;
                    insertCommand.Parameters.Add("Cont", System.Data.SqlDbType.VarChar).Value = txtContent.Text;
                    insertCommand.Parameters.Add("Date", System.Data.SqlDbType.Date).Value = System.DateTime.Today;
                    
                    int queryResult = insertCommand.ExecuteNonQuery();
                    if (queryResult == 1)
                        lblResult.Text = "News Record Created Successfully";
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
            lblResult.Text = ex.Message;
        }
    }
}