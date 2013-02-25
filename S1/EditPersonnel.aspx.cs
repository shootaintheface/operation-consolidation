using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class S1_EditPersonnel : System.Web.UI.Page
{
    private int count;
    private string fName, lName, street, city, state, ako, email, pass1, mInitial,
        pass2, zip, phone, loginID, tT, pos, rank, msLvl;
    InSideLogIn cLog;
    Person man;
    Guid id;
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
        if (Session["pMan"] != null)
        {
            man = (Person)Session["pMan"];
            txtFName.Text = man.FName;
            txtLName.Text = man.LName;
            txtPhone.Text = man.Phone;
            txtMInitial.Text = man.MI;
            txtSchool.Text = man.Email;
            txtAKO.Text = man.Ako;
            fName = man.FName;
            lName = man.LName;
            mInitial = man.MI;
            phone = man.Phone;
            email = man.Email;
            ako = man.Ako;
        }

        #region preliminary assignments
        street = "";
        city = "";
        state = "";
        zip = "";
        #endregion

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

                    #region Select Statements

                    selectCommand = new System.Data.SqlClient.SqlCommand("SELECT Count(*) From CADET Where CDT_FNAME = @login AND CDT_LNAME = @lname", conn);
                    selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = fName;
                    selectCommand.Parameters.Add("lname", System.Data.SqlDbType.VarChar).Value = lName;
                    count = (int)selectCommand.ExecuteScalar();

                    if (count > 0)
                    {
                        tT = "cadet";
                        selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDT_ID From CADET Where CDT_FNAME = @login AND CDT_LNAME = @lname", conn);
                        selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = fName;
                        selectCommand.Parameters.Add("lname", System.Data.SqlDbType.VarChar).Value = lName;
                        id = (Guid)selectCommand.ExecuteScalar();
                        

                        selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDT_LOGIN From CADET Where CDT_FNAME = @login AND CDT_LNAME = @lname", conn);
                        selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = fName;
                        selectCommand.Parameters.Add("lname", System.Data.SqlDbType.VarChar).Value = lName;
                        loginID = CheckIsNull(selectCommand.ExecuteScalar());

                        selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDT_STREET From CADET Where CDT_FNAME = @login AND CDT_LNAME = @lname", conn);
                        selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = fName;
                        selectCommand.Parameters.Add("lname", System.Data.SqlDbType.VarChar).Value = lName;
                        street = CheckIsNull(selectCommand.ExecuteScalar());

                        selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDT_CITY From CADET Where CDT_FNAME = @login AND CDT_LNAME = @lname", conn);
                        selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = fName;
                        selectCommand.Parameters.Add("lname", System.Data.SqlDbType.VarChar).Value = lName;
                        city = CheckIsNull(selectCommand.ExecuteScalar());

                        selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDT_STATE From CADET Where CDT_FNAME = @login AND CDT_LNAME = @lname", conn);
                        selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = fName;
                        selectCommand.Parameters.Add("lname", System.Data.SqlDbType.VarChar).Value = lName;
                        state = CheckIsNull(selectCommand.ExecuteScalar());
                         
                        selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDT_ZIP From CADET Where CDT_FNAME = @login AND CDT_LNAME = @lname", conn);
                        selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = fName;
                        selectCommand.Parameters.Add("lname", System.Data.SqlDbType.VarChar).Value = lName;
                        zip = CheckIsNull(selectCommand.ExecuteScalar());
                    }
                    else
                    {
                        tT = "cadre";
                        selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDR_ID From CADRE Where CDR_FNAME = @login AND CDR_LNAME = @lname", conn);
                        selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = fName;
                        selectCommand.Parameters.Add("lname", System.Data.SqlDbType.VarChar).Value = lName;
                        id = (Guid)selectCommand.ExecuteScalar();

                        selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDR_LOGIN From CADRE Where CDR_FNAME = @login AND CDR_LNAME = @lname", conn);
                        selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = fName;
                        selectCommand.Parameters.Add("lname", System.Data.SqlDbType.VarChar).Value = lName;
                        loginID = CheckIsNull(selectCommand.ExecuteScalar());

                        selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDR_STREET From CADRE Where CDR_FNAME = @login AND CDR_LNAME = @lname", conn);
                        selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = fName;
                        selectCommand.Parameters.Add("lname", System.Data.SqlDbType.VarChar).Value = lName;
                        street = CheckIsNull(selectCommand.ExecuteScalar());

                        selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDR_CITY From CADRE Where CDR_FNAME = @login AND CDR_LNAME = @lname", conn);
                        selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = fName;
                        selectCommand.Parameters.Add("lname", System.Data.SqlDbType.VarChar).Value = lName;
                        city = CheckIsNull(selectCommand.ExecuteScalar());

                        selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDR_STATE From CADRE Where CDR_FNAME = @login AND CDR_LNAME = @lname", conn);
                        selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = fName;
                        selectCommand.Parameters.Add("lname", System.Data.SqlDbType.VarChar).Value = lName;
                        state = CheckIsNull(selectCommand.ExecuteScalar());

                        selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDR_ZIP From CADRE Where CDR_FNAME = @login AND CDR_LNAME = @lname", conn);
                        selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = fName;
                        selectCommand.Parameters.Add("lname", System.Data.SqlDbType.VarChar).Value = lName;
                        zip = CheckIsNull(selectCommand.ExecuteScalar());                  
                    }
                    #endregion
                    #region Assignment

                    txtAKO.Text = ako;
                    txtCity.Text = city;
                    txtFName.Text = fName;
                    txtLName.Text = lName;
                    txtLoginID.Text = loginID;
                    txtMInitial.Text = Convert.ToString(mInitial);
                    txtPhone.Text = Convert.ToString(phone);
                    txtState.Text = state;
                    txtStreet.Text = street;
                    txtZip.Text = Convert.ToString(zip);
                    txtSchool.Text = email;

                    #endregion

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
        catch (Exception ex)
        {
            lblResult.Text = "Error: " + ex.Message;
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        ako = txtAKO.Text;
        city = txtCity.Text;
        fName = txtFName.Text;
        lName = txtLName.Text;
        loginID = txtLoginID.Text;
        mInitial = txtMInitial.Text;
        phone = txtPhone.Text;
        state = txtState.Text;
        street = txtStreet.Text;
        zip = txtZip.Text;
        email = txtSchool.Text;
        pass1 = txtPass1.Text;
        pass2 = txtPass2.Text;
        rank = ddlRank.SelectedValue.ToString();
        pos = txtPos.Text;
        msLvl = RadioButtonList1.SelectedValue.ToString();

        if (pass1 == null || pass2 == null)
        {
            pass1 = cLog.Password;
            pass2 = cLog.Password;
        }
        else
        {
            pass1 = txtPass1.Text;
            pass2 = txtPass2.Text;
        }


        if (pass1 == pass2)
        {
            try
            {
                System.Data.SqlClient.SqlConnection conn = null;
                System.Data.SqlClient.SqlCommand updateCommand = null;
                try
                {
                    conn = new System.Data.SqlClient.SqlConnection(SqlDataSource1.ConnectionString.ToString());
                    conn.Open();
                    if (tT == "cadet")
                    {
                        updateCommand = new System.Data.SqlClient.SqlCommand("Update CADET Set CDT_FNAME = @Fname, CDT_LNAME = @Lname, " +
                                                                             "CDT_AKO = @ako, CDT_CITY = @city, CDT_LOGIN = @login, CDT_MINITIAL = @m, " +
                                                                             "CDT_PHONE = @phone, CDT_STATE = @state, CDT_STREET = @street, CDT_ZIP = @z, " +
                                                                             "CDT_EMAIL = @email, CDT_PASS = @pass, CDT_RANK = @rank, CDT_MSLVL = @ms, CDT_POS = @pos Where CDT_ID = @id", conn);
                        updateCommand.Parameters.Add("Fname", System.Data.SqlDbType.VarChar).Value = fName;
                        updateCommand.Parameters.Add("Lname", System.Data.SqlDbType.VarChar).Value = lName;
                        updateCommand.Parameters.Add("ako", System.Data.SqlDbType.VarChar).Value = ako;
                        updateCommand.Parameters.Add("city", System.Data.SqlDbType.VarChar).Value = city;
                        updateCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                        updateCommand.Parameters.Add("m", System.Data.SqlDbType.VarChar).Value = mInitial;
                        updateCommand.Parameters.Add("phone", System.Data.SqlDbType.VarChar).Value = phone;
                        updateCommand.Parameters.Add("state", System.Data.SqlDbType.VarChar).Value = state;
                        updateCommand.Parameters.Add("street", System.Data.SqlDbType.VarChar).Value = street;
                        updateCommand.Parameters.Add("z", System.Data.SqlDbType.VarChar).Value = zip;
                        updateCommand.Parameters.Add("email", System.Data.SqlDbType.VarChar).Value = email;
                        updateCommand.Parameters.Add("pass", System.Data.SqlDbType.VarChar).Value = pass1;
                        updateCommand.Parameters.Add("rank", System.Data.SqlDbType.VarChar).Value = rank;
                        updateCommand.Parameters.Add("ms", System.Data.SqlDbType.VarChar).Value = msLvl;
                        updateCommand.Parameters.Add("pos", System.Data.SqlDbType.VarChar).Value = pos;
                        updateCommand.Parameters.Add("id", System.Data.SqlDbType.Int).Value = Convert.ToString(cLog.IdNumber);
                        int queryResult = updateCommand.ExecuteNonQuery();
                        if (queryResult == 1)
                            lblResult.Text = "Event Record Created Successfully!";
                    }
                    else if (tT == "cadre")
                    {
                        updateCommand = new System.Data.SqlClient.SqlCommand("Update CADRE Set CDR_FNAME = @Fname, CDR_LNAME = @Lname, " +
                                                                            "CDR_AKO = @ako, CDR_CITY = @city, CDR_LOGIN = @login, CDR_MINITIAL = @m, " +
                                                                            "CDR_PNUMBER = @phone, CDR_STATE = @state, CDR_STREET = @street, CDR_ZIP = @z, " +
                                                                            "CDR_EMAIL = @email, CDR_PASS = @pass Where CDR_ID = @id", conn);
                        updateCommand.Parameters.Add("Fname", System.Data.SqlDbType.VarChar).Value = fName;
                        updateCommand.Parameters.Add("Lname", System.Data.SqlDbType.VarChar).Value = lName;
                        updateCommand.Parameters.Add("ako", System.Data.SqlDbType.VarChar).Value = ako;
                        updateCommand.Parameters.Add("city", System.Data.SqlDbType.VarChar).Value = city;
                        updateCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                        updateCommand.Parameters.Add("m", System.Data.SqlDbType.VarChar).Value = mInitial;
                        updateCommand.Parameters.Add("phone", System.Data.SqlDbType.NChar).Value = phone;
                        updateCommand.Parameters.Add("state", System.Data.SqlDbType.VarChar).Value = state;
                        updateCommand.Parameters.Add("street", System.Data.SqlDbType.VarChar).Value = street;
                        updateCommand.Parameters.Add("z", System.Data.SqlDbType.VarChar).Value = zip;
                        updateCommand.Parameters.Add("email", System.Data.SqlDbType.VarChar).Value = email;
                        updateCommand.Parameters.Add("pass", System.Data.SqlDbType.VarChar).Value = pass1;
                        updateCommand.Parameters.Add("id", System.Data.SqlDbType.UniqueIdentifier).Value = cLog.IdNumber;
                        int queryResult = updateCommand.ExecuteNonQuery();
                        if (queryResult == 1)
                            lblResult.Text = "Event Record Created Successfully!";
                    }
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
        else
        {
            lblResult.Text = "Error: Passwords do not match.";
        }
    }

    protected string CheckIsNull(object obj)
    {
        if (obj != DBNull.Value)
        {
            return (string)obj;
        }
        else { return ""; }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Button2.Text == "Delete")
        {
            Button2.Text = "Are you Sure";
        }
        else if (Button2.Text == "Are you Sure")
        {
            try
            {
                System.Data.SqlClient.SqlConnection conn = null;
                System.Data.SqlClient.SqlCommand updateCommand = null;

                conn = new System.Data.SqlClient.SqlConnection(SqlDataSource1.ConnectionString.ToString());
                conn.Open();
                if (tT == "cadet")
                {
                    updateCommand = new System.Data.SqlClient.SqlCommand("Delete From CADET Where CDT_ID = @id", conn);
                    updateCommand.Parameters.Add("id", System.Data.SqlDbType.UniqueIdentifier).Value = id;
                    int queryResult = updateCommand.ExecuteNonQuery();
                    if (queryResult == 1)
                        lblResult.Text = "Cadet Deleted";
                }
                else if (tT == "cadre")
                {
                    updateCommand = new System.Data.SqlClient.SqlCommand("Delete From CADR Where CDR_ID = @id", conn);
                    updateCommand.Parameters.Add("id", System.Data.SqlDbType.UniqueIdentifier).Value = id;
                    int queryResult = updateCommand.ExecuteNonQuery();
                    if (queryResult == 1)
                        lblResult.Text = "Cadre Deleted";
                }
            }
            catch (Exception ex)
            {
                lblResult.Text = "Error: Check to see if they are enrolled in a class or have an OPORD tied to them, Delete those first.";
            }
        }
    }
}