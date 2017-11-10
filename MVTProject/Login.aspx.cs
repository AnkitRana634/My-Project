using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (Membership.ValidateUser(txtUname.Text, txtPass.Text))
        {
            if (Roles.IsUserInRole(txtUname.Text,"Admin"))
            {
                FormsAuthentication.SetAuthCookie(txtUname.Text, true);
                FormsAuthenticationTicket tk =new FormsAuthenticationTicket(1,txtUname.Text,DateTime.Now,DateTime.Now.AddMinutes(30),true,"Admin");
                HttpCookie c = new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(tk));
                Response.Cookies.Add(c);
                Session["Admin"] = txtUname.Text;
                Response.Redirect("~/Admin/AdminHome.aspx");
            }
            if (Roles.IsUserInRole(txtUname.Text, "User"))
            {
                FormsAuthentication.SetAuthCookie(txtUname.Text, true);
                FormsAuthenticationTicket tk = new FormsAuthenticationTicket(1, txtUname.Text, DateTime.Now, DateTime.Now.AddMinutes(30), true, "User");
                HttpCookie c = new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(tk));
                Response.Cookies.Add(c);
                Session["User"] = txtUname.Text;
                Response.Redirect("Default.aspx");
            }
        }
    }
}