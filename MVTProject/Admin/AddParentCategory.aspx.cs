using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddParentCategory : System.Web.UI.Page
{
    DataClassesDataContext d;
    public void show()
    {
        d = new DataClassesDataContext();
        var dd = d.tbl_MainCategories.OrderBy(a => a.Id);
        ParentCatView.DataSource = dd;
        ParentCatView.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        show();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        d = new DataClassesDataContext();
        tbl_MainCategory p = new tbl_MainCategory();
        p.Catname = txtName.Text;
        p.desc = txtDesc.Text;
        p.dateon = DateTime.Now;
        d.tbl_MainCategories.InsertOnSubmit(p);
        d.SubmitChanges();
        Response.Write("<script>alert('Parent Category Added Successfully')</script>");
        show();
    }
}