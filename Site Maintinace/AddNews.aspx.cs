using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.IO;
using System.Data;

public partial class Site_Maintinace_AddNews : System.Web.UI.Page
{
    Guid imgID;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblDate.Text = System.DateTime.Today.Date.ToString();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            System.Drawing.Image imag = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);
            System.Data.SqlClient.SqlConnection conn = null;
            System.Data.SqlClient.SqlCommand selectCommand = null;
            try
            {
                try
                {
                    conn = new System.Data.SqlClient.SqlConnection(SqlDataSource1.ConnectionString.ToString());
                    conn.Open();
                    System.Data.SqlClient.SqlCommand insertCommand = null;
                        
                insertCommand = new System.Data.SqlClient.SqlCommand(
                        "Insert into [STORY] (STY_ID, STY_CAPTION, STY_PIC, STY_TITLE, STY_ARTICLE, STY_DATE) VALUES (NEWID(), @cap, @Pic, @tit, @art, @date)",
                        conn);
                    insertCommand.Parameters.Add("cap", SqlDbType.VarChar).Value = txtCaption.Text;
                    insertCommand.Parameters.Add("Pic", SqlDbType.Image, 0).Value =
                    ConvertImageToByteArray(imag, System.Drawing.Imaging.ImageFormat.Jpeg);
                    insertCommand.Parameters.Add("tit", SqlDbType.VarChar).Value = txtTitle.Text;
                    insertCommand.Parameters.Add("art", SqlDbType.VarChar).Value = txtArticle.Text;
                    insertCommand.Parameters.Add("date", SqlDbType.VarChar).Value = System.DateTime.Today.Date;                     
                    
                    int queryResult = insertCommand.ExecuteNonQuery();
                    if (queryResult == 1)
                        lblResult.Text = "News Record Created Successfully";

                    selectCommand = new System.Data.SqlClient.SqlCommand("Select STY_ID From STORY Where STY_TITLE = @tit", conn);
                    selectCommand.Parameters.Add("tit", SqlDbType.VarChar).Value = txtTitle.Text;
                    imgID = new Guid(selectCommand.ExecuteScalar().ToString());
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
        
        imgPreview.ImageUrl = "~/ImageHandler.ashx?imgID="+ imgID;
    }

    private byte[] ConvertImageToByteArray(System.Drawing.Image imageToConvert,
                                       System.Drawing.Imaging.ImageFormat formatOfImage)
    {
        byte[] Ret;
        try
        {
            using (MemoryStream ms = new MemoryStream())
            {
                imageToConvert.Save(ms, formatOfImage);
                Ret = ms.ToArray();
            }
        }
        catch (Exception) { throw; }
        return Ret;
    }

}