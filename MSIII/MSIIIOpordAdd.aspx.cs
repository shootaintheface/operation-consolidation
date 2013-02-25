using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MSIII_MSIIIOpordAdd : System.Web.UI.Page
{
    InSideLogIn log;
    Guid opID;
    protected void Page_Load(object sender, EventArgs e)
    {
        log = (InSideLogIn)Session["logIN"];
        if (Session["logIN"] == null)
        {
            Response.Redirect("~/Login/Login.aspx");
        }
        else if (log.Access != 3 && log.Access != 4 && log.Access != 2 && log.Access != 6 && log.Access != 7)
            Response.Redirect("~/Login/Error.aspx");
        if (Session["op"] != null)
        {
            lblResult.Text = (string)Session["op"];
            try
            {
                System.Data.SqlClient.SqlConnection conn = null;
                System.Data.SqlClient.SqlCommand selectCommand = null;
                try
                {
                    try
                    {
                        conn = new System.Data.SqlClient.SqlConnection(SqlDataSource1.ConnectionString.ToString());
                        conn.Open();
                        selectCommand = new System.Data.SqlClient.SqlCommand("Select OP_NAME From OPORD Where OP_ID = @id", conn);
                        selectCommand.Parameters.Add("id", SqlDbType.UniqueIdentifier).Value = opID;
                        string opName = (string)selectCommand.ExecuteScalar();

                        lblOpName.Text = opName;
                    }
                    catch (Exception ex)
                    {
                        lblResult.Text = ex.Message;
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

            opID = new Guid((string)Session["op"]);
        }
        else Response.Redirect("~/MSIII/MSIIIAddOPORD.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            System.Data.SqlClient.SqlConnection conn = null;
            System.Data.SqlClient.SqlCommand selectCommand = null;
            try
            {
                try
                {
                    conn = new System.Data.SqlClient.SqlConnection(SqlDataSource1.ConnectionString.ToString());
                    conn.Open();
                    selectCommand = new System.Data.SqlClient.SqlCommand("Select OP_NAME From OPORD Where OP_ID = @id", conn);
                    selectCommand.Parameters.Add("id", SqlDbType.UniqueIdentifier).Value = opID;
                    string opName = (string)selectCommand.ExecuteScalar();

                    System.Data.SqlClient.SqlCommand insertCommand = null;
                    
                    insertCommand = new System.Data.SqlClient.SqlCommand(
                        "Insert into OP_BLOB Values(NEWID(), @id, @name, @type, @content)",
                        conn);
                    //insertCommand.Parameters.Add("OPID", SqlDbType.Int).Value = databaseCounter + 1;
                    insertCommand.Parameters.Add("id", SqlDbType.UniqueIdentifier).Value = opID;
                    insertCommand.Parameters.Add("name", SqlDbType.VarChar).Value = txtBlobName.Text;
                    insertCommand.Parameters.Add("type", SqlDbType.VarChar).Value = txtFileType.Text;
                    insertCommand.Parameters.Add("content", SqlDbType.VarBinary).Value = UploadFile.FileBytes;

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
            lblResult.Text = "Error: " + ex.Message;
        }
    }
}