using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class main : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.MaintainScrollPositionOnPostBack = true;

        if (Session["User"] != null)
        {
            LBUSerProfile.Visible = true;
            LBLogout.Visible = true;
        }
    }
   
    protected void LBUSerProfile_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("EditUserProfile.aspx");
    }

    protected void LBLogout_Command(object sender, CommandEventArgs e)
    {
        HttpContext.Current.Session.Abandon();
        MembershipUser user = Membership.GetUser(Session["User"].ToString());
        user.IsApproved = false;
        FormsAuthentication.SignOut();
        Response.Redirect("Default.aspx");
    }

    protected void LBUSerProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditUserProfile.aspx");
    }

    protected void LBLogout_Click(object sender, EventArgs e)
    {
        HttpContext.Current.Session.Abandon();
        MembershipUser user = Membership.GetUser(Session["User"].ToString());
        user.IsApproved = false;
        FormsAuthentication.SignOut();
        Response.Redirect("Default.aspx");
    }
}
