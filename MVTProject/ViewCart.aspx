<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="ViewCart.aspx.cs" Inherits="ViewCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- breadcrumbs -->
    <div class="col-md-12">
        <div class="breadcrumbs">
            <div class="container">
                <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                    <li><a href="Default.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                    <li class="active"><span class="fa fa-cart-arrow-down" aria-hidden="true"></span>My Cart</li>
                </ol>
            </div>
        </div>
    </div>
    <!-- //breadcrumbs -->

    <div class="checkout">
        <div class="container">
            <div class="checkout-right">
                <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView1_RowDataBound1" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" DeleteText="<img src='images/close_1.png' alt='Delete' />"  />
                        <asp:BoundField DataField="ProductID" HeaderText="Product ID" />
                        <asp:BoundField DataField="pname" HeaderText="Product Name" />
                        <asp:BoundField DataField="Price" HeaderText="Price" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                        <asp:BoundField DataField="size" HeaderText="Size" />
                        <asp:BoundField DataField="color" HeaderText="Color" />
                        <asp:ImageField DataImageUrlField="imgthumb" HeaderStyle-HorizontalAlign="Center" HeaderText="Image" DataImageUrlFormatString="~/ProductImg/{0}">

                            <ControlStyle Width="80" Height="100" />
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        </asp:ImageField>
                        <asp:BoundField HeaderText="Total Amount" DataField="qty" />
                        <asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate><asp:TextBox runat="server" Text='<%#Eval("Quantity") %>' ID="txtQty" ></asp:TextBox>
                                <asp:LinkButton runat="server" CommandArgument='<%#Eval("CartID") %>' OnCommand="LBUpdate_Command" ID="LBUpdate">Update</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#990000" HorizontalAlign="Center" Font-Bold="True" ForeColor="White" />
                    <RowStyle HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" HorizontalAlign="Center" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" BackColor="#FFFBD6" ForeColor="#333333"></RowStyle>

                    <SelectedRowStyle BackColor="#FFCC66" ForeColor="Navy" Font-Bold="True" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <br />
                <asp:Label ID="LblGrandTotal" runat="server" Text=""></asp:Label>
                <asp:Button Text="Continue Shopping" ID="btnConShop" CssClass="btn" runat="server" BackColor="#FFCC99" Font-Bold="True" />&nbsp;
                <asp:Button Text="Checkout" ID="Btncheckout" CssClass="btn" runat="server" BackColor="#CC0000" Font-Bold="True" ForeColor="#99FF99" />&nbsp;
            </div>
        </div>
    </div>
</asp:Content>

