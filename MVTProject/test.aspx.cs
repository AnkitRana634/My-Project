using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["cart"] != null)
        {
            string sessionId = Session["cart"].ToString();
            DataClassesDataContext d = new DataClassesDataContext();
            var dd = d.Shop_Cart_View(sessionId, 1);
            Repeater1.DataSource = dd;
            Repeater1.DataBind();
        }
        else
        {
            Label1.Visible = true;
            Label1.Text = "Cart is Empty to add Product continue shopping";
        }
    }
}