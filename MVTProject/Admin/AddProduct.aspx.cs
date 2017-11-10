using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddProduct : System.Web.UI.Page
{
    DataClassesDataContext d;

    public void show()
    {
        d = new DataClassesDataContext();
        var dd = d.showProduct();
        GridView1.DataSource = dd;
        GridView1.DataBind();
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

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        int m =new Random().Next(1,999999);
        if (FileUpload1.HasFile)
        {
            int fsize = FileUpload1.PostedFile.ContentLength;
            if (fsize > 50000)
            {
                Response.Write("<script>alert('File should not be more than 50kb.')</script>");
            }
            else
            {
                string fname = FileUpload1.FileName;
                string[] nfname = fname.Split('.');
                HiddenField1.Value = m + "thumb" + "." + nfname[1];
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/ProductImg/" + HiddenField1.Value));
                Image1.ImageUrl = "~/ProductImg/" + HiddenField1.Value;
            }
        }
        else
        {
            Response.Write("<script>alert('File must be uploaded.')</script>");
        }

        if (FileUpload2.HasFile)
        {
            int fsize = FileUpload2.PostedFile.ContentLength;
            if (fsize > 350000)
            {
                Response.Write("<script>alert('File should not be more than 350kb.')</script>");
            }
            else
            {
                string fname = FileUpload2.FileName;
                string[] nfname = fname.Split('.');
                HiddenField2.Value = m + "front" + "." + nfname[1];
                FileUpload2.PostedFile.SaveAs(Server.MapPath("~/ProductImg/" + HiddenField2.Value));
                Image2.ImageUrl = "~/ProductImg/" + HiddenField2.Value;
            }
        }
        else
        {
            Response.Write("<script>alert('File must be uploaded.')</script>");
        }

        if (FileUpload3.HasFile)
        {
            int fsize = FileUpload3.PostedFile.ContentLength;
            if (fsize > 350000)
            {
                Response.Write("<script>alert('File should not be more than 350kb.')</script>");
            }
            else
            {
                string fname = FileUpload3.FileName;
                string[] nfname = fname.Split('.');
                HiddenField3.Value = m + "back" + "." + nfname[1];
                FileUpload3.PostedFile.SaveAs(Server.MapPath("~/ProductImg/" + HiddenField3.Value));
                Image3.ImageUrl = "~/ProductImg/" + HiddenField3.Value;
            }
        }
        else
        {
            Response.Write("<script>alert('File must be uploaded.')</script>");
        }
    }

    protected void DDLPCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        d = new DataClassesDataContext();
        var dd = d.tbl_SubCategories.Where(a => a.pid == int.Parse(DDLPCat.SelectedValue));
        DDLSCat.Items.Clear();
        DDLSCat.Items.Insert(0, "Select-Sub-Category");
        foreach (var item in dd)
        {
            DDLSCat.Items.Insert(1, new ListItem(item.Scatname, item.Id.ToString()));

        }

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        d = new DataClassesDataContext();
        tbl_Product p = new tbl_Product();
        p.pname = txtPname.Text;
        p.price = decimal.Parse(txtPrice.Text);
        p.qty = int.Parse(txtQty.Text);
        p.size = txtSize.Text;
        p.material = txtMaterial.Text;
        p.color = txtColor.Text;
        p.desc = txtDesc.Text;
        p.imgthumb = HiddenField1.Value;
        p.imgfront = HiddenField2.Value;
        p.imgback = HiddenField3.Value;
        p.pid = int.Parse(DDLPCat.SelectedValue.ToString());
        p.sid = int.Parse(DDLSCat.SelectedValue.ToString());
        p.dateon = DateTime.Now;
        d.tbl_Products.InsertOnSubmit(p);
        d.SubmitChanges();
        Response.Write("<script>alert('Product added successfully..')</script>");
        show();
    }
}