<%@ Page Title="" Language="C#" MasterPageFile="AdminMaster.master" AutoEventWireup="true" CodeFile="AddSubCategory.aspx.cs" Inherits="AddSubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- breadcrumbs -->
    <div class="col-md-10">
    <div class="breadcrumbs">
        <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                <li><a href="AdminHome.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                <li class="active">Add Sub Category</li>
            </ol>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <!-- Sub Category Add form -->
    <div class="login">
        <div class="container">
             <h2>Add Sub Category</h2>

            <div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">
                <asp:DropDownList ID="DDLPCat" runat="server" Width="100%"></asp:DropDownList>
                <asp:TextBox ID="txtName" runat="server" placeholder="Sub Category Name" required=" "></asp:TextBox>
                <asp:TextBox ID="txtDesc" runat="server" placeholder="Description" required=" "></asp:TextBox>
                <br />
                <asp:Button ID="btnSave" runat="server" Text="Add Sub Category" OnClick="btnSave_Click"  />
            </div>
            <br />
            <br />
            <br />
            <asp:GridView ID="SubCatView" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" Width="100%">
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
    <!-- //Sub Category Add form -->
</asp:Content>

