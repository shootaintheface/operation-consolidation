using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class S1_FillClass : System.Web.UI.Page
{
    InSideLogIn cLog;
    private string className;
    private Guid classID;
    private List<Guid> classList = new List<Guid>();
    private List<Guid> tempList = new List<Guid>();
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
        if (!IsPostBack)
        {
            if (Session["List"] == null)
            {
                Session.Add("List", tempList);
            }
            else { Session.Remove("List"); Session.Add("List", tempList); }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
        Guid rage = new Guid(row.Cells[0].Text);
        classList.Add(rage);
        lblResult.Text = "You have Selected: " + row.Cells[2].Text;
        if (Session["List"] != null)
        {
            List<Guid> list = (List<Guid>)Session["List"];
            for (int i = 0; i < classList.Count; i++)
            {
                list.Add(classList[i]);
            }
            Session.Remove("List");
            Session.Add("List", list);
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        classID = new Guid(DropDownList1.SelectedValue);
        //select class name from class table and store it as name for class_instance.
        classList = (List<Guid>)Session["List"];
        for (int i = 0; i < classList.Count; i++)
        {
            lblResult.Text = "Button Pressed.";
            //store all values from the List in the database... for loop
            try
            {
                System.Data.SqlClient.SqlConnection conn = null;
                System.Data.SqlClient.SqlCommand updateCommand = null;
                try
                {
                    conn = new System.Data.SqlClient.SqlConnection(SqlDataSource1.ConnectionString.ToString());
                    conn.Open();
                    
                    updateCommand = new System.Data.SqlClient.SqlCommand("Insert Into CLASS_INSTANCE Values (@CDT, @CLS, @Date, @CNM)", conn);
                    updateCommand.Parameters.Add("CLS", System.Data.SqlDbType.UniqueIdentifier).Value = classID;
                    updateCommand.Parameters.Add("CDT", System.Data.SqlDbType.UniqueIdentifier).Value = classList[i];
                    updateCommand.Parameters.Add("Date", System.Data.SqlDbType.Date).Value = System.DateTime.Today;
                    updateCommand.Parameters.Add("CNM", System.Data.SqlDbType.VarChar).Value = DropDownList1.SelectedItem.Text;
                    int queryResult = updateCommand.ExecuteNonQuery();
                    if (queryResult == 1)
                        lblResult.Text = "Event Record Created Successfully! " + i;
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
        //make sure everything matches up, check for dselect...
    }
}