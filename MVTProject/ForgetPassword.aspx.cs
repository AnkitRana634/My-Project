using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class ForgetPassword : System.Web.UI.Page
{

    string pass=null;
    string passQues = null;
    
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        MembershipUser u = Membership.GetUser(txtUname.Text, false);

        if (u == null)
        {
            Response.Write("<script>alert('Invalid User. Please enter valid username')</script>");
        }
        else
        {
            ViewState["passQues"] = u.PasswordQuestion.ToString();
            txtForgetQues.Visible = true;
            txtForgetQues.Text = ViewState["passQues"].ToString();
            txtForgetAns.Visible = true;
            btnSubmit.Visible = false;
            btnSendMail.Visible = true;
            
        }
        
    }

    protected void btnSendMail_Click(object sender, EventArgs e)
    {
        MembershipUser u = Membership.GetUser(txtUname.Text, false);
        string pass = u.GetPassword(txtForgetAns.Text);
        string msg = mailservice.PassRecover(u.Email, pass, u.UserName);
        Response.Write("<script>alert('" + msg + "')</script>");
    }
}