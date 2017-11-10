using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewProduct : System.Web.UI.Page
{
    DataClassesDataContext d;

    public void show()
    {
        int id = int.Parse(Request.QueryString["id"].ToString()); 
        d = new DataClassesDataContext();
        var dd = d.tbl_Products.Where(a => a.Id == id);
        FormView1.DataSource = dd;
        FormView1.DataBind();
        
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        show();
        d = new DataClassesDataContext();
        var dd = d.showProduct();
        Repeater1.DataSource = dd;
        Repeater1.DataBind();

    }

 


    protected void btnAddCart_Click(object sender, EventArgs e)
    {
        d = new DataClassesDataContext();
        tbl_ShoppingCart s = new tbl_ShoppingCart();
        tbl_Product p = new tbl_Product();
        if (Session["cart"] == null)
        {
            Session["cart"] = DateTime.Now.TimeOfDay;
        }
        if (Session["cart"] != null)
        {
            var productExist = d.tbl_ShoppingCarts.Where(a => a.ProductID == int.Parse(Request.QueryString["Id"]) && a.SessionID == Session["cart"].ToString()).ToList();
            if (productExist.Count > 0)
            {
                Response.Write("<script>alert('Product already added in the cart..')</script>");
            }
            else
            {
                var getproduct = d.tbl_Products.Where(a => a.Id == int.Parse(Request.QueryString["Id"])).ToList();
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
                else
                {
                    Response.Write("<script>alert('Product already added in the cart..')</script>");
                }

            }
        }
        
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

