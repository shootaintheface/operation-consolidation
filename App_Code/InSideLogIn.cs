using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Login
/// </summary>
public class InSideLogIn
{
    private string loginID, password, lastName, idNumber;
    private bool isLoggedIn;
    private int authority;
    private string accessLevel, tableType;

    #region Properties
    public string LoginID
    {
        get { return loginID; }
    }
    public string Password
    {
        get { return password; }
    }
    public string LastName
    {
        get { return lastName; }
    }
    public int Access
    {
        get { return authority; }
    }
    public string IdNumber
    {
        get { return idNumber; }
    }
    public string AccessLevel
    {
        get { return accessLevel; }
    }
    public string TableType
    {
        get { return tableType; }
    }
    #endregion
    public InSideLogIn(string id, string pass, int auth, string name, string dbID, string tT)
	{
        loginID = id;
        password = pass;
        authority = auth;
        lastName = name;
        idNumber = dbID;
        tableType = tT;
	}

    public InSideLogIn(string id, string pass, string name, string tT)
    {
        loginID = id;
        password = pass;
        lastName = name;
        tableType = tT;
    }

    public InSideLogIn()
    {
    }

    public string PrintAccessLevel()
    {
        switch (this.authority)
        {
            case 0:
                return "User Level Only";
            case 1:
                return "S1 permmsions: Personnel";
            case 2:
                return "TAC permmsions: Class editing";
            case 3:
                return "MSIII: Upload/ Download OPORDs";
            case 4:
                return "Cadre: Class editing/ deleting";
            case 5:
                return "S5: Website editing";
            case 6:
                return "S7: Admin";
            case 7:
                return "Creator: Do what you want";
            default:
                return "Error: Default";
        }
    }
}