<%@ WebHandler Language="C#" Class="ImageHandler" %>

using System;
using System.Web;
using System.Data;

public class ImageHandler : IHttpHandler 
{
    
    public void ProcessRequest (HttpContext context) 
    {
        System.Data.SqlClient.SqlDataReader reader = null;
        System.Data.SqlClient.SqlConnection conn = null;
        System.Data.SqlClient.SqlCommand selcmd = null;
        try
        {
            conn = new System.Data.SqlClient.SqlConnection
          (System.Configuration.ConfigurationManager.ConnectionStrings
          ["ConnectionStringMain"].ConnectionString);
            selcmd = new System.Data.SqlClient.SqlCommand
          ("select STY_PIC from STORY where STY_ID = @id", conn);
            selcmd.Parameters.Add("id", SqlDbType.UniqueIdentifier).Value = new Guid(context.Request.QueryString["imgID"]);
            conn.Open();
            try
            {
                reader = selcmd.ExecuteReader();
                while (reader.Read())
                {
                    context.Response.ContentType = "image/jpg";
                    context.Response.BinaryWrite((byte[])reader["STY_PIC"]);
                }
                if (reader != null)
                    reader.Close();
            }
            catch (Exception ex)
            {
                Console.Write("Error: " + ex.ToString());
            }
        }
        finally
        {
            if (conn != null)
                conn.Close();
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}