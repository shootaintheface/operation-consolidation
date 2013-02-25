using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;

/// <summary>
/// Summary description for NewsClass
/// </summary>
public class NewsClass
{
    private string newsLable, article;

    public string Article
    {
        get { return article; }
        set { article = value; }
    }
    private string id;
    private Bitmap pic;

    public string ID
    {
        get { return id; }
        set { id = value; }
    }

    public Bitmap Pic
    {
        get { return pic; }
        set { pic = value; }
    }
    public string NewsLabe
    {
        get { return newsLable; }
        set { newsLable = value; }
    }

    public NewsClass()
    { }

	public NewsClass(string lbl, Bitmap picture, string Id)
	{
        newsLable = lbl;
        pic = picture;
        id = Id;
	}
}