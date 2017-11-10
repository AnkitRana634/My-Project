using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditParentCategory : System.Web.UI.Page
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
        d = new DataClassesDataContext();
        var dd = d.tbl_MainCategories.OrderBy(a => a.Id);
        if (!IsPostBack)
        {
            DDLPCat.Items.Insert(0, "Select-Parent-Category");
            foreach (var item in dd)
            {
                DDLPCat.Items.Insert(1,new ListItem(item.Catname,item.Id.ToString()) );

            }
        }
        show();
    }
    

    protected void DDLPCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        d = new DataClassesDataContext();
        var dd = d.tbl_MainCategories.Where(a => a.Id==int.Parse(DDLPCat.SelectedValue.ToString()));
        foreach (var item in dd)
        {
            txtName.Text = item.Catname;
            txtDesc.Text = item.desc;

        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        d = new DataClassesDataContext();
        var dd = d.tbl_MainCategories.Where(a => a.Id == int.Parse(DDLPCat.SelectedValue.ToString())).Single();
        dd.Catname= txtName.Text;
        dd.desc= txtDesc.Text;
        d.SubmitChanges();
        Response.Write("<script>alert('Parent Category Updated Successfully')</script>");
        show();
    }



    protected void ParentCatView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string ID = ParentCatView.Rows[e.RowIndex].Cells[1].Text;
        d = new DataClassesDataContext();
        var dd = d.tbl_MainCategories.Where(a => a.Id == int.Parse(ID)).Single();
        d.tbl_MainCategories.DeleteOnSubmit(dd);
        d.SubmitChanges();
        ParentCatView.EditIndex = -1;
        Response.Write("<script>alert('Parent Category Deleted Successfully')</script>");
        show();
    }
}