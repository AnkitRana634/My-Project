using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Text;

/// <summary>
/// Summary description for mailservice
/// </summary>
public class mailservice
{
    public mailservice()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static string PassRecover(string to, string pass, string name)
    {
        string msg = null;
        StringBuilder sb = new StringBuilder();

        sb.AppendLine("<body>");
        sb.AppendLine("<div style = 'width:400px;padding:1px 10px;height:300px;background-color:#699eb0;border:5px solid #051b5a;border-radius:5px;'>");

        sb.AppendLine("<h2> Hi !! <font color='red'>" + name + "</font> welcome to password recovery.</h2>");

        sb.AppendLine("<p> This mail is for password recovery.</p>");

        sb.AppendLine("<p> Kindly do not share this email to anybody.</p>");

        sb.AppendLine("<p> Your Username: " + name + " </p>");

        sb.AppendLine("<p> Your Password: " + pass + " </p>");
        sb.AppendLine("<p> Regards,</p><br/>");

        sb.AppendLine("<p> Digital Bazaar.</p>");

        sb.AppendLine("<p><a href = 'http://www.digitalbazaar.com'> www.digitalbazaar.com </a></p>");

        sb.AppendLine("<p> 9898989898 </p>");
        sb.AppendLine("<p> Laal Kuaan,</p>");
        sb.AppendLine("<p> Ghaziabad - 120021.</p>");

        sb.AppendLine("</div>");
        sb.AppendLine("</body>");
        msg = sendmail(to, "Password Recovery", sb.ToString());
        return msg;

    }

    public static string MailRegister(string To, string name, string pass, string username )
    {
        string msg = null;
        StringBuilder sb = new StringBuilder();
        sb.AppendLine("<body>");

        sb.AppendLine("<div style = 'width:400px; height:500px;border:5px solid #ff6a00;border-radius:5px;background-color:#f1837c;margin:0 auto;padding:1px 10px;'>");

        sb.AppendLine("<h3> Hello !! " + name + " </h3><br/>");

        sb.AppendLine("<p> Thank you for registering with us.you are successfully registered to <a href = '#' > DigitalBazaar </a>. </p>");

        sb.AppendLine("<p> Your Username : <b> " + username + " </b></p>");

        sb.AppendLine("<p> Your Password : <b> " + pass + " </b></p>");

        sb.AppendLine("<p> Thank you again for registration.If you have any querry kindly go through our contact us forum. </p>");

        sb.AppendLine("<p> Regards,</p><br/>");

        sb.AppendLine("<p> Digital Bazaar.</p>");

        sb.AppendLine("<p><a href = 'http://www.digitalbazaar.com'> www.digitalbazar.com </a ></p>");

        sb.AppendLine("<p > 9898989898 </ p >");
        sb.AppendLine("<p > Laal Kuaan,</ p >");
        sb.AppendLine("<p > Ghaziabad - 120021.</ p >");
        sb.AppendLine("</div >");
        sb.AppendLine("</body>");

        msg = sendmail(To, "Registration Acknowledgement.", sb.ToString());
        return msg;
    }

    public static string sendmail(string to, string sub, string body)
    {
        try
        {
            MailMessage m = new MailMessage();
            m.From = new MailAddress("ankit@gmail.com");
            m.To.Add(new MailAddress(to));
            m.Subject = sub;
            m.Body = body;
            m.IsBodyHtml = true;

            SmtpClient sm = new SmtpClient("smtp.gmail.com");
            sm.Credentials = new NetworkCredential("ankit.rana944@gmail.com", "@nk1t1002");
            sm.Port = 587;
            sm.EnableSsl = true;
            sm.DeliveryMethod = SmtpDeliveryMethod.Network;
            sm.Send(m);
            return "Mail sent successfuly...";
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
    }
}