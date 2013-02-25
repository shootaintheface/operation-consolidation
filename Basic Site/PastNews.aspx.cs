using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Basic_Site_PastNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        try
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Image img = (Image)e.Item.FindControl("Image4");
                Label lbl = (Label)e.Item.FindControl("lblimgID");
                img.ImageUrl = "~/ImageHandler.ashx?imgID=" + lbl.Text;
            }
        }
        catch (Exception ex)
        {
            throw;
        }
    }
}