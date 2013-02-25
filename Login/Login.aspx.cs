using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    private string loginID, loginPass, dbPass, name, tT, id;
    private int accessLevel;
    private bool loggedIN;
    InSideLogIn cLog;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        loginID = txtLogin.Text;
        loginPass = txtPassword.Text;
        loggedIN = false;

        if (chkCadet.Checked == false && !chkCadre.Checked)
        {
            lblError.Text = "Please select either cadre or cadet.";
        }

        #region Database Stuff
        try
        {
            System.Data.SqlClient.SqlConnection conn = null;
            System.Data.SqlClient.SqlCommand selectCommand = null;
            try
            {
                try 
                {
                    conn = new System.Data.SqlClient.SqlConnection(sqlLoginDB.ConnectionString.ToString());
                    conn.Open();

                    if (loginID == "" || loginPass == "")
                    {
                        lblError.Text = "You must enter a Login ID and Password.";
                    }
                    else if (chkCadet.Checked == false && chkCadre.Checked == false)
                    {
                        lblError.Text = "You must check either cadet or cadre depending on who you are.";
                    }
                    else
                    {
                        if (chkCadet.Checked == true)
                        {
                            tT = "cadet";
                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDT_LNAME From CADET Where CDT_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            name = (string)selectCommand.ExecuteScalar();

                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDT_PASS From CADET Where CDT_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            dbPass = (string)selectCommand.ExecuteScalar();

                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDT_AUTH From CADET Where CDT_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            accessLevel = Convert.ToInt32(selectCommand.ExecuteScalar());

                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDT_ID From CADET Where CDT_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            id = selectCommand.ExecuteScalar().ToString();

                            if (name != null && loginPass == dbPass)
                            {
                                loggedIN = true;
                                lblError.Text = name + " is now logged in!";

                                cLog = new InSideLogIn(loginID, loginPass, accessLevel, name, id, tT);
                            }
                        }
                        else if (chkCadre.Checked == true)
                        {
                            tT = "cadre";
                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDR_LNAME From CADRE Where CDR_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            name = (string)selectCommand.ExecuteScalar();

                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDR_PASS From CADRE Where CDR_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            dbPass = (string)selectCommand.ExecuteScalar();

                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDR_AUTH From CADRE Where CDR_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            accessLevel = (int)selectCommand.ExecuteScalar();

                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDR_ID From CADET Where CDT_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            id = selectCommand.ExecuteScalar().ToString();

                            if (name != null && loginPass == dbPass)
                            {
                                loggedIN = true;
                                lblError.Text = name + " is now logged in!";

                                cLog = new InSideLogIn(loginID, loginPass, accessLevel, name, id, tT);
                            }
                        }
                    }
                   
                }
                catch (Exception ex)
                {
                    lblError.Text = "Error: " + ex.Message;
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
            lblError.Text = "Error: " + ex.Message;
        }
        #endregion

        if (loggedIN == true)
        {
            if (Session["logIN"] != null)
            {
                Session.Remove("logIN");
            }
            if (Session["id"] != null) { Session.Remove("id"); }

            Session.Add("id", id);
            Session.Add("logIN", cLog);
            Response.Redirect("~/Login/BackDoor.aspx");
        }
    }
        
}