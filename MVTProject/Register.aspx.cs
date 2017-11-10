using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Register : System.Web.UI.Page
{
    DataClassesDataContext d;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Roles.RoleExists("Admin"))
        {
            Roles.CreateRole("Admin");
        }
        if (!Roles.RoleExists("User"))
        {
            Roles.CreateRole("User");
        }
    }

    public string get_userID()
    {
        string userid = "";
        MembershipUser u = Membership.GetUser(txtUname.Text, true);
        Guid uid = (Guid)u.ProviderUserKey;
        return userid = uid.ToString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (CheckBox1.Checked)
        {
            try
            {
                MembershipCreateStatus cs = MembershipCreateStatus.Success;
                MembershipUser mu = Membership.CreateUser(txtUname.Text, txtPass.Text, txtEmail.Text, DDLForgetQues.SelectedItem.ToString(), txtForgetAns.Text, true, out cs);
                if (mu.IsApproved)
                {
                    Roles.AddUserToRole(txtUname.Text, "User"); 
                }
                if (Membership.ValidateUser(txtUname.Text, txtPass.Text))
                {
                    if (Roles.IsUserInRole(txtUname.Text, "User"))
                    {
                        string uid = get_userID();
                        d = new DataClassesDataContext();
                        tbl_UserProfile up = new tbl_UserProfile();
                        up.Uid = uid;
                        up.lastname = txtLname.Text;
                        up.firstname = txtFname.Text;
                        d.tbl_UserProfiles.InsertOnSubmit(up);
                        d.SubmitChanges();

                        string msg = mailservice.MailRegister(txtEmail.Text, txtFname.Text + " " + txtLname.Text, txtPass.Text, txtUname.Text);


                        Response.Write("<script>alert('User Added Successfuly... " + msg + "')</script>");

                    }
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex + ")</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Please accept the terms & conditions then continue registering.')</script>");
        }
    }
}