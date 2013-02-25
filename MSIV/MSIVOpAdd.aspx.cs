using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MSIV_MSIVOpAdd : System.Web.UI.Page
{
    InSideLogIn log;
    FileManagerSystem fSys;

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


    protected void btnEdit_Click(object sender, EventArgs e)
    {
        string opID = DropDownList1.SelectedValue.ToString();
        Session.Add("op", opID);
        Response.Redirect("~/MSIV/MSIVNewFile.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        fSys = new FileManagerSystem();
        GridViewRow row = GridView1.SelectedRow;
        Guid ID = new Guid(row.Cells[3].Text);
        lblResult.Text = "You have selected: " + row.Cells[1].Text;

        Session.Remove("fid");
        Session.Add("fid", ID);
    }

    private void download(Byte[] content, string name, string type)
    {
        Byte[] rage = content;
        Response.Buffer = true;
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = ReturnExtension(type);
        Response.AddHeader("content-disposition", "attachment;filename=" + name);
        Response.BinaryWrite(rage);
        Response.Flush();
        Response.End();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Guid id = (Guid)Session["fid"];
        fSys = new FileManagerSystem();
        string name, type;
        try
        {
            System.Data.SqlClient.SqlConnection conn = null;
            System.Data.SqlClient.SqlCommand selectCommand = null;
            try
            {
                conn = new System.Data.SqlClient.SqlConnection(SqlDataSource1.ConnectionString.ToString());
                conn.Open();
                selectCommand = new System.Data.SqlClient.SqlCommand("Select BLOB_NAME From OP_BLOB Where BLOB_ID = @ID", conn);
                selectCommand.Parameters.Add("ID", SqlDbType.UniqueIdentifier).Value = id.ToString();
                name = (string)selectCommand.ExecuteScalar();

                selectCommand = new System.Data.SqlClient.SqlCommand("Select BLOB_TYPE From OP_BLOB Where BLOB_ID = @ID", conn);
                selectCommand.Parameters.Add("ID", SqlDbType.UniqueIdentifier).Value = id.ToString();
                type = (string)selectCommand.ExecuteScalar();

                selectCommand = new System.Data.SqlClient.SqlCommand("Select BLOB_CONTENT From OP_BLOB Where BLOB_ID = @ID", conn);
                selectCommand.Parameters.Add("ID", SqlDbType.UniqueIdentifier).Value = id.ToString();
                Byte[] content = (Byte[])selectCommand.ExecuteScalar();

                if (content != null)
                {
                    download(content, name, type);
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
    }

    private string ReturnExtension(string fileExtension)
    {
        switch (fileExtension)
        {
            case ".htm":
            case ".html":
            case ".log":
                return "text/HTML";
            case ".txt":
                return "text/plain";
            case ".doc":
                return "application/ms-word";
            case ".tiff":
            case ".tif":
                return "image/tiff";
            case ".asf":
                return "video/x-ms-asf";
            case ".avi":
                return "video/avi";
            case ".zip":
                return "application/zip";
            case ".xls":
            case ".csv":
                return "application/vnd.ms-excel";
            case ".gif":
                return "image/gif";
            case ".jpg":
            case "jpeg":
                return "image/jpeg";
            case ".bmp":
                return "image/bmp";
            case ".wav":
                return "audio/wav";
            case ".mp3":
                return "audio/mpeg3";
            case ".mpg":
            case "mpeg":
                return "video/mpeg";
            case ".rtf":
                return "application/rtf";
            case ".asp":
                return "text/asp";
            case ".pdf":
                return "application/pdf";
            case ".fdf":
                return "application/vnd.fdf";
            case ".ppt":
                return "application/mspowerpoint";
            case ".dwg":
                return "image/vnd.dwg";
            case ".msg":
                return "application/msoutlook";
            case ".xml":
            case ".sdxl":
                return "application/xml";
            case ".xdp":
                return "application/vnd.adobe.xdp+xml";
            default:
                return "application/octet-stream";
        }
    }

    protected void btnPublish_Click(object sender, EventArgs e)
    {
        Guid sopID = new Guid(DropDownList1.SelectedValue.ToString());
        char publish;
        
        try
        {
            System.Data.SqlClient.SqlConnection conn = null;
            System.Data.SqlClient.SqlCommand selectCommand = null;
            try
            {
                conn = new System.Data.SqlClient.SqlConnection(SqlDataSource1.ConnectionString.ToString());
                conn.Open();
                selectCommand = new System.Data.SqlClient.SqlCommand("Select OP_PUBLISH from OPORD Where OP_ID = @ID", conn);
                selectCommand.Parameters.Add("ID", SqlDbType.UniqueIdentifier).Value = sopID;
                char pub = Convert.ToChar(selectCommand.ExecuteScalar());

                if (pub == 'n') { publish = 'y'; }
                else publish = 'n';

                selectCommand = new System.Data.SqlClient.SqlCommand("Update OPORD Set OP_PUBLISH = @pub Where OP_ID = @ID", conn);
                selectCommand.Parameters.Add("pub", SqlDbType.Char).Value = publish;
                selectCommand.Parameters.Add("ID", SqlDbType.UniqueIdentifier).Value = sopID;
                int queryResult = selectCommand.ExecuteNonQuery();
                if (queryResult == 1)
                    lblResult.Text = "OPORD Updated";

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
    }

    protected void  Button2_Click(object sender, EventArgs e)
    {
        RunButtonNameChange();
    }

    public void RunButtonNameChange()
    {
        Guid sopID = new Guid(DropDownList1.SelectedValue.ToString());

        try
        {
            System.Data.SqlClient.SqlConnection conn = null;
            System.Data.SqlClient.SqlCommand selectCommand = null;
            try
            {
                conn = new System.Data.SqlClient.SqlConnection(SqlDataSource1.ConnectionString.ToString());
                conn.Open();
                selectCommand = new System.Data.SqlClient.SqlCommand("Select OP_PUBLISH from OPORD Where OP_ID = @ID", conn);
                selectCommand.Parameters.Add("ID", SqlDbType.UniqueIdentifier).Value = sopID;
                char pub = Convert.ToChar(selectCommand.ExecuteScalar());

                if (pub == 'n')
                {
                    btnPublish.Text = "Publish";
                }
                else { btnPublish.Text = "Unpublish"; }

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
    }


    protected void Button4_Click(object sender, EventArgs e)
    {
        Guid fileID = (Guid)Session["fid"];
        try
        {
            System.Data.SqlClient.SqlConnection conn = null;
            System.Data.SqlClient.SqlCommand selectCommand = null;
            try
            {
                conn = new System.Data.SqlClient.SqlConnection(SqlDataSource1.ConnectionString.ToString());
                conn.Open();
                
                selectCommand = new System.Data.SqlClient.SqlCommand("Delete From OP_BLOB where BLOB_ID = @ID", conn);
                selectCommand.Parameters.Add("ID", SqlDbType.UniqueIdentifier).Value = fileID;
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
    }
}
