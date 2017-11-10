using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddSubCategory : System.Web.UI.Page
{
    DataClassesDataContext d;
    public void show()
    {
        d = new DataClassesDataContext();
        var dd = d.tbl_SubCategories.OrderBy(a => a.Id);
        SubCatView.DataSource = dd;
        SubCatView.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        d = new DataClassesDataContext();
        var dd = d.tbl_MainCategories.OrderBy(a => a.Id);
        if (!IsPostBack)
        {
            DDLPCat.Items.Insert(0, "Select-Parent-Category");
            foreach (var item in dd)
            {
                DDLPCat.Items.Insert(1, new ListItem(item.Catname, item.Id.ToString()));

            }
        }
        show();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        d = new DataClassesDataContext();
        tbl_SubCategory s = new tbl_SubCategory();
        s.Scatname = txtName.Text;
        s.desc = txtDesc.Text;
        s.pid = int.Parse(DDLPCat.SelectedValue.ToString());
        s.dateon = DateTime.Now;
        d.tbl_SubCategories.InsertOnSubmit(s);
        d.SubmitChanges();
        Response.Write("<script>alert('Sub Category Added Successfully')</script>");
        show();
    }
}