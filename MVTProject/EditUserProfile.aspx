<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="EditUserProfile.aspx.cs" Inherits="EditUserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <!-- breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                <li><a href="Default.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li class="active">Edit Your Profile Here</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->
    
    <div class="col-md-12" style="background-color:white">
        <div class="col-md-1"></div>
        <div class="login col-md-10">
            <div class="form-group" >
                <h2>Edit Profile</h2><br /><br />
                
                <div class="row">
                    <div class="col-sm-6 form-group " >

                        <label>First Name</label><br />
                        <asp:TextBox ID="txtFname" runat="server"></asp:TextBox>

                    </div>
                    <div class="col-sm-6 form-group">

                        <label>Last Name</label><br />
                        <asp:TextBox ID="txtLname" runat="server"></asp:TextBox>

                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 form-group">

                        <label>Gender</label><br />
                        <asp:RadioButton ID="RBMale" runat="server" GroupName="gender" Text="Male"/>
                        <asp:RadioButton ID="RBFemale" runat="server" GroupName="gender" Text="Female" />
                    </div>
                    <div class="col-sm-6 form-group">
                        
                        <label>Email Address</label><br />
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>

                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 form-group">

                        <label>Mobile No.</label><br />
                        <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>

                    </div>
                    <div class="col-sm-6 form-group" >

                        <label>State</label><br />
                        <asp:TextBox ID="txtState" runat="server"></asp:TextBox>

                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 form-group">

                        <label>Delivery Address</label><br />
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Width="30%" Rows="3"></asp:TextBox>

                    </div>
                     <div class="col-sm-6 form-group" >

                        <label>Pincode</label><br />
                        <asp:TextBox ID="txtPincode" runat="server"></asp:TextBox>

                    </div>
                </div>
                <div class="row">
                   
                    <div class="row">
                        <div class="col-sm-12  ">
                            <div class="login-form-grids   " style="background-color:white">
                            <asp:Button ID="btnSave" runat="server"  Text="Save Profile" OnClick="btnSave_Click" />
                                </div>
                        </div>

                    </div>
                </div>
                
            </div>
        </div>
        <div class="col-md-1"></div>
    </div>
    
</asp:Content>

