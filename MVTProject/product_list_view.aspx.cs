using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class testviewproduct : System.Web.UI.Page
{

    DataClassesDataContext d;
    
    public void show()
    {
        string cname = Request.QueryString["catname"].ToString();
        string scname = Request.QueryString["scatname"].ToString();
        //string scatname = Request.QueryString["scatname"].ToString();
        //string[] scat = scatname.Split('.');
        //Response.Write("" + cname);
        //Response.Write("" + scname);
        d = new DataClassesDataContext();
        var dd = d.product_list(cname, scname, 1);
        Repeater1.DataSource = dd;
        Repeater1.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        show();

    }


}