using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewCart : System.Web.UI.Page
{
    int qty;
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCart();
    }

    public void BindCart()
    {
        DataClassesDataContext d = new DataClassesDataContext();
        if (Session["cart"] != null)
        {
            var dd = d.Shop_Cart_View(Session["cart"].ToString(), 1).ToList();
            GridView1.DataSource = dd;
            GridView1.DataBind();

        }
        else
        {
            Label1.Visible = true;
            Label1.Text = "Cart Is Empty .You can continue shopping.";
        }
    }
    public double grandtotal=0,subtotal=0;
   

    protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            double qty = 0, price = 0;

            qty = double.Parse(DataBinder.Eval(e.Row.DataItem, "Quantity").ToString());
            price = double.Parse(DataBinder.Eval(e.Row.DataItem, "Price").ToString());
            subtotal = qty * price;
            e.Row.Cells[8].Text = subtotal.ToString();
            grandtotal = grandtotal + (qty * price);

        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[1].Text = "Grand Total";
            e.Row.Cells[1].Font.Bold = true;

            e.Row.Cells[8].Text = grandtotal.ToString();
            e.Row.Cells[8].Font.Bold = true;
            //TotalAmount = Convert.ToDouble(e.Row.Cells[2].Text);
        }

    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataClassesDataContext d = new DataClassesDataContext();
        string pid = GridView1.Rows[e.RowIndex].Cells[1].Text;
        var dd = d.tbl_ShoppingCarts.Where(a => a.ProductID == int.Parse(pid) && a.SessionID == Session["cart"].ToString()).Single();
        d.tbl_ShoppingCarts.DeleteOnSubmit(dd);
        d.SubmitChanges();
        BindCart();
    }

    protected void LBUpdate_Command(object sender, CommandEventArgs e)
    {
        LinkButton btn = sender as LinkButton;
        GridViewRow row = btn.NamingContainer as GridViewRow;
        TextBox textqty = GridView1.Rows[row.RowIndex].Cells[4].FindControl("txtQty") as TextBox;
        //ss.text have my requested value
        qty = int.Parse(textqty.Text);
        DataClassesDataContext d = new DataClassesDataContext();
        var dd = d.tbl_ShoppingCarts.Where(a => a.CartID==int.Parse(e.CommandArgument.ToString())).Single();
        dd.Quantity = qty;
        d.SubmitChanges();
        Response.Write("Quntity Updated");

    }



    
}