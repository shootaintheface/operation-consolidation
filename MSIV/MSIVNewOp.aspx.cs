using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MSIV_MSIVNewOp : System.Web.UI.Page
{
    InSideLogIn log;
    public static int databaseCounter;
    public static int blobCounter;
    protected void Page_Load(object sender, EventArgs e)
    {
        log = (InSideLogIn)Session["logIN"];
        if (Session["logIN"] == null)
        {
            Response.Redirect("~/Login/Login.aspx");
        }
        else if (log.Access != 4 && log.Access != 2 && log.Access != 6 && log.Access != 7)
            Response.Redirect("~/Login/Error.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Guid id = new Guid(log.IdNumber);
        int lvl = log.Access;
        if (lvl > 4) { lvl = 4; }

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
                    selectCommand = new System.Data.SqlClient.SqlCommand("SELECT COUNT(*) FROM OPORD", conn);
                    databaseCounter = (int)selectCommand.ExecuteScalar();

                    lblCount.Text = "There are " + databaseCounter + " OPORDS";
                    lblBCount.Text = "There are " + blobCounter + " Files in this oporder.";

                    System.Data.SqlClient.SqlCommand insertCommand = null;

                    insertCommand = new System.Data.SqlClient.SqlCommand(
                        "Insert into OPORD Values(NEWID(), @Name, @Date, @ID, @lvl, @pub)",
                        conn);
                    //insertCommand.Parameters.Add("OPID", SqlDbType.Int).Value = databaseCounter + 1;
                    insertCommand.Parameters.Add("Name", SqlDbType.VarChar).Value = txtName.Text;
                    insertCommand.Parameters.Add("Date", SqlDbType.Date).Value = System.DateTime.Today;
                    insertCommand.Parameters.Add("ID", SqlDbType.UniqueIdentifier).Value = id;
                    insertCommand.Parameters.Add("lvl", SqlDbType.Int).Value = lvl.ToString();
                    insertCommand.Parameters.Add("pub", SqlDbType.Char).Value = 'n';

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
            try
            {
                conn = new System.Data.SqlClient.SqlConnection(SqlDataSource1.ConnectionString.ToString());
                conn.Open();
                selectCommand = new System.Data.SqlClient.SqlCommand("SELECT OP_ID FROM OPORD Where OP_NAME = @name", conn);
                selectCommand.Parameters.Add("name", SqlDbType.VarChar).Value = txtName.Text;
                string opid = selectCommand.ExecuteScalar().ToString();

                Guid id2 = new Guid(opid);

                System.Data.SqlClient.SqlCommand insertCommand1 = null;

                insertCommand1 = new System.Data.SqlClient.SqlCommand(
                            "Insert into OP_BLOB Values(NewID(), @OpID, @Name, @Type, @Content)", conn);
                //insertCommand1.Parameters.Add("BID", SqlDbType.Int).Value = blobCounter++;
                insertCommand1.Parameters.Add("OpID", SqlDbType.UniqueIdentifier).Value = id2;
                insertCommand1.Parameters.Add("Name", SqlDbType.VarChar).Value = txtBlobName.Text;
                insertCommand1.Parameters.Add("Type", SqlDbType.VarChar).Value = txtFileType.Text;
                insertCommand1.Parameters.Add("Content", SqlDbType.VarBinary).Value = UploadFile.FileBytes;

                int queryResult1 = insertCommand1.ExecuteNonQuery();
                if (queryResult1 == 1)
                    lblResult.Text = "Blob Added";
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
        if (lblResult.Text == "BlobAdded")
        {
            Response.Redirect("~/MSIV/MSIVOpAdd.aspx");
        }
    }
}