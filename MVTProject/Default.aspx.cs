using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    DataClassesDataContext d;

    public void show()
    {
        d = new DataClassesDataContext();
        var dd = d.showProduct();
        Repeater1.DataSource = dd;
        Repeater1.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        show();
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }

    protected void AddCart_Command(object sender, CommandEventArgs e)
    {
        d = new DataClassesDataContext();
        tbl_ShoppingCart s = new tbl_ShoppingCart();
        tbl_Product p = new tbl_Product();
        if (Session["cart"] == null)
        {
            Session["cart"] = DateTime.Now.TimeOfDay;
            //ViewState["sessionid"] = Session["cart"];
        }
        if (Session["cart"] != null)
        {
            var productExist = d.tbl_ShoppingCarts.Where(a => a.ProductID == int.Parse(e.CommandArgument.ToString()) && a.SessionID == Session["cart"].ToString()).ToList();
            if (productExist.Count > 0)
            {
                Response.Write("<script>alert('Product already added in the cart..')</script>");
            }
            else
            {

                var getproduct = d.tbl_Products.Where(a => a.Id == int.Parse(e.CommandArgument.ToString())).ToList();
                if (getproduct.Count > 0)
                    foreach (var item in getproduct)
                    {
                        s.CartID = new Random().Next(0, 999999);
                        s.DateAdded = DateTime.Now;
                        s.Price = item.price;
                        s.ProductID = item.Id;
                        s.Quantity = 1;
                        s.SessionID = Session["cart"].ToString();
                        d.tbl_ShoppingCarts.InsertOnSubmit(s);
                        d.SubmitChanges();
                        Response.Write("<script>alert('Product added in the cart successfuly...')</script>");
                    }
            }

        }
        
    }
}