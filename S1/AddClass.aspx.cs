using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class S1_AddClass : System.Web.UI.Page
{
    InSideLogIn cLog;
    private string name,cdrID;
    private static int dbCounter;
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        cdrID = ddlCDR.SelectedValue.ToString();
        Guid id = new Guid(cdrID);
        name = txtName.Text;
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
                    System.Data.SqlClient.SqlCommand insertCommand = null;

                    selectCommand = new System.Data.SqlClient.SqlCommand("SELECT COUNT(*) FROM CLASS", conn);
                    dbCounter = (int)selectCommand.ExecuteScalar();
                    insertCommand = new System.Data.SqlClient.SqlCommand("Insert Into [CLASS] (CLS_ID, CDR_ID, CLS_NAME) Values" +
                        " (NEWID(), @cdid, @n)", conn);
                    //insertCommand.Parameters.Add("cid", System.Data.SqlDbType.Int).Value = dbCounter;
                    insertCommand.Parameters.Add("cdid", System.Data.SqlDbType.UniqueIdentifier).Value = id;
                    insertCommand.Parameters.Add("n", System.Data.SqlDbType.VarChar).Value = name;
                    int queryResult = insertCommand.ExecuteNonQuery();
                    if (queryResult == 1)
                    {
                        lblResult.Text = "Succesfully Added Class.";
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