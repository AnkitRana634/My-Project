<%@ Page Title="" Language="C#" MasterPageFile="AdminMaster.master" AutoEventWireup="true" CodeFile="AddParentCategory.aspx.cs" Inherits="AddParentCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%--<script src="../js/jquery-2.2.3.min.js"></script>
    <script src="../js/jquery.validationEngine-en.js"></script>
    <script src="../js/jquery.validationEngine.js"></script>
    <link href="../js/validationEngine.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            jQuery(this).validationEngine();
        });
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- breadcrumbs --><div class="col-md-10" >
    <div class="breadcrumbs" >
        <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                <li><a href="AdminHome.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li class="active">Add Parent Category</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <!-- Parent Category Add form -->
    <div class="login" >
        <div class="container">
            <h2>Add Parent Category</h2>
            
            <div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">
                <asp:TextBox ID="txtName" runat="server" placeholder="Parent Category Name" required=" "></asp:TextBox>
                <asp:TextBox ID="txtDesc" runat="server" placeholder="Description" required=" "></asp:TextBox>
                <br />
                <asp:Button ID="btnSave" runat="server" Text="Add Parent Category" OnClick="btnSave_Click" />
            </div>
            <br />
            <br />
            <br />
            <asp:GridView ID="ParentCatView" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" Width="100%">
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
            </asp:GridView>
        
        </div>
    </div>
        </div>
    <!-- //Parent Category Add form -->
</asp:Content>

