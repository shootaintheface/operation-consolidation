using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainFront : System.Web.UI.Page
{
    NewsClass news;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            System.Data.SqlClient.SqlConnection conn = null;
            System.Data.SqlClient.SqlCommand selectCommand = null;
            try
            {
                try
                {
                    string eName, eContent, picDesc;
                    try
                    {
                        conn = new System.Data.SqlClient.SqlConnection(sqlNewsArticleDS.ConnectionString.ToString());
                        conn.Open();

                        selectCommand = new System.Data.SqlClient.SqlCommand("Select STY_ID From STORY Where STY_DATE "+
                                    "= (Select MAX(STY_DATE) From STORY)", conn);
                        Guid styID = new Guid(selectCommand.ExecuteScalar().ToString());

                        selectCommand = new System.Data.SqlClient.SqlCommand("Select STY_TITLE From STORY Where STY_ID = @id", conn);
                        selectCommand.Parameters.Add("id", System.Data.SqlDbType.UniqueIdentifier).Value = styID;
                        eName = (string)selectCommand.ExecuteScalar();

                        selectCommand = new System.Data.SqlClient.SqlCommand("Select STY_ARTICLE From STORY Where STY_ID = @id", conn);
                        selectCommand.Parameters.Add("id", System.Data.SqlDbType.UniqueIdentifier).Value = styID;
                        eContent = (string)selectCommand.ExecuteScalar();

                        selectCommand = new System.Data.SqlClient.SqlCommand("Select STY_CAPTION From STORY Where STY_ID = @id", conn);
                        selectCommand.Parameters.Add("id", System.Data.SqlDbType.UniqueIdentifier).Value = styID;
                        picDesc = (string)selectCommand.ExecuteScalar();

                        picNewsPic.ImageUrl = "~/ImageHandler.ashx?imgID=" + styID;
                        lblArticleTitle.Text = eName;
                        lblPicDiscription.Text = picDesc;
                        lblArticle.Text = eContent;
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