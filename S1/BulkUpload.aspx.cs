using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class S1_BulkUpload : System.Web.UI.Page
{
    Guid id = new Guid();
    static bool fileExists = false;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
       
        if (FileUpload1.HasFile)
        {
            try
            {
                fileExists = false;
                FileUpload1.SaveAs(Server.MapPath("~/Files/Excel.xls"));
                lblResult.Text = "Upload Successful: " + id.ToString();
                fileExists = true;

                System.Data.OleDb.OleDbDataAdapter da = new System.Data.OleDb.OleDbDataAdapter();
                da.SelectCommand = ExcelConnection();

                System.Data.DataSet ds = new System.Data.DataSet();
                da.Fill(ds);

                GridView1.DataSource = ds.Tables[0].DefaultView;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                lblResult.Text = ex.Message;
            }
        }
        else { lblResult.Text = "Please select a file."; }

    }

    protected System.Data.OleDb.OleDbCommand ExcelConnection()
    {
        string xConnStr = "Provider=Microsoft.ACE.OLEDB.12.0;" +
            "Data Source=" + Server.MapPath("~/Files/Excel.xls") + ";" +
            "Extended Properties=Excel 12.0;";

        System.Data.OleDb.OleDbConnection objXConn = new System.Data.OleDb.OleDbConnection(xConnStr);
        objXConn.Open();

        System.Data.OleDb.OleDbCommand objCommand = new System.Data.OleDb.OleDbCommand("SELECT * FROM [Roster$]", objXConn);
        return objCommand;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string ms, first, mid, last, ako, sch, log, phone;
        int lvl;
        try
        {
            System.Data.SqlClient.SqlConnection conn = null;
            conn = new System.Data.SqlClient.SqlConnection(SqlDataSource1.ConnectionString.ToString());
            conn.Open();
            System.Data.SqlClient.SqlCommand insertCommand = null;
            if (fileExists == true)
            {
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    ms = GridView1.Rows[i].Cells[0].Text;
                    first = GridView1.Rows[i].Cells[1].Text;
                    mid = GridView1.Rows[i].Cells[2].Text;
                    last = GridView1.Rows[i].Cells[3].Text;
                    ako = GridView1.Rows[i].Cells[5].Text;
                    sch = GridView1.Rows[i].Cells[6].Text;
                    log = GridView1.Rows[i].Cells[7].Text;
                    phone = GridView1.Rows[i].Cells[4].Text;
                    

                    #region check for null
                    if (GridView1.Rows[i].Cells[8].Text == "&nbsp;")
                    {
                        lvl = 0;
                    }
                    else { lvl = Convert.ToInt32(GridView1.Rows[i].Cells[8].Text); }
                    if (ms == "&nbsp;") { ms = ""; }
                    if (first == "&nbsp;") { first = ""; }
                    if (mid == "&nbsp;") { mid = ""; }
                    if (last == "&nbsp;") { last = ""; }
                    if (ako == "&nbsp;") { ako = ""; }
                    if (sch == "&nbsp;") { sch = ""; }
                    if (log == "&nbsp;") { log = ""; }
                    if (phone == "&nbsp;") { phone = ""; }
                    #endregion

                    insertCommand = new System.Data.SqlClient.SqlCommand("Insert Into [CADET] (CDT_ID, CDT_FNAME, CDT_LNAME, CDT_MINITIAL, CDT_PHONE, CDT_EMAIL, CDT_AKO, CDT_LOGIN, CDT_AUTH, CDT_MSLEVEL) Values" +
                        " (NEWID(), @fn, @ln, @mn, @p, @em, @ako, @log, @acc, @ms)", conn);

                    insertCommand.Parameters.Add("fn", System.Data.SqlDbType.VarChar).Value = first;
                    insertCommand.Parameters.Add("ln", System.Data.SqlDbType.VarChar).Value = last;
                    insertCommand.Parameters.Add("mn", System.Data.SqlDbType.VarChar).Value = mid;
                    insertCommand.Parameters.Add("p", System.Data.SqlDbType.VarChar).Value = phone;
                    insertCommand.Parameters.Add("em", System.Data.SqlDbType.VarChar).Value = sch;
                    insertCommand.Parameters.Add("ako", System.Data.SqlDbType.VarChar).Value = ako;
                    insertCommand.Parameters.Add("log", System.Data.SqlDbType.VarChar).Value = log;
                    insertCommand.Parameters.Add("acc", System.Data.SqlDbType.VarChar).Value = lvl;
                    insertCommand.Parameters.Add("ms", System.Data.SqlDbType.VarChar).Value = ms;
                    int queryResult = insertCommand.ExecuteNonQuery();
                    if (queryResult > 0)
                    {
                        lblResult.Text = "Successfully add to database " + i + " records!";
                    }

                    #region Clear Data
                    ms = null;
                    first = null;
                    mid = null;
                    last = null;
                    ako = null;
                    sch = null;
                    log = null;
                    phone = null;
                    lvl = 0;
                    #endregion
                }
            }
            else { lblResult.Text = "File does not exsist."; }
        }
        catch (Exception ex)
        {
            lblResult.Text = ex.Message;
        }
    }
}