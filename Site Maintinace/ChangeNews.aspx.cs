using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.IO;

public partial class ChangeNews : System.Web.UI.Page
{
    private NewsClass nClass;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            ddlNews.DataBind();
    }

    private NewsClass GetSelectedNews()
    {
        DataView newsTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        newsTable.RowFilter = "STY_ID = '" + ddlNews.SelectedValue + "'";
        DataRowView row = (DataRowView)newsTable[0];

        NewsClass n = new NewsClass();
        n.ID = row["STY_ID"].ToString();
        n.Article = row["STY_ARTICLE"].ToString();
        n.NewsLabe = row["STY_CAPTION"].ToString();
        return n;
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

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            System.Drawing.Image imag;
            System.Data.SqlClient.SqlConnection conn = null;
            System.Data.SqlClient.SqlCommand selectCommand = null;
            try
            {
                try
                {
                    conn = new System.Data.SqlClient.SqlConnection(SqlDataSource1.ConnectionString.ToString());
                    conn.Open();
                    System.Data.SqlClient.SqlCommand insertCommand = null;

                    
                    
                        imag = System.Drawing.Image.FromStream(fuImage.PostedFile.InputStream);
                    
                    

                    insertCommand = new System.Data.SqlClient.SqlCommand(
                        "Insert into [STORY] (STY_CAPTION, STY_PIC, STY_TITLE, STY_ARTICLE) Values (@Desc, @Pic, @Title) Where STY_ID = @id", conn);
                    insertCommand.Parameters.Add("Desc", SqlDbType.VarChar).Value = txtCaption.Text;
                    insertCommand.Parameters.Add("Pic", SqlDbType.Image, 0).Value =
                    ConvertImageToByteArray(imag, System.Drawing.Imaging.ImageFormat.Jpeg);

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

    protected void Button1_Click(object sender, EventArgs e)
    {
        nClass = this.GetSelectedNews();
        txtCaption.Text = nClass.NewsLabe;
        txtArticle.Text = nClass.Article;
        picNewsSource.ImageUrl = "~/ImageHandler.ashx?imgID=" + ddlNews.SelectedValue;
    }
}