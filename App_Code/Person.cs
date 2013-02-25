using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Person
/// </summary>
public class Person
{
    private string fName, lName, phone, ako, email, mI;

    public string MI
    {
        get { return mI; }
        set { mI = value; }
    }

    public string Email
    {
        get { return email; }
        set { email = value; }
    }

    public string Ako
    {
        get { return ako; }
        set { ako = value; }
    }

    public string Phone
    {
        get { return phone; }
        set { phone = value; }
    }
    public string FName
    {
        get { return fName; }
        set { fName = value; }
    }
    public string LName
    {
        get { return lName; }
        set { lName = value; }
    } 

	public Person()
	{
	}
}