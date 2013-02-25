using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class S1_AddPersonnel : System.Web.UI.Page
{
    public static int CADET_COUNTER;
    private int id;
    private string fName, lName, ako, email, loginID, mInitial,
        access, phone, msLevel, position, rank;
    InSideLogIn cLog;

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

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        ako = txtAKO.Text;
        fName = txtFName.Text;
        lName = txtLName.Text;
        loginID = txtLoginID.Text;
        mInitial = txtMInitial.Text;
        phone = txtPhone.Text;
        email = txtSchool.Text;
        access = txtAccessLevel.Text;
        rank = ddlRank.SelectedValue.ToString();
        position = txtPos.Text;
       
        msLevel = rdlMSLvl.SelectedValue.ToString();

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
                    if (rbCadet.Checked == true)
                    {
                        selectCommand = new System.Data.SqlClient.SqlCommand("SELECT COUNT(*) FROM CADET", conn);
                        CADET_COUNTER = (int)selectCommand.ExecuteScalar();
                        insertCommand = new System.Data.SqlClient.SqlCommand(
                            "Insert into [CADET] (CDT_ID, CDT_FNAME, CDT_LNAME, CDT_MINITIAL, CDT_PHONE, CDT_EMAIL, CDT_AKO," +
                            "CDT_LOGIN, CDT_PASS, CDT_MSLEVEL, CDT_AUTH, CDT_POS, CDT_RANK) VALUES (NEWID(), @fn, @ln, @mi, @p, @e, @a, @l, @pass, @m, @au, @pos, @rank)",conn);
                        insertCommand.Parameters.Add("fn",SqlDbType.VarChar).Value = fName;
                        insertCommand.Parameters.Add("ln", SqlDbType.VarChar).Value = lName;
                        insertCommand.Parameters.Add("mi", SqlDbType.VarChar).Value = mInitial;
                        insertCommand.Parameters.Add("p", SqlDbType.VarChar).Value =phone;
                        insertCommand.Parameters.Add("e", SqlDbType.VarChar).Value =email;
                        insertCommand.Parameters.Add("a", SqlDbType.VarChar).Value = ako;
                        insertCommand.Parameters.Add("l", SqlDbType.VarChar).Value = loginID;
                        insertCommand.Parameters.Add("m", SqlDbType.VarChar).Value = msLevel;
                        insertCommand.Parameters.Add("au", SqlDbType.VarChar).Value = access;
                        insertCommand.Parameters.Add("pass", SqlDbType.VarChar).Value = loginID;
                        insertCommand.Parameters.Add("pos", SqlDbType.VarChar).Value = position;
                        insertCommand.Parameters.Add("rank", SqlDbType.VarChar).Value = rank;

                    }
                    else
                    {
                        selectCommand = new System.Data.SqlClient.SqlCommand("SELECT COUNT(*) FROM CADRE", conn);
                        CADET_COUNTER = (int)selectCommand.ExecuteScalar();
                        insertCommand = new System.Data.SqlClient.SqlCommand(
                            "Insert into [CADRE] (CDR_ID, CDR_FNAME, CDR_LNAME, CDR_MINITIAL, CDR_PNUMBER, CDR_EMAIL, CDR_AKO," +
                            "CDR_LOGIN, CDR_PASS, CDR_AUTH) VALUES (NEWID(), @fn, @ln, @mi, @p, @e, @a, @l, @p, @au)", conn);
                        //insertCommand.Parameters.Add("id", SqlDbType.Int).Value = CADET_COUNTER + 1;
                        insertCommand.Parameters.Add("fn", SqlDbType.VarChar).Value = fName;
                        insertCommand.Parameters.Add("ln", SqlDbType.VarChar).Value = lName;
                        insertCommand.Parameters.Add("mi", SqlDbType.VarChar).Value = mInitial;
                        insertCommand.Parameters.Add("p", SqlDbType.VarChar).Value = phone;
                        insertCommand.Parameters.Add("e", SqlDbType.VarChar).Value = email;
                        insertCommand.Parameters.Add("a", SqlDbType.VarChar).Value = ako;
                        insertCommand.Parameters.Add("l", SqlDbType.VarChar).Value = loginID;
                        insertCommand.Parameters.Add("au", SqlDbType.VarChar).Value = access;
                    }
                    int queryResult = insertCommand.ExecuteNonQuery();
                    if (queryResult == 1)
                    {
                        lblResult.Text = "Personnel Record Created Successfully for: " + lName;
                        txtAKO.Text = "";
                        txtFName.Text = "";
                        txtLName.Text = "";
                        txtLoginID.Text = "";
                        txtMInitial.Text = "";
                        txtPhone.Text = "";
                        txtSchool.Text = "";
                        txtAccessLevel.Text = "";
                        txtPos.Text = "";

                        ako = null;
                        fName = null;
                        lName = null;
                        loginID = null;
                        mInitial = null;
                        phone = null;
                        email = null;
                        access = null;
                        msLevel = null;
                        rank = null;
                        position = null;
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