using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditSubCategory : System.Web.UI.Page
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
   

    protected void DDLPCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        d = new DataClassesDataContext();
        var dd = d.tbl_SubCategories.Where(a => a.pid==int.Parse(DDLPCat.SelectedValue));
        DDLSCat.Items.Clear();
        DDLSCat.Items.Insert(0, "Select-Sub-Category");
            foreach (var item in dd)
            {
                DDLSCat.Items.Insert(1, new ListItem(item.Scatname, item.Id.ToString()));

            }
        
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        d = new DataClassesDataContext();
        var dd = d.tbl_SubCategories.Where(a => a.Id == int.Parse(DDLSCat.SelectedValue.ToString())).Single();
        dd.Scatname = txtName.Text;
        dd.desc = txtDesc.Text;
        d.SubmitChanges();
        Response.Write("<script>alert('Sub Category Updated Successfully.')</script>");
        show();
    }

    protected void SubCatView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = SubCatView.Rows[e.RowIndex].Cells[1].Text;
        d = new DataClassesDataContext();
        var dd = d.tbl_SubCategories.Where(a => a.Id ==int.Parse(id)).Single();
        d.tbl_SubCategories.DeleteOnSubmit(dd);
        d.SubmitChanges();
        SubCatView.EditIndex = -1;
        Response.Write("<script>alert('Sub Category Deleted Successfully.')</script>");
        show();
    }

    protected void DDLSCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        d = new DataClassesDataContext();
        var dd = d.tbl_SubCategories.Where(a => a.pid == int.Parse(DDLPCat.SelectedValue));
        foreach (var item in dd)
        {
            txtName.Text = item.Scatname;
            txtDesc.Text = item.desc;
        }
    }
}