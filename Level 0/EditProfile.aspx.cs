﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditProfile : System.Web.UI.Page
{
    private int id;
    private string fName, lName, street, city, state, ako, email, loginID, pass1, mInitial, 
        pass2, access, zip, phone, tT;
    private DateTime gradDate;
    private InSideLogIn cLog;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                cLog = (InSideLogIn)Session["logIN"];
                lName = cLog.LastName;
                loginID = cLog.LoginID;
                access = cLog.PrintAccessLevel();
            }
            catch { Response.Redirect("~/Login/Login.aspx"); }

            try
            {
                System.Data.SqlClient.SqlConnection conn = null;
                System.Data.SqlClient.SqlCommand selectCommand = null;
                try
                {
                    try
                    {
                        conn = new System.Data.SqlClient.SqlConnection(sqlProfile.ConnectionString.ToString());
                        conn.Open();

                        #region Select Statements
                        if (cLog.TableType == "cadet")
                        {
                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDT_FNAME From CADET Where CDT_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            fName = (string)selectCommand.ExecuteScalar();

                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDT_MINITIAL From CADET Where CDT_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            mInitial = (string)selectCommand.ExecuteScalar();

                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDT_STREET From CADET Where CDT_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            street = (string)selectCommand.ExecuteScalar();

                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDT_CITY From CADET Where CDT_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            city = (string)selectCommand.ExecuteScalar();

                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDT_STATE From CADET Where CDT_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            state = (string)selectCommand.ExecuteScalar();

                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDT_ZIP From CADET Where CDT_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            zip = (string)selectCommand.ExecuteScalar();

                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDT_PHONE From CADET Where CDT_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            phone = (string)selectCommand.ExecuteScalar();

                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDT_AKO From CADET Where CDT_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            ako = (string)selectCommand.ExecuteScalar();

                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDT_EMAIL From CADET Where CDT_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            email = (string)selectCommand.ExecuteScalar();
                        }
                        else if (cLog.TableType == "cadre")
                        {
                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDR_FNAME From CADRE Where CDR_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            fName = (string)selectCommand.ExecuteScalar();

                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDR_MINITIAL From CADRE Where CDR_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            mInitial = (string)selectCommand.ExecuteScalar();

                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDR_STREET From CADRE Where CDR_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            street = (string)selectCommand.ExecuteScalar();

                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDR_CITY From CADRE Where CDR_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            city = (string)selectCommand.ExecuteScalar();

                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDR_STATE From CADRE Where CDR_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            state = (string)selectCommand.ExecuteScalar();

                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDR_ZIP From CADRE Where CDR_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            zip = (string)selectCommand.ExecuteScalar();

                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDR_PHONE From CADRE Where CDR_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            phone = (string)selectCommand.ExecuteScalar();

                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDR_AKO From CADRE Where CDR_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            ako = (string)selectCommand.ExecuteScalar();

                            selectCommand = new System.Data.SqlClient.SqlCommand("SELECT CDR_EMAIL From CADRE Where CDR_LOGIN = @login", conn);
                            selectCommand.Parameters.Add("login", System.Data.SqlDbType.VarChar).Value = loginID;
                            email = (string)selectCommand.ExecuteScalar();
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
                        lblAccessLevel.Text = access;
                        lblLastName.Text = lName;

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
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            cLog = (InSideLogIn)Session["logIN"];
            lName = cLog.LastName;
            loginID = cLog.LoginID;
            access = cLog.PrintAccessLevel();
        }
        catch { Response.Redirect("~/Login/Login.aspx"); }

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
                    conn = new System.Data.SqlClient.SqlConnection(sqlProfile.ConnectionString.ToString());
                    conn.Open();
                    if (cLog.TableType == "cadet")
                    {
                        tT = "cadet";
                        updateCommand = new System.Data.SqlClient.SqlCommand("Update CADET Set CDT_FNAME = @Fname, CDT_LNAME = @Lname, " +
                                                                             "CDT_AKO = @ako, CDT_CITY = @city, CDT_LOGIN = @login, CDT_MINITIAL = @m, " +
                                                                             "CDT_PHONE = @phone, CDT_STATE = @state, CDT_STREET = @street, CDT_ZIP = @z, " +
                                                                             "CDT_EMAIL = @email, CDT_PASS = @pass Where CDT_ID = @id", conn);
                        updateCommand.Parameters.Add("Fname",System.Data.SqlDbType.VarChar).Value = fName;
                        updateCommand.Parameters.Add("Lname",System.Data.SqlDbType.VarChar).Value = lName;
                        updateCommand.Parameters.Add("ako",System.Data.SqlDbType.VarChar).Value = ako;
                        updateCommand.Parameters.Add("city",System.Data.SqlDbType.VarChar).Value = city;
                        updateCommand.Parameters.Add("login",System.Data.SqlDbType.VarChar).Value = loginID;
                        updateCommand.Parameters.Add("m",System.Data.SqlDbType.VarChar).Value = mInitial;
                        updateCommand.Parameters.Add("phone",System.Data.SqlDbType.VarChar).Value = phone;
                        updateCommand.Parameters.Add("state",System.Data.SqlDbType.VarChar).Value = state;
                        updateCommand.Parameters.Add("street",System.Data.SqlDbType.VarChar).Value = street;
                        updateCommand.Parameters.Add("z",System.Data.SqlDbType.VarChar).Value = zip;
                        updateCommand.Parameters.Add("email",System.Data.SqlDbType.VarChar).Value = email;
                        updateCommand.Parameters.Add("pass", System.Data.SqlDbType.VarChar).Value = pass1;
                        updateCommand.Parameters.Add("id", System.Data.SqlDbType.Int).Value = Convert.ToString(cLog.IdNumber);
                        int queryResult = updateCommand.ExecuteNonQuery();
                        if (queryResult == 1)
                            lblResult.Text = "Event Record Created Successfully!";
                    }
                    else if (cLog.TableType == "cadre")
                    {
                        tT = "cadre";
                        updateCommand = new System.Data.SqlClient.SqlCommand("Update CADRE Set CDR_FNAME = @Fname, CDR_LNAME = @Lname, " +
                                                                            "CDR_AKO = @ako, CDR_CITY = @city, CDR_LOGIN = @login, CDR_MINITIAL = @m, " +
                                                                            "CDR_PHONE = @phone, CDR_STATE = @state, CDR_STREET = @street, CDR_ZIP = @z, " +
                                                                            "CDR_EMAIL = @email, CDR_PASS = @pass Where CDR_ID = @id", conn);
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
                        updateCommand.Parameters.Add("id", System.Data.SqlDbType.Int).Value = Convert.ToInt32(cLog.IdNumber);
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

        cLog = new InSideLogIn(loginID, pass1, lName, tT);
    }
}