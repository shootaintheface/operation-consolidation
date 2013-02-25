using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
public partial class Calendar : System.Web.UI.Page
{
    InSideLogIn log;
    Guid id;
    protected void Page_Load(object sender, EventArgs e)
    {
        log = (InSideLogIn)Session["logIN"];
        if (Session["logIN"] == null)
        {
            Response.Redirect("~/Login/Login.aspx");
        }
        id = new Guid(Session["id"].ToString());
    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        //use data reader to fill the calendar.
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
                    selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CLASS_CALENDAR.CCE_DATE, CLASS_CALENDAR.CCE_CONTENT FROM CLASS_INSTANCE INNER JOIN CLASS_CALENDAR ON CLASS_INSTANCE.CLS_ID = CLASS_CALENDAR.CLS_ID WHERE (CLASS_INSTANCE.CDT_ID = @CDT)", conn);
                    selectCommand.Parameters.Add("CDT",SqlDbType.UniqueIdentifier).Value = id;
                    IDataReader dr = selectCommand.ExecuteReader();

                    while (dr.Read())
                    {
                        DateTime date = (DateTime)dr[0];
                        string content = dr[1].ToString();

                        if (e.Day.Date.ToShortDateString() == date.ToShortDateString())
                        {
                            e.Cell.BackColor = Color.Firebrick;
                        }
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