using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


/// <summary>
/// Summary description for FileManagerSystem
/// </summary>
public class FileManagerSystem
{
    #region variables
    private string name, type;
    private System.Web.HttpResponse Response;

    public string Type
    {
        get { return type; }
        set { type = value; }
    }

    public string Name
    {
        get { return name; }
        set { name = value; }
    }
    private Guid id;

    public Guid Id
    {
        get { return id; }
        set { id = value; }
    }
    private byte[] content;

    public byte[] Content
    {
        get { return content; }
        set { content = value; }
    }
    #endregion

    public FileManagerSystem()
	{
        
	}

}