using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class EditUserProfile : System.Web.UI.Page
{
    DataClassesDataContext d;
    string fname = null, lname = null,gen;

    public string get_userID()
    {
        string userid = "";
        MembershipUser u = Membership.GetUser(Session["user"].ToString(),true);
        Guid uid = (Guid)u.ProviderUserKey;
        return userid = uid.ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
                string uid = get_userID();
                d = new DataClassesDataContext();
                var dd = d.tbl_UserProfiles.Where(a => a.Uid == uid).ToList();
                if (dd.Count > 0)
                {
                    foreach (var item in dd)
                    {
                        txtFname.Text = item.firstname;
                        txtLname.Text = item.lastname;
                    }
                }

           
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (RBMale.Checked == true)
        {
            gen = RBMale.Text;
        }
        else
        {
            gen = RBFemale.Text;
        }
        string uid = get_userID();
        d = new DataClassesDataContext();
        var dd = d.tbl_UserProfiles.Where(a => a.Uid ==uid).Single();
        dd.firstname = txtFname.Text;
        dd.lastname = txtLname.Text;
        dd.gender = gen;
        dd.email = txtEmail.Text;
        dd.mobile = txtMobile.Text;
        dd.state = txtState.Text;
        dd.deliveryaddress = txtAddress.Text;
        dd.pincode = int.Parse(txtPincode.Text);
        d.SubmitChanges();
    }
}