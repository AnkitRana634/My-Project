<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="ForgetPassword.aspx.cs" Inherits="ForgetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <!-- breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                <li><a href="Default.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li class="active">Login Page</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <!-- ForgetPassword -->
    <div class="login">
        <div class="container">
            <h2>Forget Password Form</h2>

            <div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">
                <asp:TextBox ID="txtUname" runat="server" placeholder="Username" ></asp:TextBox>
                <asp:TextBox ID="txtForgetQues" runat="server"  required=" " Visible="False"></asp:TextBox>
                <asp:TextBox ID="txtForgetAns" runat="server" placeholder="Your Answer" required=" "  Visible="False"></asp:TextBox>
                
                <div class="forgot">
                    <a href="Login.aspx">Login Here</a>
                </div>
                <asp:Button ID="btnSendMail" runat="server" Text="Send Password To Email" Visible="false" OnClick="btnSendMail_Click"/>
                <asp:Button ID="btnSubmit" runat="server" Text="Validate User" OnClick="btnSubmit_Click" />
            </div>
            <h4>For New People</h4>
            <p><a href="Register.aspx">Register Here</a> (Or) go back to <a href="Default.aspx">Home<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a></p>
        </div>
    </div>
    <!-- //ForgetPassword -->
</asp:Content>

