<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="register">
        <div class="container">
            <h2>Register Here</h2>
            <div class="login-form-grids">
                <h5>Profile Information</h5>
                <asp:TextBox ID="txtFname" runat="server" Placeholder="First Name..." required=" "></asp:TextBox><br />
                <asp:TextBox ID="txtLname" runat="server" Placeholder="Last Name..." required=" "></asp:TextBox>

                <h6>Login Information</h6>
                <asp:TextBox ID="txtUname" runat="server" Placeholder="Username..." required=" "></asp:TextBox><br />
                <asp:TextBox ID="txtEmail" runat="server" Placeholder="Email Address..." required=" "></asp:TextBox><br />
                <asp:TextBox ID="txtPass" runat="server" Placeholder="Password..." required=" "></asp:TextBox><br />
                <asp:DropDownList ID="DDLForgetQues" runat="server" Height="30px" Width="420px">
                    <asp:ListItem>Select-Security-Question</asp:ListItem>
                    <asp:ListItem>What is your nationality</asp:ListItem>
                    <asp:ListItem>what is your pet&#39;s name</asp:ListItem>
                    <asp:ListItem>what is your favourite color</asp:ListItem>
                </asp:DropDownList><br />
                <br />
                <asp:TextBox ID="txtForgetAns" runat="server" Placeholder="Answer..." required=" "></asp:TextBox><br />
                <div class="register-check-box">
                    <div class="check">
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="I accept all terms &amp; conditions." />
                    </div>
                </div>
                <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
            </div>
            <div class="register-home">
                <a href="Default.aspx">Home</a>
            </div>
        </div>
    </div>
</asp:Content>

